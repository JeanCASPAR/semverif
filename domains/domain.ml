(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

open! Cfg

(* Signature for the variables *)

module type VARS = sig
  val support : var list ref
end

module Vars: VARS = struct
  let support = ref []
end

(*
  Signature of abstract domains representing sets of envrionments
  (for instance: a map from variable to their bounds).
 *)

module type DOMAIN =
  sig
    module Vars: VARS

    (* type of abstract elements *)
    (* an element of type t abstracts a set of mappings from variables
       to integers
     *)
    type t

    (* initial environment, with all variables initialized to 0 *)
    val init: unit -> t

    (* empty set of environments *)
    val bottom: unit -> t

    (* all variables assigned to top *)
    val top: unit -> t

    (* assign an integer expression to a variable *)
    val assign: t -> var -> int_expr -> t

    (* filter environments to keep only those satisfying the boolean expression *)
    val guard: t -> bool_expr -> t

    (* abstract join *)
    val join: t -> t -> t

    (* abstract meet *)
    val meet: t -> t -> t

    (* widening *)
    val widen: t -> t -> t

    (* narrowing *)
    val narrow: t -> t -> t

    (* whether an abstract element is included in another one *)
    val subset: t -> t -> bool

    (* whether the abstract element represents the empty set *)
    val is_bottom: t -> bool

    (* prints *)
    val print: Format.formatter -> t -> unit

  end


module Domain (Vars: VARS) (V: Value_domain.VALUE_DOMAIN): DOMAIN = struct
  module Vars = Vars

  type t = V.t VarMap.t

  (* initial environment, with all variables initialized to 0 *)
  let rec init () = List.fold_left (fun env v ->
    VarMap.add v (V.const Z.zero) env
  ) VarMap.empty !Vars.support

  (* empty set of environments *)
  and bottom () = List.fold_left (fun env v ->
    VarMap.add v V.bottom env
  ) VarMap.empty !Vars.support

  and top () = List.fold_left (fun env v ->
    VarMap.add v V.top env
  ) VarMap.empty !Vars.support

  and eval_int e env = match e with
  | CFG_int_unary (op, e) ->
    let e = eval_int e env
    in V.unary e op
  | CFG_int_binary (op, lhs, rhs) ->
    let lhs = eval_int lhs env in
    let rhs = eval_int rhs env in
    V.binary lhs rhs op
  | CFG_int_var var -> VarMap.find var env
  | CFG_int_const n -> V.const n
  | CFG_int_rand (a, b) -> V.rand a b

  (* assign an integer expression to a variable *)
  and assign env var e =
  let e = eval_int e env in
  let env = VarMap.add var e env in
  env

  (* we know that e is abstracted to r,
    what can we deduce about e, and ultimately, about env ? *)
  and backward_eval e r env = match e with
  | CFG_int_unary (op, e) ->
    let x = eval_int e env in
    let r = V.bwd_unary x op r in
    backward_eval e r env
  | CFG_int_binary (op, e1, e2) ->
    let x = eval_int e1 env in
    let y = eval_int e2 env in
    let (r1, r2) = V.bwd_binary x y op r in
    let env1 = backward_eval e1 r1 env in
    let env2 = backward_eval e2 r2 env in
    meet env1 env2
  | CFG_int_var var ->
    let e = VarMap.find var env in
    VarMap.add var (V.meet e r) env
  | CFG_int_const n -> if V.is_bottom (V.meet r (V.const n)) then bottom () else env
  | CFG_int_rand (a, b) -> if V.is_bottom (V.meet r (V.rand a b)) then bottom () else env

  (* filter environments to keep only those satisfying the boolean expression *)
  and guard env b = match b with
  | CFG_bool_unary (AST_NOT, b) ->
    (* simplify *)
    begin match b with
    | CFG_bool_unary (AST_NOT, b) -> guard env b
    | CFG_bool_binary (op, b1, b2) ->
      let not b = CFG_bool_unary (AST_NOT, b) in
      let op = match op with
      | AST_AND -> Abstract_syntax_tree.AST_OR
      | AST_OR -> Abstract_syntax_tree.AST_AND
      in guard env (CFG_bool_binary (op, not b1, not b2))
    | CFG_compare (op, lhs, rhs) ->
      let op = match op with
      | AST_EQUAL -> Abstract_syntax_tree.AST_NOT_EQUAL
      | AST_NOT_EQUAL -> Abstract_syntax_tree.AST_EQUAL
      | AST_LESS -> Abstract_syntax_tree.AST_GREATER_EQUAL
      | AST_LESS_EQUAL -> Abstract_syntax_tree.AST_GREATER
      | AST_GREATER -> Abstract_syntax_tree.AST_LESS_EQUAL
      | AST_GREATER_EQUAL -> Abstract_syntax_tree.AST_LESS
      in guard env (CFG_compare (op, lhs, rhs))
    | CFG_bool_const b -> guard env (CFG_bool_const (not b))
    | CFG_bool_rand -> guard env CFG_bool_rand
    end (* end simplify *)
  | CFG_bool_binary (op, b1, b2) ->
    let env1 = guard env b1 in
    let env2 = guard env b2 in
    begin match op with
    | AST_AND -> meet env1 env2
    | AST_OR -> join env1 env2
    end
  | CFG_compare (op, lhs, rhs) ->
    let x = eval_int lhs env in
    let y = eval_int rhs env in
    let (lhs', rhs') = V.compare x y op in
    let env1 = backward_eval lhs lhs' env in
    let env2 = backward_eval rhs rhs' env in
    meet env1 env2
  | CFG_bool_const b -> if b then env else bottom ()
  | CFG_bool_rand -> env

  (* abstract join *)
  and join env1 env2 = List.fold_left (fun env v ->
    let x = VarMap.find v env1 in
    let y = VarMap.find v env2 in
    VarMap.add v (V.join x y) env
  ) VarMap.empty !Vars.support

  (* abstract meet *)
  and meet env1 env2 = List.fold_left (fun env v ->
    let x = VarMap.find v env1 in
    let y = VarMap.find v env2 in
    VarMap.add v (V.meet x y) env
  ) VarMap.empty !Vars.support

  (* widening *)
  and widen env1 env2 = List.fold_left (fun env v ->
    let x = VarMap.find v env1 in
    let y = VarMap.find v env2 in
    VarMap.add v (V.widen x y) env
  ) VarMap.empty !Vars.support

  (* narrowing *)
  and narrow env1 env2 = List.fold_left (fun env v ->
    let x = VarMap.find v env1 in
    let y = VarMap.find v env2 in
    VarMap.add v (V.narrow x y) env
  ) VarMap.empty !Vars.support

  (* whether an abstract element is included in another one *)
  and subset env1 env2 = List.for_all (fun v ->
    let x = VarMap.find v env1 in
    let y = VarMap.find v env2 in
    V.subset x y
  ) !Vars.support

  (* whether the abstract element represents the empty set *)
  and is_bottom env = List.exists (fun v ->
    let x = VarMap.find v env in
    V.is_bottom x
  ) !Vars.support

  (* prints *)
  and print fmt env =
    Format.pp_print_string fmt "{ ";
    Format.pp_open_box fmt 0;
    VarMap.iter (fun var value ->
      Format.fprintf fmt "%s@@%i ↦ %a; " var.var_name var.var_id V.print value
    ) env;
    Format.pp_close_box fmt ();
    Format.pp_print_string fmt "}"
end
