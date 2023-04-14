(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

(*
  Error handling utility
*)

open Abstract_syntax_tree

type error_kind =
  | AssertFalse

let pp_error_kind fmt = function
  | AssertFalse -> Format.fprintf fmt "Assertion failure"

type err = error_kind * extent * bool_expr

let pp_err fmt (ek, ext, be) =
  Format.fprintf fmt "%a: %a \"%a\""
    Cfg_printer.pp_pos (fst ext)
    pp_error_kind ek
    Cfg_printer.print_bool_expr be
