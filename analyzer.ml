(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

(*
  Simple driver: parses the file given as argument and prints it back.

  You should modify this file to call your functions instead!
*)


(* parse filename *)
let doit filename =
  let prog = File_parser.parse_file filename in
  let cfg = Tree_to_cfg.prog prog in
  if !Options.verbose then
    Format.printf "%a" Cfg_printer.print_cfg cfg;
  Cfg_printer.output_dot !Options.cfg_out cfg;
  match !Options.domain with
  | "constants" ->
    let module D = Domain.Domain (Domain.Vars) (Domain.Consts) (Value_domain.Constant) in
    let module I = Iterator.BetterIterator (D) in
    print_endline "Domain: constants";
    I.iterate cfg
  | "interval" ->

    let module D = Domain.Domain (Domain.Vars) (Domain.Consts) (Value_domain.Interval) in
    let module I = Iterator.BetterIterator (D) in
    print_endline "Domain: inteval";
    I.iterate cfg
  | "poly" ->
    let module D = Domain.ApronDomain (Domain.PolySettings) (Domain.Consts) in
    let module I = Iterator.BetterIterator (D) in
    print_endline "Domain: polyhedra (apron)";
    I.iterate cfg
  | "box" ->
    let module D = Domain.ApronDomain (Domain.BoxSettings) (Domain.Consts) in
    let module I = Iterator.BetterIterator (D) in
    print_endline "Domain: constants (apron)";
    I.iterate cfg
  | "oct" ->
    let module D = Domain.ApronDomain (Domain.OctaSettings) (Domain.Consts) in
    let module I = Iterator.BetterIterator (D) in
    print_endline "Domain: octahedra (apron)";
    I.iterate cfg
  | s -> Format.printf "Unknown domain %s, back to default@." s;
    Iterator.DefaultIterator.iterate cfg


(* parses arguments to get filename *)
let main () =
  let _ = Options.init () in
  doit !Options.file

let _ = main ()
