(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

open Cfg

let default_iterate cfg =
  let () = Random.self_init () in
  let iter_arc arc: unit =
    match arc.arc_inst with
    | CFG_assert (b, ext) ->
      Format.printf "%a@ " Errors.pp_err (AssertFalse, ext, b)
    | _ -> () in
  let iter_node node: unit =
    Format.printf "<%i>: ⊤@ " node.node_id in
  List.iter iter_arc cfg.cfg_arcs;
  Format.printf "Node Values:@   @[<v 0>";
  List.iter iter_node cfg.cfg_nodes;
  Format.printf "@]"


let iterate (module D: Domain.DOMAIN) cfg =
  D.Vars.support := cfg.cfg_vars;
  let () = Random.self_init () in
  let node_map = NodeHash.create (List.length cfg.cfg_nodes) in
  NodeHash.add node_map cfg.cfg_init_entry (D.init ());
  List.iter (
    fun func -> NodeHash.add node_map func.func_entry (D.init ())
  ) cfg.cfg_funcs;

  let worklist = Queue.create () in

  let iter_arc arc =
    let env = NodeHash.find node_map arc.arc_src in
    let new_env = match arc.arc_inst with
    | CFG_assert (b, ext) -> begin
      let env = D.guard env b in
      let trigger_assert = D.guard env (CFG_bool_unary (Abstract_syntax_tree.AST_NOT, b)) in
      (* TODO: not sure of what to do *)
      if not (D.is_bottom trigger_assert) then
        let buf = Buffer.create 50 in
        let fmt = Format.formatter_of_buffer buf in
        Format.fprintf fmt "%a" Errors.pp_err (AssertFalse, ext, b);
        let error_msg = Buffer.contents buf in
        failwith error_msg
      else env
    end
    | CFG_assign (var, exp) -> begin
      D.assign env var exp
    end
    | CFG_call _ -> env
    | CFG_guard b -> D.guard env b
    | CFG_skip _ -> env
    in

    let prev_env = NodeHash.find_opt node_map arc.arc_dst in
    begin match prev_env with
    | Some prev_env ->
      NodeHash.replace node_map arc.arc_dst (D.join prev_env new_env);
      (* new_env is always a subet of prev_env, it is sufficient to check the converse *)
      if not (D.subset prev_env new_env) then
        Queue.add arc.arc_dst worklist;
    | None ->
      NodeHash.replace node_map arc.arc_dst new_env;
      Queue.add arc.arc_dst worklist;
    end;
  in

  let iter_node node =
    List.iter (fun arc -> iter_arc arc) node.node_out
  in

  Queue.add cfg.cfg_init_entry worklist;
  List.iter (fun func ->
    Queue.add func.func_entry worklist;
    NodeHash.add node_map func.func_entry (D.init ())
  ) cfg.cfg_funcs;

  while not (Queue.is_empty worklist) do
    let node = Queue.take worklist in
    try
      iter_node node
    with Failure s ->
      Format.printf "%s@." s
  done;

  Format.printf "Node values:@   @[<v 0>";
  List.iter (fun node ->
    let top = D.top () in

    let env = match NodeHash.find_opt node_map node with
    | Some env -> env
    | None -> top
    in
    Format.printf "<%i>: %a@ " node.node_id D.print env
  ) cfg.cfg_nodes;
  Format.printf "@]";