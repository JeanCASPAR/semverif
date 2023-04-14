(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

open Cfg

let  iterate cfg =
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
