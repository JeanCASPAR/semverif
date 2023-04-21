(*
  Cours "Sémantique et Application à la Vérification de programmes"

  Antoine Miné 2015
  Marc Chevalier 2018
  Josselin Giet 2021
  Ecole normale supérieure, Paris, France / CNRS / INRIA
*)

(*
  Signature of abstract domains representing sets of integers
  (for instance: constants or intervals).
 *)

open Abstract_syntax_tree

module type VALUE_DOMAIN =
  sig

    (* type of abstract elements *)
    (* an element of type t abstracts a set of integers *)
    type t

    (* unrestricted value: [-oo,+oo] *)
    val top: t

    (* bottom value: empty set *)
    val bottom: t

    (* constant: {c} *)
    val const: Z.t -> t

    (* interval: [a,b] *)
    val rand: Z.t -> Z.t -> t


    (* unary operation *)
    val unary: t -> int_unary_op -> t

    (* binary operation *)
    val binary: t -> t -> int_binary_op -> t


    (* comparison *)
    (* [compare x y op] returns (x',y') where
       - x' abstracts the set of v  in x such that v op v' is true for some v' in y
       - y' abstracts the set of v' in y such that v op v' is true for some v  in x
       i.e., we filter the abstract values x and y knowing that the test is true

       a safe, but not precise implementation, would be:
       compare x y op = (x,y)
     *)
    val compare: t -> t -> compare_op -> (t * t)


    (* backards unary operation *)
    (* [bwd_unary x op r] return x':
       - x' abstracts the set of v in x such as op v is in r
       i.e., we fiter the abstract values x knowing the result r of applying
       the operation on x
     *)
    val bwd_unary: t -> int_unary_op -> t -> t

     (* backward binary operation *)
     (* [bwd_binary x y op r] returns (x',y') where
       - x' abstracts the set of v  in x such that v op v' is in r for some v' in y
       - y' abstracts the set of v' in y such that v op v' is in r for some v  in x
       i.e., we filter the abstract values x and y knowing that, after
       applying the operation op, the result is in r
      *)
    val bwd_binary: t -> t -> int_binary_op -> t -> (t * t)


    (* set-theoretic operations *)
    val join: t -> t -> t
    val meet: t -> t -> t

    (* widening *)
    val widen: t -> t -> t

    (* narrowing *)
    val narrow: t -> t -> t

    (* subset inclusion of concretizations *)
    val subset: t -> t -> bool

    (* check the emptiness of the concretization *)
    val is_bottom: t -> bool

    (* print abstract element *)
    val print: Format.formatter -> t -> unit

end


