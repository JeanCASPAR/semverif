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


let find_cycle_head cfg =
  let n = List.length cfg.cfg_nodes in
  let visited = Array.make (n + 1) false in
  let cycle_head = Array.make (n + 1) false in

  let worklist = Queue.create () in
  Queue.add cfg.cfg_init_entry worklist;
  List.iter (fun func ->
    Queue.add func.func_entry worklist
  ) cfg.cfg_funcs;

  let iter node =
    visited.(node.node_id) <- true;
    List.iter (fun out_arc ->
      let next_node = out_arc.arc_dst in
      if visited.(next_node.node_id) then
        cycle_head.(node.node_id) <- true
      else
        Queue.add next_node worklist
    ) node.node_out
  in while not (Queue.is_empty worklist) do
    let node = Queue.take worklist in
    iter node
  done;
  cycle_head

(* compute all consts + {-1, 0, 1} *)
let find_consts cfg =
  let consts = ref [] in

  let rec aux_int x = match x with
  | CFG_int_unary (_, x) -> aux_int x
  | CFG_int_binary (_, x, y) -> aux_int x; aux_int y
  | CFG_int_var _ -> ()
  | CFG_int_const t -> consts := Z.pred t :: t :: Z.succ t :: !consts
  | CFG_int_rand (a, b) -> consts :=
    Z.pred a :: a :: Z.succ a :: Z.pred b :: b :: Z.succ b :: !consts
  in
  let rec aux_bool b = match b with
  | CFG_bool_unary (_, b) -> aux_bool b
  | CFG_bool_binary (_, b1, b2) -> aux_bool b1; aux_bool b2
  | CFG_compare (_, x, y) -> aux_int x; aux_int y
  | _ -> ()
  in
  let iter arc =
    match arc.arc_inst with
    | CFG_assert (b, _) -> aux_bool b
    | CFG_assign (_, x) -> aux_int x
    | CFG_guard b -> aux_bool b
    | _ -> ()
    
  in List.iter iter cfg.cfg_arcs;
  List.sort_uniq Z.compare !consts

let iterate (module D: Domain.DOMAIN) cfg =
  D.Vars.support := cfg.cfg_vars;
  D.Consts.support := find_consts cfg;
  let cycle_head = find_cycle_head cfg in
  let () = Random.self_init () in
  let node_map = NodeHash.create (List.length cfg.cfg_nodes) in
  (* initialize to bottom *)
  List.iter (fun node ->
    NodeHash.add node_map node (D.bottom ())
    ) cfg.cfg_nodes;
  (* arcs[arc.arc_id] = arc.arc_inst(arc.arc_src) *)
  let arcs = Array.make (List.length (cfg.cfg_arcs) + 1) (D.bottom ()) in
  let modified = ref true in

  (* initialize entries to 0 *)
  NodeHash.add node_map cfg.cfg_init_entry (D.init ());
  List.iter (
    fun func -> NodeHash.add node_map func.func_entry (D.init ())
  ) cfg.cfg_funcs;

  let iter_arc arc =
    let src_env = NodeHash.find node_map arc.arc_src in
    let dst_env = match arc.arc_inst with
    | CFG_assert (b, _) -> begin
      D.guard src_env b
    end
    | CFG_assign (var, exp) -> begin
      D.assign src_env var exp
    end
    | CFG_call _ -> src_env
    | CFG_guard b -> D.guard src_env b
    | CFG_skip _ -> src_env
    in

    let old_env = arcs.(arc.arc_id) in
    (* old_env is always a subet of env, it is sufficient to check the converse *)
    if not (D.subset dst_env old_env) then
      modified := true;
    arcs.(arc.arc_id) <- dst_env;
  in

  let iter_node node =
    let old_env = NodeHash.find node_map node in
    let in_env = List.fold_left (fun env arc ->
      let src_env = arcs.(arc.arc_id) in
      D.join env src_env
    ) old_env node.node_in in
    (* widening ? *)
    let new_env = if cycle_head.(node.node_id)
    then D.widen old_env in_env
    else in_env
    in
    NodeHash.replace node_map node new_env;
  in

  List.iter (fun func ->
    NodeHash.add node_map func.func_entry (D.init ())
  ) cfg.cfg_funcs;

  while !modified do
    modified := false;
    List.iter iter_arc cfg.cfg_arcs;
    List.iter iter_node cfg.cfg_nodes;
  done;

  List.iter (fun arc ->
    match arc.arc_inst with
    | CFG_assert (b, ext) ->
      let env = NodeHash.find node_map arc.arc_src in
      let trigger_assert = D.guard env (CFG_bool_unary (Abstract_syntax_tree.AST_NOT, b)) in
      if not (D.is_bottom trigger_assert) then
        Format.printf "%a@." Errors.pp_err (AssertFalse, ext, b)
    | _ -> ()
  ) cfg.cfg_arcs;

  Format.printf "Node values:@   @[<v 0>";
  List.iter (fun node ->
    let env = NodeHash.find node_map node in
    Format.printf "<%i>: %a@ " node.node_id D.print env
  ) cfg.cfg_nodes;
  Format.printf "@]";