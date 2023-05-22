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
  val clear_vars : unit -> unit
  val get_vars : unit -> var list
  val add_var : var -> unit
end

module Vars: VARS = struct
  let support = ref []
  let get_vars () =
    !support
  let add_var var =
    support := var :: !support
  let clear_vars () =
    support := []
end

module type CONSTS = sig
  val support : Z.t list ref
end

module Consts: CONSTS = struct
  let support = ref []
end

(*
  Signature of abstract domains representing sets of envrionments
  (for instance: a map from variable to their bounds).
 *)

module type DOMAIN = sig
  module Vars: VARS
  module Consts: CONSTS

  (* type of abstract elements *)
  (* an element of type t abstracts a set of mappings from variables
     to integers
  *)
  type t

  (* initial environment, with all variables initialized to 0 *)
  val init: unit -> t

  (* empty set of environments *)
  val bottom: unit -> t

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


module Domain (Vars: VARS) (Consts: CONSTS) (V: Value_domain.VALUE_DOMAIN): DOMAIN = struct
  module Vars = Vars
  module Consts = Consts

  type t = V.t VarMap.t

  (* initial environment, with all variables initialized to 0 *)
  let rec init () =
    if Vars.get_vars () = [] then
      (* Make sure the environment is never empty, otherwise it's impossible to distinguish *)
      (* between bottom and top, so it makes variable-devoid programs fail. *)
      Vars.add_var {
        var_id = -1;
        var_name = "dummy";
        var_type = Abstract_syntax_tree.AST_TYP_INT;
        var_pos = Abstract_syntax_tree.extent_unknown;
      };
    List.fold_left (fun env v ->
        VarMap.add v (V.const Z.zero) env
      ) VarMap.empty (Vars.get_vars ())

  (* empty set of environments *)
  and bottom () =
    List.fold_left (fun env v ->
        VarMap.add v V.bottom env
      ) VarMap.empty (Vars.get_vars ())
    

  and top () =
    List.fold_left (fun env v ->
      VarMap.add v V.top env
    ) VarMap.empty (Vars.get_vars ())

  and eval_int e env = match e with
    | CFG_int_unary (op, e) ->
      let e = eval_int e env in
      V.unary e op
    | CFG_int_binary (op, lhs, rhs) ->
      let lhs = eval_int lhs env in
      let rhs = eval_int rhs env in
      V.binary lhs rhs op
    | CFG_int_var var ->
      (* let env = Option.value env ~default:VarMap.empty in *)
      VarMap.find var env
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
    ) VarMap.empty (Vars.get_vars ())

  (* abstract meet *)
  and meet env1 env2 = List.fold_left (fun env v ->
      let x = VarMap.find v env1 in
      let y = VarMap.find v env2 in
      VarMap.add v (V.meet x y) env
    ) VarMap.empty (Vars.get_vars ())

  (* widening *)
  and widen env1 env2 = List.fold_left (fun env v ->
      let x = VarMap.find v env1 in
      let y = VarMap.find v env2 in
      VarMap.add v (V.widen !Consts.support x y) env
    ) VarMap.empty (Vars.get_vars ())

  (* narrowing *)
  and narrow env1 env2 = List.fold_left (fun env v ->
      let x = VarMap.find v env1 in
      let y = VarMap.find v env2 in
      VarMap.add v (V.narrow x y) env
    ) VarMap.empty (Vars.get_vars ())

  (* whether an abstract element is included in another one *)
  and subset env1 env2 = List.for_all (fun v ->
      let x = VarMap.find v env1 in
      let y = VarMap.find v env2 in
      V.subset x y
    ) (Vars.get_vars ())

  (* whether the abstract element represents the empty set *)
  and is_bottom env = List.exists (fun v ->
      let x = VarMap.find v env in
      V.is_bottom x
    ) (Vars.get_vars ())

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

module type AVARS = sig
  include VARS

  val get_env: unit -> Apron.Environment.t
  val get_var: var -> Apron.Var.t
end

module AVars: AVARS = struct
  open Apron

  let env =
    Environment.make [||] [||] |> ref

  let map =
    Hashtbl.create 17

  let add_var var =
    let name = Format.sprintf "%s(%d)" var.var_name var.var_id in
    let avar = Apron.Var.of_string name in
    Hashtbl.replace map name var;
    env := Environment.add !env [|avar|] [| |]

  let get_var var =
    let name = Format.sprintf "%s(%d)" var.var_name var.var_id in
    Apron.Var.of_string name

  let get_vars () =
    let int_vars, _ = Environment.vars !env in
    int_vars |> Array.to_list |> List.map (fun var -> Apron.Var.to_string var |> Hashtbl.find map)

  let get_env () =
    !env

  let clear_vars () =
    env  := Environment.make [||] [||];
    Hashtbl.reset map