module Constant: VALUE_DOMAIN = struct
  type t = Bottom | Top | Int of Z.t

  let rec top = Top

  and bottom = Bottom

  and const n = Int n

  and rand a b = if a = b then Int a
  else begin
    if Z.leq a b then Top else Bottom
  end

  and unary t op = match t with
  | Top | Bottom as t -> t
  | Int n -> match op with
    | AST_UNARY_PLUS -> Int n
    | AST_UNARY_MINUS -> Int (Z.neg n)


  and binary a b op = match (a, b, op) with
  | Bottom, _, _ | _, Bottom, _ -> Bottom
  | (Int n, _, AST_MULTIPLY | _, Int n, AST_MULTIPLY) when n = Z.zero -> Int Z.zero
  | _, Int n, (AST_DIVIDE | AST_MODULO) when n = Z.zero -> Bottom
  | _, Top, _ | Top, _, _ -> Top
  | Int a, Int b, op -> let op = begin match op with
    | AST_PLUS -> Z.add
    | AST_MINUS -> Z.sub
    | AST_MULTIPLY -> Z.mul
    | AST_DIVIDE -> Z.div
    | AST_MODULO -> Z.rem
  end
  in Int (op a b)

  and compare a b op = match op with
  | AST_EQUAL -> begin
    match (a, b) with
    | Int a, Int b -> if a = b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (b, b)
    | _, Top -> (a, a)
    end
  | AST_NOT_EQUAL -> begin
    match (a, b) with
    | Int a, Int b -> if a != b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (Top, b)
    | _, Top -> (a, Top)
    end
  | AST_LESS -> begin
    match (a, b) with
    | Int a, Int b -> if a < b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (Top, b)
    | _, Top -> (a, Top)
    end
  | AST_LESS_EQUAL -> begin
    match (a, b) with
    | Int a, Int b -> if a <= b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (Top, b)
    | _, Top -> (a, Top)
    end
  | AST_GREATER -> begin
    match (a, b) with
    | Int a, Int b -> if a > b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (Top, b)
    | _, Top -> (a, Top)
    end
  | AST_GREATER_EQUAL -> begin
    match (a, b) with
    | Int a, Int b -> if a >= b then (Int a, Int b) else (Bottom, Bottom)
    | Bottom, _ | _, Bottom -> (Bottom, Bottom)
    | Top, _ -> (Top, b)
    | _, Top -> (a, Top)
    end

  and bwd_unary x op r = meet x (unary r op) (* op op r = r *)

  and bwd_binary x y op r = match op with (* we try to invert op _ y and op x _ *)
  | AST_PLUS -> (meet x (binary r y AST_MINUS), meet y (binary r x AST_MINUS))
  | AST_MINUS -> (meet x (binary r y AST_PLUS), meet y (binary (unary r AST_UNARY_MINUS) x AST_MINUS))
  | AST_MULTIPLY -> (meet x (binary r y AST_DIVIDE), meet y (binary r x AST_DIVIDE))
  | AST_DIVIDE -> (meet x (binary r y AST_MULTIPLY), meet y (binary x r AST_DIVIDE))
  | AST_MODULO -> (x, y) (* can't figure out a better approximation *)

  and join a b = match (a, b) with
  | Top, _ | _, Top -> Top
  | Bottom, _ -> b
  | _, Bottom -> a
  | Int a, Int b -> if a = b then Int a else Top

  and meet a b = match (a, b) with
  | Bottom, _ | _, Bottom -> Bottom
  | Top, _ -> b
  | _, Top -> a
  | Int a, Int b -> if a = b then Int a else Bottom

  and widen _ = assert false
  and narrow _ = assert false

  and subset a b = match (a, b) with
  | Bottom, _ | _, Top -> true
  | Top, _ | _, Bottom -> false
  | Int a, Int b -> a = b

  and is_bottom t = match t with | Bottom -> true | _ -> false
  and print fmt t = match t with
  | Bottom -> Format.pp_print_string fmt "⊥"
  | Top -> Format.pp_print_string fmt "⊤"
  | Int n -> Z.pp_print fmt n
end

module Interval: VALUE_DOMAIN = struct

  type bound = NegInfinity | PosInfinity | Int of Z.t
  type t = Empty | Bounded of bound * bound

  let pos x = x

  let neg = function
  | NegInfinity -> PosInfinity
  | PosInfinity -> NegInfinity
  | Int n -> Int (Z.neg n)

  let max x y = match (x, y) with
  | _, PosInfinity | PosInfinity, _ -> PosInfinity
  | NegInfinity, z | z, NegInfinity -> z
  | Int n, Int m -> Int (Z.max n m)

  let min x y = neg (max (neg x) (neg y))

  let add x y = match (x, y) with
  | NegInfinity, _  | _, NegInfinity -> NegInfinity
  | PosInfinity, _ | _, PosInfinity -> PosInfinity
  | Int x, Int y -> Int (Z.add x y)

  let sub x y = add x (neg y)

  let mul x y = match (x, y) with
  | NegInfinity, NegInfinity -> PosInfinity
  | PosInfinity, PosInfinity -> PosInfinity
  | NegInfinity, PosInfinity -> NegInfinity
  | PosInfinity, NegInfinity -> NegInfinity
  | NegInfinity, Int n | Int n, NegInfinity ->
    if Z.equal n Z.zero
    then Int Z.zero
    else if Z.leq n Z.zero
    then PosInfinity
    else NegInfinity
  | PosInfinity, Int n | Int n, PosInfinity ->
    if Z.equal n Z.zero
    then Int Z.zero
    else if Z.leq n Z.zero
    then NegInfinity
    else PosInfinity
  | Int n, Int m -> Int (Z.mul n m)

  let div x y = match (x, y) with
  | _, (PosInfinity | NegInfinity) -> Int Z.zero
  | Int n, Int m -> Int (Z.div n m)
  | NegInfinity, Int n -> if Z.leq n Z.zero then PosInfinity else NegInfinity
  | PosInfinity, Int n -> if Z.leq n Z.zero then NegInfinity else PosInfinity

  let rem x y = sub x (div x y)

  let leq x y = max x y = y

  let rec top = Bounded (NegInfinity, PosInfinity)

  and bottom = Empty

  and const n = Bounded (Int n, Int n)

  and rand a b = if Z.leq a b then Bounded (Int a, Int b) else Empty
  
  and unary t op = match t with
  | Empty -> Empty
  | Bounded (a, b) ->
    let op = match op with
    | AST_UNARY_PLUS -> pos
    | AST_UNARY_MINUS -> neg
    in Bounded (op a, op b)

  and binary lhs rhs op = match (lhs, rhs) with
  | Empty, _ | _, Empty -> Empty
  | Bounded (a, b), Bounded (c, d) -> match op with
    | AST_PLUS -> Bounded (add a c, add b d)
    | AST_MINUS -> Bounded (sub a d, sub b c)
    | AST_MULTIPLY ->
      let tmp1 = mul a c in
      let tmp2 = mul a d in
      let tmp3 = mul b c in
      let tmp4 = mul b d in
      let tmp5 = max tmp1 tmp2 in
      let tmp6 = min tmp1 tmp2 in
      let tmp7 = max tmp3 tmp4 in
      let tmp8 = min tmp3 tmp4 in
      Bounded (min tmp6 tmp8, max tmp5 tmp7)
    | AST_DIVIDE ->
      if leq c (Int (Z.neg Z.one)) && leq (Int Z.one) d
      then Bounded (NegInfinity, PosInfinity)
      else if c = Int Z.zero && d = Int Z.zero
      then Empty
      else
        let (tmp1, tmp2, tmp3, tmp4) =
          if Int Z.zero = c
          then
            (div a d, div b d, mul a PosInfinity, mul b PosInfinity)
          else if Int Z.zero = d
          then
            (mul a NegInfinity, mul b NegInfinity, div a c, div b c)
          else
            (div a d, div b d, div a c, div b c)
        in
        let tmp5 = max tmp1 tmp2 in
        let tmp6 = min tmp1 tmp2 in
        let tmp7 = max tmp3 tmp4 in
        let tmp8 = min tmp3 tmp4 in
        Bounded (min tmp6 tmp8, max tmp5 tmp7)
    | AST_MODULO -> (* a % b = a - (a / b) * b *)
      binary lhs (binary (binary lhs rhs AST_DIVIDE) rhs AST_MULTIPLY) AST_MINUS

  (* comparison *)
  (* [compare x y op] returns (x',y') where
     - x' abstracts the set of v  in x such that v op v' is true for some v' in y
     - y' abstracts the set of v' in y such that v op v' is true for some v  in x
     i.e., we filter the abstract values x and y knowing that the test is true
     a safe, but not precise implementation, would be:
     compare x y op = (x,y)
   *)
  and compare x y op = match (x, y) with
  | Empty, _ | _, Empty -> (Empty, Empty)
  | Bounded (a, b), Bounded (c, d) -> match op with
    | AST_EQUAL -> let i = meet x y in (i, i)
    | AST_NOT_EQUAL ->
      let (x', y') = compare x y AST_LESS in
      let (x'', y'') = compare x y AST_GREATER in
      (join x' x'', join y' y'')
    | AST_LESS ->
      let (x', y') = compare (binary x (const Z.one) AST_PLUS) y AST_LESS_EQUAL in
      (binary x' (const Z.one) AST_MINUS, y')
    | AST_LESS_EQUAL ->
      let b' = min b d in
      let c' = max a c in
      let x' = if leq (add (Int Z.one) b') a
        then Empty
        else Bounded (a, b')
      in
      let y' = if leq (add (Int Z.one) d) c'
        then Empty
        else Bounded (c', d)
      in
      (x', y')
    | AST_GREATER -> let (y', x') = compare y x AST_LESS in (x', y')
    | AST_GREATER_EQUAL -> let (y', x') = compare y x AST_LESS_EQUAL in (x', y')

  (* backards unary operation *)
  (* [bwd_unary x op r] return x':
     - x' abstracts the set of v in x such as op v is in r
     i.e., we fiter the abstract values x knowing the result r of applying
     the operation on x
  *)
  and bwd_unary x op r = meet x (unary r op) (* op op r = r *)

  (* backward binary operation *)
  (* [bwd_binary x y op r] returns (x',y') where
    - x' abstracts the set of v  in x such that v op v' is in r for some v' in y
    - y' abstracts the set of v' in y such that v op v' is in r for some v  in x
    i.e., we filter the abstract values x and y knowing that, after
    applying the operation op, the result is in r
   *)
  and bwd_binary x y op r = match op with (* we try to invert op _ y and op x _ *)
  | AST_PLUS -> (meet x (binary r y AST_MINUS), meet y (binary r x AST_MINUS))
  | AST_MINUS -> (meet x (binary r y AST_PLUS), meet y (binary (unary r AST_UNARY_MINUS) x AST_MINUS))
  | AST_MULTIPLY ->
    let contains_zero = function
      | Empty -> false
      | Bounded (left, right) ->
        let zero = Int Z.zero in
        leq left zero && leq zero right in
    let reverse_one j pivot target =
      if contains_zero pivot && contains_zero target
      then j
      else meet j (binary target pivot AST_DIVIDE) in
    (reverse_one x y r, reverse_one y x r)
  | AST_DIVIDE -> (meet x (binary r y AST_MULTIPLY), meet y (binary x r AST_DIVIDE))
  | AST_MODULO -> (x, y) (* can't figure out a better approximation *)

  (* set-theoretic operations *)
  and join x y = match (x, y) with
  | Empty, z | z, Empty -> z
  | Bounded (a, b), Bounded (c, d) -> Bounded (min a c, max b d)

  and meet x y = match (x, y) with
  | Empty, _ | _, Empty -> Empty
  | Bounded (a, b), Bounded (c, d) ->
    let x = max a c in
    let y = min b d in
    if not (leq x y) then Empty else Bounded (x, y)

  (* widening *)
  and widen _ _ = assert false

  (* narrowing *)
  and narrow _ _ = assert false

  (* subset inclusion of concretizations *)
  and subset x y = match (x, y) with
  | Empty, _ -> true
  | _, Empty -> false
  | Bounded (a, b), Bounded (c, d) -> leq c a && leq b d

  (* check the emptiness of the concretization *)
  and is_bottom = function
  | Empty -> true
  | Bounded _ -> false

  and print_bound fmt = function
  | NegInfinity -> Format.pp_print_string fmt "-oo"
  | PosInfinity -> Format.pp_print_string fmt "+oo"
  | Int n -> Z.pp_print fmt n

  (* print abstract element *)
  and print fmt x = match x with
  | Empty -> Format.pp_print_string fmt "∅"
  | Bounded (a, b) ->
    Format.pp_print_string fmt "[";
    print_bound fmt a;
    Format.pp_print_string fmt "; ";
    print_bound fmt b;
    Format.pp_print_string fmt "]"
end
