(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

open Cfg

module type ITERATOR = sig
  val iterate: cfg -> unit
end

module DefaultIterator: ITERATOR = struct
  let iterate cfg =
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
end

module BetterIterator (D: Domain.DOMAIN): ITERATOR = struct
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

  (* Returns an array containing the entry of each function,
     an array containing the list of the nodes
     and an array containing the list of the arcs
     of each function, indexed by func.func_id *)
  let partition_fun cfg =
    let n = List.length cfg.cfg_funcs in
    let func_head = Array.make (n + 1)
      { node_id = 0; node_pos = Lexing.dummy_pos; node_out = []; node_in = []; }
    in
    List.iter (fun func ->
      func_head.(func.func_id) <- func.func_entry
    ) cfg.cfg_funcs;
    let func_nodes = Array.make (n + 1) [] in
    let func_arcs = Array.make (n + 1) [] in
    let visited = Array.make (List.length cfg.cfg_nodes + 1) false in
    let rec iter_arc func_id arc =
      func_arcs.(func_id) <- arc :: func_arcs.(func_id);
      iter_node func_id arc.arc_dst
    and iter_node func_id node =
      if not visited.(node.node_id)
      then begin
        visited.(node.node_id) <- true;
        func_nodes.(func_id) <- node :: func_nodes.(func_id);
        List.iter (iter_arc func_id) node.node_out;
      end
    in List.iter (fun func ->
      iter_node func.func_id func.func_entry
    ) cfg.cfg_funcs;
    (func_head, func_nodes, func_arcs)


  let rec call_fun func init_env node_map arcs cycle_head func_head func_nodes func_arcs =
    (* initialize all nodes to bottom except the first
       it is safe to do so because functions are not recursive *)
    List.iter (fun node ->
      NodeHash.replace node_map node (D.bottom ())
    ) func_nodes.(func.func_id);
    NodeHash.replace node_map func_head.(func.func_id) init_env;

    let modified = ref true in

    let iter_arc arc =
      let src_env = NodeHash.find node_map arc.arc_src in
      let dst_env = match arc.arc_inst with
      | CFG_assert (b, _) -> begin
        D.guard src_env b
      end
      | CFG_assign (var, exp) -> begin
       (*Format.printf "var: %a = %a" Cfg_printer.print_var var Cfg_printer.print_int_expr exp;
        let x = D.assign src_env var exp in Format.printf ";@."; x*)
        D.assign src_env var exp
      end
      | CFG_call func ->
        call_fun func src_env node_map arcs cycle_head func_head func_nodes func_arcs;
        NodeHash.find node_map func.func_exit
      | CFG_guard b -> D.guard src_env b
      | CFG_skip _ -> src_env
      in

      let old_env = arcs.(arc.arc_id) in
      (* old_env is always a subet of env, it is sufficient to check the converse *)
      if not (D.subset dst_env old_env) then
        modified := true;
      arcs.(arc.arc_id) <- dst_env;
      (*Format.printf "arc %d => %d@." arc.arc_src.node_id arc.arc_dst.node_id;
      Format.printf "%a %a %a@." D.print src_env D.print old_env D.print dst_env*)
    in

    let iter_node node =
      let old_env = NodeHash.find node_map node in
      let in_env = List.fold_left (fun env arc ->
        let src_env = arcs.(arc.arc_id) in
        D.join env src_env
      ) old_env node.node_in in
      (* widening ? *)
      let new_env = if cycle_head.(node.node_id)
      (*
widen { i@1 ↦ [0; 0]; } { i@1 ↦ [0; 1]; } = { i@1 ↦ [0; 0]; }
faulty
      *)
      then D.widen old_env in_env
      else in_env
      in
      (*Format.printf "node %d@." node.node_id;
      Format.printf "%a %a %a@." D.print old_env D.print in_env D.print new_env;*)

      NodeHash.replace node_map node new_env
    
    in while !modified do
      modified := false;
      List.iter iter_arc func_arcs.(func.func_id);
      List.iter iter_node func_nodes.(func.func_id);
    done;

    List.iter (fun arc ->
      match arc.arc_inst with
      | CFG_assert (b, ext) ->
        let env = NodeHash.find node_map arc.arc_src in
        let trigger_assert = D.guard env (CFG_bool_unary (Abstract_syntax_tree.AST_NOT, b)) in
        if not (D.is_bottom trigger_assert) then
          Format.printf "%a@." Errors.pp_err (AssertFalse, ext, b)
      | _ -> ()
    ) func_arcs.(func.func_id)

  let iterate cfg =
    (*D.Vars.support := cfg.cfg_vars;
    D.Consts.support := find_consts cfg;
    let env1 = D.init () in
    let env2 = D.assign env1 (List.hd cfg.cfg_vars) (CFG_int_rand (Z.zero, Z.one)) in
    let env3 = D.widen env1 env2 in
    let env4 = D.widen env2 env1 in
    Format.printf "%a %a %a %a@." D.print env1 D.print env2 D.print env3 D.print env4;
      let () = failwith "" in*)
    D.Vars.clear_vars ();
    List.iter D.Vars.add_var cfg.cfg_vars;
    D.Consts.support := find_consts cfg;
    (* initialize entries to 0 *)
    let init_env = D.init () in
    let cycle_head = find_cycle_head cfg in
    let () = Random.self_init () in
    let node_map = NodeHash.create (List.length cfg.cfg_nodes) in
    (* initialize to bottom *)
    List.iter (fun node ->
      NodeHash.add node_map node (D.bottom ())
    ) cfg.cfg_nodes;
    (* arcs[arc.arc_id] = arc.arc_inst(arc.arc_src) *)
    let arcs = Array.make (List.length (cfg.cfg_arcs) + 1) (D.bottom ()) in
    let (func_head, func_nodes, func_arcs) = partition_fun cfg in

    NodeHash.add node_map cfg.cfg_init_entry init_env;
    let main = List.find (fun func -> func.func_name = "main") cfg.cfg_funcs in
    call_fun main init_env node_map arcs cycle_head func_head func_nodes func_arcs;

    Format.printf "Node values:@   @[<v 0>";
    List.iter (fun node ->
      let env = NodeHash.find node_map node in
      Format.printf "<%i>: %a@ " node.node_id D.print env
    ) cfg.cfg_nodes;
    Format.printf "@]"

end