end

module type APRON_SETTNIGS = sig
  type u
  type t = u Apron.Manager.t
  val manager : t

  val rounding : Apron.Texpr1.round
  val typ : Apron.Texpr1.typ
end

module MakeSettings
    (ApronStuff: sig type u val make_manager : unit -> u Apron.Manager.t end)
  : APRON_SETTNIGS = struct
  type u = ApronStuff.u
  type t = u Apron.Manager.t

  let manager = ApronStuff.make_manager ()

  let rounding = Apron.Texpr1.Zero

  let typ = Apron.Texpr1.Int
end

module PolySettings = MakeSettings (struct
    type u = Polka.loose Polka.t
    let make_manager = Polka.manager_alloc_loose
  end)

module ApronDomain (Settings: APRON_SETTNIGS) (Consts: CONSTS): DOMAIN = struct
  open Apron

  module Consts = Consts

  module Vars = AVars

  type t = Settings.u Abstract1.t

  let thresholds =
    Lincons1.array_make (Vars.get_env ()) 0 |> ref

  let abinop_of_binop op =
    let open Abstract_syntax_tree in
    let open Texpr1 in
    match op with
    | AST_PLUS -> Add
    | AST_MINUS -> Sub
    | AST_MULTIPLY -> Mul
    | AST_DIVIDE -> Div
    | AST_MODULO -> Mod

  let rec aexpr_of_sexpr = function
    | CFG_int_unary (AST_UNARY_PLUS, e) -> aexpr_of_sexpr e
    | CFG_int_unary (AST_UNARY_MINUS, e) ->
      Texpr1.Unop (Texpr1.Neg, aexpr_of_sexpr e, Settings.typ, Settings.rounding)
    | CFG_int_binary (op, e, e') ->
      let e = aexpr_of_sexpr e in
      let e' = aexpr_of_sexpr e' in
      Texpr1.Binop (abinop_of_binop op, e, e', Settings.typ, Settings.rounding)
    | CFG_int_rand (left, right) ->
      Texpr1.Cst (Coeff.i_of_int (Z.to_int left) (Z.to_int right))
    | CFG_int_const i ->
      Texpr1.Cst (Z.to_int i |> Coeff.s_of_int)
    | CFG_int_var var ->
      Texpr1.Var (Vars.get_var var)

  let init () =
    let env = Vars.get_env () in
    let (vars, _) = Environment.vars env in
    let values = Array.make (Array.length vars) (Interval.of_int 0 0) in
    let nb_csts = List.length !Consts.support in
    let size = 2 * nb_csts * List.length (Vars.get_vars ()) in
    thresholds := Lincons1.array_make env size;
    List.iteri (fun i c ->
        Array.iteri (fun j v ->
            let index = j*nb_csts + i in
            let index_leq = 2*index in
            let index_geq = 2*index+1 in
            let cst_leq = Z.to_int c |> Coeff.s_of_int in
            let expr_leq = Linexpr1.make env in
            Linexpr1.set_coeff expr_leq v (Coeff.s_of_int ~-1);
            Linexpr1.set_cst expr_leq cst_leq;
            let const_leq = Lincons1.make expr_leq Lincons1.SUPEQ in
            let cst_geq = Z.to_int c |> (~-) |> Coeff.s_of_int in
            let expr_geq = Linexpr1.make env in
            Linexpr1.set_coeff expr_geq v (Coeff.s_of_int 1);
            Linexpr1.set_cst expr_geq cst_geq;
            let const_geq = Lincons1.make expr_geq Lincons1.SUPEQ in
            Lincons1.array_set !thresholds index_leq const_leq;
            Lincons1.array_set !thresholds index_geq const_geq
          )
          vars
      ) !Consts.support;
    (* Format.printf "%a\n" (fun fmt -> Lincons1.array_print fmt) !thresholds; *)
    Abstract1.of_box Settings.manager env vars values

  let bottom () =
    Abstract1.bottom Settings.manager (Vars.get_env ())

  let top () =
    Abstract1.top Settings.manager (Vars.get_env ())

  let is_zero env e =
    let e = aexpr_of_sexpr e |> Texpr1.of_expr (Vars.get_env ()) in
    let int = Abstract1.bound_texpr Settings.manager env e in
    let zero_int = Interval.of_int 0 0 in
    Interval.is_leq zero_int int && Interval.is_leq int zero_int

  let rec expr_diverges env = function
    | CFG_int_unary (_, sub_expr) -> expr_diverges env sub_expr
    | CFG_int_binary (op, left, right) ->
      expr_diverges env left
      || expr_diverges env right
      || (op = AST_DIVIDE && is_zero env right)
    | CFG_int_var _ | CFG_int_const _ | CFG_int_rand _ -> false

  let assign env var e =
    if expr_diverges env e then
      bottom ()
    else 
      let e' = aexpr_of_sexpr e |> Texpr1.of_expr (Vars.get_env ()) in
      Abstract1.assign_texpr Settings.manager env (Vars.get_var var) e' None

  let float_of_acst f =
    let open Scalar in
    match f with
    | Float f -> f
    (* Bravo la gestion de l'infini... *)
    | Mpqf s ->
      if Mpqf.to_string s = "1/0" then
        Float.infinity
      else if Mpqf.to_string s = "-1/0" then
        Float.neg_infinity
      else
        Mpqf.to_float s
    | Mpfrf s ->
      if Mpfrf.to_string s = "1/0" then
        Float.infinity
      else if Mpfrf.to_string s = "-1/0" then
        Float.neg_infinity
      else
        Mpfrf.to_float s

  exception Diverges

  let rec guard env b =
    (* Removes negations and all comparison operators that are not present in Apron (including ≠) *)
    let rec purge_unwanted negated expr =
      let open Abstract_syntax_tree in
      match expr with
      | CFG_bool_rand -> CFG_bool_rand
      | CFG_bool_const b ->
        CFG_bool_const (b <> negated)
      | CFG_bool_unary (AST_NOT, e) ->
        purge_unwanted (not negated) e
      | CFG_bool_binary (op, left, right) ->
        if negated then
          let new_op = match op with
            | AST_AND -> AST_OR
            | AST_OR -> AST_AND in
          CFG_bool_binary (new_op, purge_unwanted true left, purge_unwanted true right)
        else
          CFG_bool_binary (op, purge_unwanted false left, purge_unwanted false right)
      | CFG_compare (op, left, right) ->
        if expr_diverges env left || expr_diverges env right then
          raise Diverges;
        let op = if negated then
            match op with
            | AST_EQUAL -> AST_NOT_EQUAL
            | AST_NOT_EQUAL -> AST_EQUAL
            | AST_GREATER -> AST_LESS_EQUAL
            | AST_GREATER_EQUAL -> AST_LESS
            | AST_LESS -> AST_GREATER_EQUAL
            | AST_LESS_EQUAL -> AST_GREATER
          else op in
        begin match op with
          | AST_EQUAL -> CFG_compare (op, left, right)
          | AST_NOT_EQUAL -> CFG_bool_binary (
              AST_OR,
              CFG_compare (AST_GREATER, left, right),
              CFG_compare (AST_GREATER, right, left)
            )
          | AST_GREATER -> CFG_compare (op, left, right)
          | AST_GREATER_EQUAL -> CFG_compare (op, left, right)
          | AST_LESS -> CFG_compare (AST_GREATER, right, left)
          | AST_LESS_EQUAL -> CFG_compare (AST_GREATER_EQUAL, right, left)
        end in
    match purge_unwanted false b with
    | CFG_bool_binary (op, left, right) ->
      let left_env = guard env left in
      let right_env = guard env right in
      let operator = match op with
        | AST_OR -> Abstract1.join
        | AST_AND -> Abstract1.meet in
      operator Settings.manager left_env right_env
    | CFG_bool_const b ->
      if b then env else bottom ()
    | CFG_bool_rand -> env
    | CFG_compare (op, left, right) ->
      let e =
        aexpr_of_sexpr (CFG_int_binary (AST_MINUS, left, right))
        |> Texpr1.of_expr (Vars.get_env ()) in
      let operand =
        let open Tcons1 in
        match op with
        | AST_EQUAL -> EQ
        | AST_GREATER -> SUP
        | AST_GREATER_EQUAL -> SUPEQ
        | _ -> failwith "unreachable" in
      let const = Tcons1.make e operand in
      let const_array = Tcons1.array_make (Vars.get_env ()) 1 in
      Tcons1.array_set const_array 0 const;
      Abstract1.meet_tcons_array Settings.manager env const_array
    | CFG_bool_unary _ -> failwith "unreachable"
    | exception Diverges -> bottom ()

  let join env env' =
    Abstract1.join Settings.manager env env'

  let meet env env' =
    Abstract1.meet Settings.manager env env'

  let widen env env' =
    Abstract1.widening_threshold Settings.manager env env' !thresholds

  let narrow env env' =
    assert false                (* qui supporte le narrowing de toute façon, hein? *)

  let subset env env' =
    Abstract1.is_leq Settings.manager env env'

  let is_bottom env =
    let is_var_impossible var =
      let interval = Vars.get_var var |> Abstract1.bound_variable Settings.manager env in
      let inf = float_of_acst interval.inf |> Float.ceil in
      let sup = float_of_acst interval.sup |> Float.floor in
      inf > sup in
    Abstract1.is_bottom Settings.manager env
    || Vars.get_vars () |> List.exists is_var_impossible

  let print fmt env =
    Abstract1.print fmt env
end
