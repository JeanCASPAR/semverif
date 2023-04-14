(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

open Abstract_syntax_tree


let rec aux_int acc e =
  match fst e with
  | AST_int_identifier _
  | AST_int_const _
  | AST_int_rand (_, _) -> acc
  | AST_int_unary (_, e) -> aux_int acc e
  | AST_int_binary (AST_DIVIDE, e1, e2)
  | AST_int_binary (AST_MODULO, e1, e2) ->
    let acc = aux_int acc e1 in
    let acc = aux_int acc e2 in
    e2::acc
  | AST_int_binary (_ , e1, e2) ->
    let acc = aux_int acc e1 in
    let acc = aux_int acc e2 in
    acc
  | AST_expr_call (_, args) ->
    List.fold_left aux_int acc (List.rev args)

let rec aux_bool acc b =
  match fst b with
  | AST_bool_const _
  | AST_bool_rand -> acc
  | AST_bool_unary (_, b) -> aux_bool acc b
  | AST_bool_binary (_, b1, b2) ->
    let acc = aux_bool acc b1 in
    let acc = aux_bool acc b2 in
    acc
  | AST_compare (_, e1, e2) ->
    let acc = aux_int acc e1 in
    let acc = aux_int acc e2 in
    acc

(** [find_div_int expr] returns the list of integer expressions found as
    divisors in the integer expression [expr].
    the first elements of the list are the lower in the AST *)
let find_div_int (e: int_expr ext) : int_expr ext list =
  aux_int [] e |> List.rev

(** [find_div_bool b_expr] returns the list of integer expressions found as
    divisors in the boolean expression [b_expr].
    the first elements of the list are the lower in the AST *)
let find_div_bool (b: bool_expr ext) : int_expr ext list =
  aux_bool [] b |> List.rev

(** [create_assertions e] retuns a statment assrting that [e != 0].
    All locations informations are found in [e]. *)
let create_assertions (e: int_expr ext) : stat ext =
  let ext = snd e in
  let zero = AST_int_const ("0", ext), ext in
  let be = AST_compare (AST_NOT_EQUAL, e, zero), ext in
  let s = AST_assert be in
  s, ext

(** [add_assertions_stat s] returns (a bloc of) statements containing [s] and
    all necessary assertions. *)
let rec add_assertions_stat (s: stat ext): stat ext list =
  let ext = snd s in
  match fst s with
  | AST_label _
  | AST_break _
  | AST_SKIP
  | AST_increment (_, _)
  | AST_return None
  | AST_goto _ -> [s]
  | AST_local_decl ((typ, vari), ext_decl) ->
    let aux (vari: var_init): stat ext list =
      match snd vari with
      | None -> [AST_local_decl ((typ, [vari]), ext_decl), ext]
      | Some (e, ext_e) ->
        let exprs = find_div_int (e, ext_e) in
        let stats = List.map create_assertions exprs in
        stats@[AST_local_decl ((typ, [vari]), ext_decl), ext_decl] in
    let stats = List.map aux vari |> List.flatten in
    stats
  | AST_block b ->
    let stats = List.map add_assertions_stat b |> List.flatten in
    [AST_block stats, ext]
  | AST_assign (_, expr) ->
    let exprs = find_div_int expr in
    let stats = List.map create_assertions exprs in
    stats@[s]
  | AST_assign_op (_, _, expr) ->
    let exprs = find_div_int expr in
    let stats = List.map create_assertions exprs in
    stats@[s]
  | AST_if (b_expr, s1, s2) ->
    let exprs = find_div_bool b_expr in
    let s =
      let s1 = AST_block (add_assertions_stat s1), snd s1 in
      let s2 = Option.map (fun s -> AST_block (add_assertions_stat s), snd s) s2 in
      AST_if (b_expr, s1, s2), ext in
    let stats = List.map create_assertions exprs in
    stats@[s]
  | AST_while (b_expr, s1) ->
    let exprs = find_div_bool b_expr in
    let stats = List.map create_assertions exprs in
    let s =
      let s1 = add_assertions_stat s1 in
      let s1 = AST_block (s1@stats), ext in
      AST_while (b_expr, s1), ext in
    stats@[s]
  | AST_for (stats_init, Some b_expr, stats_inc, body) ->
    let exprs = find_div_bool b_expr in
    let stats = List.map create_assertions exprs in
    let stats_init = List.map add_assertions_stat stats_init |> List.flatten in
    let stats_init = stats_init@stats in
    let body = AST_block (add_assertions_stat body), snd body in
    let stats_inc = List.map add_assertions_stat stats_inc |> List.flatten in
    let stats_inc = stats_inc@stats in
    let s = AST_for (stats_init, Some b_expr, stats_inc, body), ext in
    [s]
  | AST_for (stats_init, None, stats_inc, body) ->
    let stats_init = List.map add_assertions_stat stats_init |> List.flatten in
    let body = AST_block (add_assertions_stat body), snd body in
    let stats_inc = List.map add_assertions_stat stats_inc |> List.flatten in
    let s = AST_for (stats_init, None, stats_inc, body), ext in
    [s]
  | AST_assert (b_expr) ->
    let exprs = find_div_bool b_expr in
    let stats = List.map create_assertions exprs in
    stats@[s]
  | AST_stat_call (_, args) ->
    let exprs = List.map find_div_int args |> List.flatten in
    let stats = List.map create_assertions exprs in
    stats@[s]
  | AST_return (Some expr) ->
    let exprs = find_div_int expr in
    let stats = List.map create_assertions exprs in
    stats@[s]

(** [add_assertions p] returns the program [p] with all division guarded with
    non-null assertions. *)
let add_assertions (p: prog) : prog =
  let aux (fdecl: fun_decl): fun_decl =
    let fun_body = List.map add_assertions_stat fdecl.fun_body |> List.flatten in
    { fdecl with fun_body } in
  let aux: toplevel -> toplevel = function
    | AST_global_decl _ as x -> x
    | AST_fun_decl (fdecl, ext) ->
      AST_fun_decl (aux fdecl, ext) in
  let decls, ext = p in
  List.map aux decls, ext
