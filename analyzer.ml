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
    let module D = Domain.Domain (Domain.Vars) (Value_domain.Constant) in
    Format.printf "Domain: constants@.";
    Iterator.iterate (module D) cfg
  | "interval" ->
    let module D = Domain.Domain (Domain.Vars) (Value_domain.Interval) in
    Format.printf "Domain: inteval@.";
    Iterator.iterate (module D) cfg
  | s -> Format.printf "Unknown domain %s, back to default@." s;
    Iterator.default_iterate cfg


(* parses arguments to get filename *)
let main () =
  let _ = Options.init () in
  doit !Options.file

let _ = main ()
