
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20220210

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TOK_int of (
# 68 "frontend/parser.mly"
       (string)
# 20 "frontend/parser.ml"
  )
    | TOK_id of (
# 67 "frontend/parser.mly"
       (string)
# 25 "frontend/parser.ml"
  )
    | TOK_WHILE
    | TOK_VOID
    | TOK_TRUE
    | TOK_STAR_EQUAL
    | TOK_STAR
    | TOK_SEMICOLON
    | TOK_RPAREN
    | TOK_RETURN
    | TOK_RCURLY
    | TOK_RAND
    | TOK_PLUS_PLUS
    | TOK_PLUS_EQUAL
    | TOK_PLUS
    | TOK_PERCENT_EQUAL
    | TOK_PERCENT
    | TOK_NOT_EQUAL
    | TOK_MINUS_MINUS
    | TOK_MINUS_EQUAL
    | TOK_MINUS
    | TOK_LPAREN
    | TOK_LESS_EQUAL
    | TOK_LESS
    | TOK_LCURLY
    | TOK_INT
    | TOK_IF
    | TOK_GREATER_EQUAL
    | TOK_GREATER
    | TOK_GOTO
    | TOK_FOR
    | TOK_FALSE
    | TOK_EXCLAIM
    | TOK_EQUAL_EQUAL
    | TOK_EQUAL
    | TOK_EOF
    | TOK_ELSE
    | TOK_DIVIDE_EQUAL
    | TOK_DIVIDE
    | TOK_COMMA
    | TOK_COLON
    | TOK_BREAK
    | TOK_BRAND
    | TOK_BAR_BAR
    | TOK_ASSERT
    | TOK_AND_AND
  
end

include MenhirBasics

# 15 "frontend/parser.mly"
  
open Abstract_syntax_tree

# 80 "frontend/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | TOK_AND_AND ->
          46
      | TOK_ASSERT ->
          45
      | TOK_BAR_BAR ->
          44
      | TOK_BRAND ->
          43
      | TOK_BREAK ->
          42
      | TOK_COLON ->
          41
      | TOK_COMMA ->
          40
      | TOK_DIVIDE ->
          39
      | TOK_DIVIDE_EQUAL ->
          38
      | TOK_ELSE ->
          37
      | TOK_EOF ->
          36
      | TOK_EQUAL ->
          35
      | TOK_EQUAL_EQUAL ->
          34
      | TOK_EXCLAIM ->
          33
      | TOK_FALSE ->
          32
      | TOK_FOR ->
          31
      | TOK_GOTO ->
          30
      | TOK_GREATER ->
          29
      | TOK_GREATER_EQUAL ->
          28
      | TOK_IF ->
          27
      | TOK_INT ->
          26
      | TOK_LCURLY ->
          25
      | TOK_LESS ->
          24
      | TOK_LESS_EQUAL ->
          23
      | TOK_LPAREN ->
          22
      | TOK_MINUS ->
          21
      | TOK_MINUS_EQUAL ->
          20
      | TOK_MINUS_MINUS ->
          19
      | TOK_NOT_EQUAL ->
          18
      | TOK_PERCENT ->
          17
      | TOK_PERCENT_EQUAL ->
          16
      | TOK_PLUS ->
          15
      | TOK_PLUS_EQUAL ->
          14
      | TOK_PLUS_PLUS ->
          13
      | TOK_RAND ->
          12
      | TOK_RCURLY ->
          11
      | TOK_RETURN ->
          10
      | TOK_RPAREN ->
          9
      | TOK_SEMICOLON ->
          8
      | TOK_STAR ->
          7
      | TOK_STAR_EQUAL ->
          6
      | TOK_TRUE ->
          5
      | TOK_VOID ->
          4
      | TOK_WHILE ->
          3
      | TOK_id _ ->
          2
      | TOK_int _ ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | TOK_AND_AND ->
          Obj.repr ()
      | TOK_ASSERT ->
          Obj.repr ()
      | TOK_BAR_BAR ->
          Obj.repr ()
      | TOK_BRAND ->
          Obj.repr ()
      | TOK_BREAK ->
          Obj.repr ()
      | TOK_COLON ->
          Obj.repr ()
      | TOK_COMMA ->
          Obj.repr ()
      | TOK_DIVIDE ->
          Obj.repr ()
      | TOK_DIVIDE_EQUAL ->
          Obj.repr ()
      | TOK_ELSE ->
          Obj.repr ()
      | TOK_EOF ->
          Obj.repr ()
      | TOK_EQUAL ->
          Obj.repr ()
      | TOK_EQUAL_EQUAL ->
          Obj.repr ()
      | TOK_EXCLAIM ->
          Obj.repr ()
      | TOK_FALSE ->
          Obj.repr ()
      | TOK_FOR ->
          Obj.repr ()
      | TOK_GOTO ->
          Obj.repr ()
      | TOK_GREATER ->
          Obj.repr ()
      | TOK_GREATER_EQUAL ->
          Obj.repr ()
      | TOK_IF ->
          Obj.repr ()
      | TOK_INT ->
          Obj.repr ()
      | TOK_LCURLY ->
          Obj.repr ()
      | TOK_LESS ->
          Obj.repr ()
      | TOK_LESS_EQUAL ->
          Obj.repr ()
      | TOK_LPAREN ->
          Obj.repr ()
      | TOK_MINUS ->
          Obj.repr ()
      | TOK_MINUS_EQUAL ->
          Obj.repr ()
      | TOK_MINUS_MINUS ->
          Obj.repr ()
      | TOK_NOT_EQUAL ->
          Obj.repr ()
      | TOK_PERCENT ->
          Obj.repr ()
      | TOK_PERCENT_EQUAL ->
          Obj.repr ()
      | TOK_PLUS ->
          Obj.repr ()
      | TOK_PLUS_EQUAL ->
          Obj.repr ()
      | TOK_PLUS_PLUS ->
          Obj.repr ()
      | TOK_RAND ->
          Obj.repr ()
      | TOK_RCURLY ->
          Obj.repr ()
      | TOK_RETURN ->
          Obj.repr ()
      | TOK_RPAREN ->
          Obj.repr ()
      | TOK_SEMICOLON ->
          Obj.repr ()
      | TOK_STAR ->
          Obj.repr ()
      | TOK_STAR_EQUAL ->
          Obj.repr ()
      | TOK_TRUE ->
          Obj.repr ()
      | TOK_VOID ->
          Obj.repr ()
      | TOK_WHILE ->
          Obj.repr ()
      | TOK_id _v ->
          Obj.repr _v
      | TOK_int _v ->
          Obj.repr _v
  
  and default_reduction =
    (8, "\000\000\000\000[\000D?\000\000L\000\000\000\000\000(\000\000\000\000M\000N\000O\000\000\0001\000\000\000\000\000,'\000\000\000.\000-\000\000\000\000;3\0002\000\000H\000\b\000\000\000\000\t\000\000\000\000\000\030\000\000\000\000\027\000\000\012\000\r\000\023\000\000\000\000\000\000\000\000\000\000\000\000\000\014\000\000\011\000\000\000\015\000\000 \000\000\031\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000!\000\000\0009\n\000\000\000\000\000\000\000\029\000\000\000\000\028\025\000\000\000\000=\000\\\000\000JXT\000\000\024\000\000F\000\000\000VRQWS\000\000\000\000\000\000\000\000\000\000P\0005\000\026\000$Y\000\000\000\000\000\000\000#\0007Z\000\"\001")
  
  and error =
    (47, "\b\000\000 \b\000@\000\000\000\000\000\000\000\b\000\000\000\002\000\001\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\128\000\000\000@\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\004\000\000\006\022\000\014`\004\128\129\166\128\004\1440\004\131\000\000\000\000\000\000\000\000\000\003\130\207\024C\021\129$\024\000\000\000\000\000\016\000\000\004\000\016@\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\002\000\b \000\000\000\004\000\000\000\000\000\000\000\000\000\000\024\002A\128\000\0000\004\131\000\000\000`\t\006\000\000\000\002\130\136\000\002\001\128$\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\001 \192\000\000\000pYc\bb\176\004\131\000\000\000\000\000\000\000\000\000\192\018\012\000\000\000\000\000\000\000\000\003\000H0\000\000\000\028\022X\194\024\1608,\177\1321@pYc\bb\128\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\n\n \000\012\006\000\144`\000\000\000\000\000\000\000\000\000pQ\000\000`\000\000\000\000\000\000`\t\006\000\000\000\003\130\136\000\003\001\128$\024\000\000\000\014\n \000\012\000\000\000\000\000\000\012\001 \192\000\000\000pQ\000\000`0$\131\000\000\000\000@\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\003\000H0\000\000\000\028\020@\000\024\012\001 \192\000\000\000pQ\000\000`\000\000\000\000\000\000\000\000\002\000\000\000\200\018\012\001\128 \000\000\000\000\000\003 H0\006\000\128\000\000\000\000\000\012\129 \192\024\002\000\000\000\000\000\000\000\128\178\198\016\128`\t\006\000\000\000\003\130\136\000\002\021\128$\024\000\000\000\014\n \000\bV\000\144`\000\000\0008(\128\000!X\002A\128\000\000\000\224\162\000\000\133`\t\006\000\000\000\003\130\136\000\002\021\128$\024\000\000\000\014\n \000\bP\000\000\000\000\000\000(,\177\132 \000\016\000\000\000\002\128\000\000\000\000\000d\t\006\000\192\016\001\128\000\000\000\021\144$\024\003\000@\000\000\000\000\000\000\004\000\000\000\000\166\020\000\014`\004\128\000\000\000\000\0000D\131\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\006\005\016\000\004\001\133\128\003\152\001 \000\000 \000\000\012\129 \192\024\002\000\016\000\000\000\002\152P\0009\128\018\000\000\002\000\000\000\200\018\012\001\128 \001\000\000\000\000)\133\000\003\152\001 \000\000 \000\000\012\129 \192\024\002\000\016\000\000\000\002\152P\0009\128\018 \000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\002\b\000\000\000\000\000@\211\000\002@\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\201\018\012\001\128 \002\000\000\000\000\001\002\000\000\000\000\000\004\000\000\000\000\006\020\000\014`\004\128 \000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\200\018\012\001\128 \001\000\000\000\000(\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b \000\000\000\000\000@\000\000\b@`\t\006\000\000\000\003\002\136\000\003\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\016\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\194\192\001\204\016\144\004\000\000\000\000\000\000\000\000\000\000\000\024\000\000\000\016\b\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\n\000\000\000\000\b\000\194\128\001\204\000\144\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000a@\000\230\000H\000\000\b\000\000\001\004\000\000\000\000\000\b\000\000\000\000\012\145 \192\024\002\000 \000\000\000\000\016 \000\000\000\000\000@\000\000\000\000a@\000\230\000H\000\000\000\000\000\001\133\128\003\152\001 \000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\130\000\000\000\000\000\004\000\016\000\132\000\004\000\002\000\000\000\b\000\000\000\000\000\000\000\016\000\000\024X\0009\128\018\000\016\000\000\000\000\000\000\000\000\000\000 \000\000\128 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((16, "\000*\000\014\000\016\000\r\000\000\000:\000\000\000\000\000\005\000\r\000\000\000P\0006\001j\002\018\001J\000\000\000\015\001J\000L\000\006\000\000\000~\000\000\000\142\000\000\000F\000\006\000\136\000\000\001J\001J\001J\001\158\001J\000\000\000\000\001J\0006\001J\000\000\001J\000\000\001J\000z\000\190\001\002\000\000\000\000\000\158\000\000\003~\001J\000\000\002\238\000\000\001J\003\004\001J\003\"\000\000\001J\0038\001J\000\164\000\168\000\000\001J\003V\001J\003l\000\000\000\152\002\n\000\000\002\n\000\000\002\n\000\000\001\158\001J\0022\001J\002X\001J\002v\001J\002\140\001J\002\170\001J\002\208\000\000\001\158\000&\000\000\002\n\000\007\002\n\000\000\000J\001j\000\000\003\168\000\196\000\000\003\160\001j\000\172\002\n\000d\001\204\000\184\002\n\000j\001\204\000\196\002\n\000\130\001\204\000\238\000\228\000\000\000\206\000\022\002\018\000\000\000\000\000\244\002\n\000\246\000\020\000\246\001\204\000\250\000\000\000\236\002\n\000\142\001\012\000\000\000\000\000*\000$\001J\001\158\000\000\001\014\000\000\000\\\000*\000\000\000\000\000\000\001P\001\018\000\000\000\238\000\020\000\000\000\236\000\222\001\204\000\000\000\000\000\000\000\000\000\000\000\224\001j\001\002\000\022\001$\002\n\001&\000\020\001&\001j\000\000\001j\000\000\001*\000\000\001,\000\000\000\000\000\170\000$\000\r\0018\001&\001j\001T\000\000\000*\000\000\000\000\001$\000\000\000\000"), (16, "\000\161\000\161\000\161\000\245\000V\000=\000=\001)\000\161\000\n\000\161\000\161\001\246\001\246\000\161\000J\000\161\000\161\000Z\000\221\000\018\000\161\000\161\002>\000b\000\006\000\145\000\161\001~\000\237\000\014\000\026\000\161\000\161\000\138\000\185\000\185\000\161\000&\000\161\002\242\000=\000\185\001\138\000\158\000\185\001\150\000\018\000\185\0002\000\185\000\185\0006\002B\001!\000\185\000\185\000\213\000\145\001\190\000R\000\185\001\206\001\130\000^\001\138\000\166\000\185\000\138\000\189\000\189\000\185\000f\000\185\001\222\000n\000\189\000v\000\158\000\189\002.\001\130\000\189\001\138\000\189\000\189\002Z\002\238\000\202\000\189\000\189\001\006\001\n\000\237\001\130\000\189\001\138\001\130\001&\001\138\000\166\000\189\000\138\000\169\000\169\000\189\001\166\000\189\001\182\001\130\000\169\001\138\000\158\000\169\001\198\001\130\000\169\001\138\000\169\000\169\001\214\001\230\001\234\000\169\000\169\001\242\001\001\001\017\001\017\000\169\002\006\002\014\002\022\002\030\000\166\000\169\000\138\000\165\000\165\000\169\002&\000\169\0022\002R\000\165\002r\000\158\000\165\002\138\002\166\000\165\002\174\000\165\000\165\002\182\002\190\002\198\000\165\000\165\002z\002\218\002\226\001\130\000\165\001\138\002\250\000B\000F\000\166\000\165\001=\001=\002\254\000\165\000\229\000\165\001=\000N\001=\001=\000z\003\006\003\027\000:\001\"\000\000\000~\000\130\000\000\001\154\000\000\001\158\000\205\001=\001=\001=\000\000\000\000\001=\001=\000\000\000\000\000\000\000\000\000\000\001Q\001\174\000\018\001\178\000\000\001=\001\226\002\170\001=\000\138\000\149\000\146\000\000\000\000\000\000\000\000\000\000\000\150\002\026\000\158\001B\002\"\000\000\000\174\000\000\001J\001R\000:\001\194\000\000\001Z\001b\000\000\001\154\000\000\001\158\001j\000\000\000\000\000\000\000\000\000\166\000\149\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\174\000\018\001\210\000\000\000\000\001\226\001\238\000B\000F\000\000\000\000\001*\000\000\000\000\000\253\000\000\000>\002\026\000N\000\000\002\"\000z\000\000\000\222\000\226\000\000\000\234\000~\001.\000\242\000\246\000\000\000\254\000\138\000U\000U\000\000\000\000\0012\0016\000\000\000\150\000\000\000\158\000\000\001\014\000\000\000\174\001\022\001:\000\000\001\030\000\138\000I\000I\000\000\000\000\000\000\000\000\000\000\000\150\000\000\000\158\000\000\000\000\000\166\000\174\000\138\000A\000A\000U\000\000\000U\000\000\000\000\000\150\000\000\000\158\000\138\000M\000M\000\174\000\000\000\000\000\166\000\000\000\150\000\000\000\158\000I\000\000\000I\000\174\000\138\000E\000E\000\000\000\000\000\000\000\166\000\000\000\150\000\000\000\158\000A\000\000\000A\000\174\000\000\000\000\000\166\000\000\000\138\000Q\000Q\000M\000\000\000M\000\000\000\000\000\150\000\000\000\158\000\000\000\000\000\166\000\174\000\138\000\t\000\t\000E\000\000\000E\000\000\000\000\000\150\000\000\000\158\000\138\000\021\000\021\000\174\000\000\000\000\000\166\000\000\000\150\000\000\000\158\000Q\000\000\000Q\000\174\000\138\000\017\000\017\000\000\000\000\000\000\000\166\000\t\000\150\000\000\000\158\000\138\000\025\000\025\000\174\000\000\000\000\000\166\000\021\000\150\000\000\000\158\000\000\000\000\000\000\000\174\000\138\000\005\000\005\000\000\000\000\000\000\000\166\000\017\000\150\000\000\000\158\000\138\000\r\000\r\000\174\000\000\000\000\000\166\000\025\000\150\000\138\000\158\001\025\000\000\000\000\000\174\000\000\000\000\000\150\000\000\000\158\000\000\000\166\000\005\000\174\000B\000F\000\138\001\t\000\000\000\000\000\000\001\005\000\166\000\r\000\150\000N\000\158\000\000\000z\000\000\000\174\000\166\000\210\000\000\000~\000\130\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\166"))
  
  and lhs =
    (8, "\000\028\028\028\028\028\028\028\028\027\026\026\026\026\026\026\026\026\026\026\026\026\026\025\025\025\025\025\025\025\025\025\025\024\023\023\022\022\021\021\021\021\021\021\021\021\021\021\021\021\020\019\019\018\018\017\017\016\016\015\015\014\014\r\r\012\012\011\n\n\t\t\b\b\007\007\006\006\006\005\005\005\005\005\004\004\004\004\003\003\002\001")
  
  and goto =
    ((16, "\000\003\000\000\000\000\000,\000\000\000\000\000\000\000\000\000\000\000\138\000\000\000\000\000\000\000\004\000\000\000!\000\000\000\000\000\148\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000,\000\000\000\000\000\020\000^\000b\000\000\000r\000\000\000\000\000\170\000\000\000\238\000\000\001\016\000\000\001\018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\184\000\000\000\000\000\000\001\022\000\000\001\024\000\000\000\000\001\026\000\000\000\176\000\000\000\000\000\000\001\028\000\000\001\030\000\000\000\000\000\000\000\003\000\000\000\162\000\000\000\216\000\000\000\000\001 \000\000\001\"\000\000\001$\000\000\001&\000\000\001*\000\000\001,\000\000\000\000\000\000\000\000\000\000\000\234\000\000\000\246\000\000\000\000\000z\000\000\0004\000\000\000\000\000\000\000\014\000\000\000\252\000\000\000\018\000\000\000\254\000\000\000\028\000\000\001\004\000\000\000N\000\000\000\000\000\000\000\000\000\190\000\000\000\000\000\000\000\000\000N\000\000\000\200\000\000\000X\000\000\000\000\000\000\001\n\000\000\000\000\000\000\000\000\000\248\000\000\001.\000\000\000\000\000\000\000\000\000\000\001&\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\150\000\000\000\000\000\000\000b\000\000\000\000\000\000\000\000\000\000\000\000\000\172\000\000\000\216\000\000\000\248\000\000\000\228\000\000\000\182\000\000\000l\000\000\000\000\000\000\000\000\000\000\000\000\000\248\000\000\000\238\000\000\000\000\000p\000\000\000\000\000\194\000\000\000\000\000\000\000\000\000\000"), (8, "\186\187\195\142\1437\027\180\142\143\142\143\180\169\166\142\143\198\167\168P\184\197\200\006e\182\179\029\b\156/\179\t\155\156\012\156i\155\142\143\156\162\166\142\143k\153\154\142\143\131\164\165\142\143\142\143\180P\180\142\143\155\161\168\156.\155\"\006\156\181\155\193\011\156$\179\t\179\1560\156\160\179\142\143\1561\165\142\14324\1540\186\187\1956^\1581\127'_A4\127\179\1284\156\196\179\128\127\156\197\006\129\158\127\128\b\133\158P\t\128\147\190]\173\158\175P\148)\177\158bPP\150PPd\161PosP\152w+-\139:<?EGRTVX\150Z\\\146"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 327 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 340 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 349 "frontend/parser.ml"
            
          in
          (
# 236 "frontend/parser.mly"
    ( AST_assign (e, f) )
# 355 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 391 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 404 "frontend/parser.ml"
            
          in
          let o = 
# 175 "frontend/parser.mly"
                           ( AST_MULTIPLY )
# 410 "frontend/parser.ml"
           in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 418 "frontend/parser.ml"
            
          in
          (
# 239 "frontend/parser.mly"
    ( AST_assign_op (e, o, f) )
# 424 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 460 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 473 "frontend/parser.ml"
            
          in
          let o = 
# 176 "frontend/parser.mly"
                           ( AST_DIVIDE )
# 479 "frontend/parser.ml"
           in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 487 "frontend/parser.ml"
            
          in
          (
# 239 "frontend/parser.mly"
    ( AST_assign_op (e, o, f) )
# 493 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 529 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 542 "frontend/parser.ml"
            
          in
          let o = 
# 177 "frontend/parser.mly"
                           ( AST_MODULO )
# 548 "frontend/parser.ml"
           in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 556 "frontend/parser.ml"
            
          in
          (
# 239 "frontend/parser.mly"
    ( AST_assign_op (e, o, f) )
# 562 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 598 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 611 "frontend/parser.ml"
            
          in
          let o = 
# 178 "frontend/parser.mly"
                           ( AST_PLUS )
# 617 "frontend/parser.ml"
           in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 625 "frontend/parser.ml"
            
          in
          (
# 239 "frontend/parser.mly"
    ( AST_assign_op (e, o, f) )
# 631 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 667 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let f =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 680 "frontend/parser.ml"
            
          in
          let o = 
# 179 "frontend/parser.mly"
                           ( AST_MINUS )
# 686 "frontend/parser.ml"
           in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 694 "frontend/parser.ml"
            
          in
          (
# 239 "frontend/parser.mly"
    ( AST_assign_op (e, o, f) )
# 700 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 729 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__2_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 741 "frontend/parser.ml"
            
          in
          (
# 242 "frontend/parser.mly"
    ( AST_increment (e,1) )
# 747 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 776 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__2_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 788 "frontend/parser.ml"
            
          in
          (
# 245 "frontend/parser.mly"
    ( AST_increment (e,-1); )
# 794 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic xs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_xs_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let l = 
# 229 "<standard.mly>"
    ( xs )
# 821 "frontend/parser.ml"
           in
          (
# 249 "frontend/parser.mly"
                                             ( l )
# 826 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (Abstract_syntax_tree.bool_expr) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Abstract_syntax_tree.bool_expr) = 
# 105 "frontend/parser.mly"
    ( e )
# 866 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Abstract_syntax_tree.bool_expr) = 
# 108 "frontend/parser.mly"
    ( AST_bool_const true )
# 891 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Abstract_syntax_tree.bool_expr) = 
# 111 "frontend/parser.mly"
    ( AST_bool_const false )
# 916 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 952 "frontend/parser.ml"
            
          in
          let o = 
# 165 "frontend/parser.mly"
                     ( AST_NOT )
# 958 "frontend/parser.ml"
           in
          (
# 114 "frontend/parser.mly"
    ( AST_bool_unary (o,e) )
# 963 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.bool_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1008 "frontend/parser.ml"
            
          in
          let o = 
# 190 "frontend/parser.mly"
                     ( AST_AND )
# 1014 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1022 "frontend/parser.ml"
            
          in
          (
# 117 "frontend/parser.mly"
    ( AST_bool_binary (o,e1,e2) )
# 1028 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.bool_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1073 "frontend/parser.ml"
            
          in
          let o = 
# 191 "frontend/parser.mly"
                     ( AST_OR )
# 1079 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1087 "frontend/parser.ml"
            
          in
          (
# 117 "frontend/parser.mly"
    ( AST_bool_binary (o,e1,e2) )
# 1093 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1138 "frontend/parser.ml"
            
          in
          let o = 
# 182 "frontend/parser.mly"
                     ( AST_LESS )
# 1144 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1152 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1158 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1203 "frontend/parser.ml"
            
          in
          let o = 
# 183 "frontend/parser.mly"
                     ( AST_GREATER )
# 1209 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1217 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1223 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1268 "frontend/parser.ml"
            
          in
          let o = 
# 184 "frontend/parser.mly"
                     ( AST_LESS_EQUAL )
# 1274 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1282 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1288 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1333 "frontend/parser.ml"
            
          in
          let o = 
# 185 "frontend/parser.mly"
                     ( AST_GREATER_EQUAL )
# 1339 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1347 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1353 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1398 "frontend/parser.ml"
            
          in
          let o = 
# 186 "frontend/parser.mly"
                     ( AST_EQUAL )
# 1404 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1412 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1418 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1463 "frontend/parser.ml"
            
          in
          let o = 
# 187 "frontend/parser.mly"
                     ( AST_NOT_EQUAL )
# 1469 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1477 "frontend/parser.ml"
            
          in
          (
# 120 "frontend/parser.mly"
    ( AST_compare (o,e1,e2) )
# 1483 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Abstract_syntax_tree.bool_expr) = 
# 123 "frontend/parser.mly"
    ( AST_bool_rand )
# 1509 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let a : (Abstract_syntax_tree.stat) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos__2_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 252 "frontend/parser.mly"
                         ( a )
# 1541 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.var_decl) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let d =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1570 "frontend/parser.ml"
            
          in
          (
# 253 "frontend/parser.mly"
                  ( AST_local_decl d )
# 1576 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = l;
            MenhirLib.EngineTypes.startp = _startpos_l_;
            MenhirLib.EngineTypes.endp = _endpos_l_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let l : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic l in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 254 "frontend/parser.mly"
                                          ( AST_block l )
# 1616 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 1644 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__2_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1656 "frontend/parser.ml"
            
          in
          (
# 255 "frontend/parser.mly"
                          ( AST_label e )
# 1662 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1720 "frontend/parser.ml"
            
          in
          (
# 256 "frontend/parser.mly"
                                                                  ( AST_assert e )
# 1726 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let x : unit = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__2_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1763 "frontend/parser.ml"
            
          in
          (
# 257 "frontend/parser.mly"
                                 ( AST_break e )
# 1769 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = l;
              MenhirLib.EngineTypes.startp = _startpos_l_;
              MenhirLib.EngineTypes.endp = _endpos_l_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let l : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = Obj.magic l in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 1819 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__5_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1831 "frontend/parser.ml"
            
          in
          (
# 258 "frontend/parser.mly"
                                                                    ( AST_stat_call (e, l) )
# 1837 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext option) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 259 "frontend/parser.mly"
                                                   ( AST_return e )
# 1877 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 260 "frontend/parser.mly"
                ( AST_SKIP )
# 1902 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 1936 "frontend/parser.ml"
        ) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1949 "frontend/parser.ml"
            
          in
          (
# 261 "frontend/parser.mly"
                                       ( AST_goto e )
# 1955 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let x : (Abstract_syntax_tree.toplevel list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__2_ in
        let _v =
          let t =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 1992 "frontend/parser.ml"
            
          in
          (
# 92 "frontend/parser.mly"
                                    ( t )
# 1998 "frontend/parser.ml"
           : (Abstract_syntax_tree.toplevel list Abstract_syntax_tree.ext))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = l;
            MenhirLib.EngineTypes.startp = _startpos_l_;
            MenhirLib.EngineTypes.endp = _endpos_l_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _6;
              MenhirLib.EngineTypes.startp = _startpos__6_;
              MenhirLib.EngineTypes.endp = _endpos__6_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _5;
                MenhirLib.EngineTypes.startp = _startpos__5_;
                MenhirLib.EngineTypes.endp = _endpos__5_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = xs;
                  MenhirLib.EngineTypes.startp = _startpos_xs_;
                  MenhirLib.EngineTypes.endp = _endpos_xs_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _3;
                    MenhirLib.EngineTypes.startp = _startpos__3_;
                    MenhirLib.EngineTypes.endp = _endpos__3_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = x;
                      MenhirLib.EngineTypes.startp = _startpos_x_;
                      MenhirLib.EngineTypes.endp = _endpos_x_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = t;
                        MenhirLib.EngineTypes.startp = _startpos_t_;
                        MenhirLib.EngineTypes.endp = _endpos_t_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let l : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic l in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 2070 "frontend/parser.ml"
        ) = Obj.magic x in
        let t : (Abstract_syntax_tree.typ) = Obj.magic t in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_t_ in
        let _endpos = _endpos__8_ in
        let _v =
          let p = 
# 229 "<standard.mly>"
    ( xs )
# 2080 "frontend/parser.ml"
           in
          let i =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2088 "frontend/parser.ml"
            
          in
          let t =
            let x = 
# 224 "frontend/parser.mly"
             ( Some t )
# 2095 "frontend/parser.ml"
             in
            let (_endpos_x_, _startpos_x_) = (_endpos_t_, _startpos_t_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2103 "frontend/parser.ml"
            
          in
          let _endpos = _endpos__8_ in
          let _startpos = _startpos_t_ in
          (
# 210 "frontend/parser.mly"
  ( { Abstract_syntax_tree.fun_name = i;
      Abstract_syntax_tree.fun_typ = t;
      Abstract_syntax_tree.fun_args = p;
      Abstract_syntax_tree.fun_body = l;
      Abstract_syntax_tree.fun_ext = (_startpos, _endpos); }
  )
# 2116 "frontend/parser.ml"
           : (Abstract_syntax_tree.fun_decl))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = l;
            MenhirLib.EngineTypes.startp = _startpos_l_;
            MenhirLib.EngineTypes.endp = _endpos_l_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _6;
              MenhirLib.EngineTypes.startp = _startpos__6_;
              MenhirLib.EngineTypes.endp = _endpos__6_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _5;
                MenhirLib.EngineTypes.startp = _startpos__5_;
                MenhirLib.EngineTypes.endp = _endpos__5_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = xs;
                  MenhirLib.EngineTypes.startp = _startpos_xs_;
                  MenhirLib.EngineTypes.endp = _endpos_xs_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _3;
                    MenhirLib.EngineTypes.startp = _startpos__3_;
                    MenhirLib.EngineTypes.endp = _endpos__3_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = x;
                      MenhirLib.EngineTypes.startp = _startpos_x_;
                      MenhirLib.EngineTypes.endp = _endpos_x_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let l : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic l in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 2188 "frontend/parser.ml"
        ) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v =
          let p = 
# 229 "<standard.mly>"
    ( xs )
# 2198 "frontend/parser.ml"
           in
          let i =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2206 "frontend/parser.ml"
            
          in
          let t =
            let x = 
# 225 "frontend/parser.mly"
             ( None )
# 2213 "frontend/parser.ml"
             in
            let (_endpos_x_, _startpos_x_) = (_endpos__1_, _startpos__1_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2221 "frontend/parser.ml"
            
          in
          let _startpos_t_ = _startpos__1_ in
          let _endpos = _endpos__8_ in
          let _startpos = _startpos_t_ in
          (
# 210 "frontend/parser.mly"
  ( { Abstract_syntax_tree.fun_name = i;
      Abstract_syntax_tree.fun_typ = t;
      Abstract_syntax_tree.fun_args = p;
      Abstract_syntax_tree.fun_body = l;
      Abstract_syntax_tree.fun_ext = (_startpos, _endpos); }
  )
# 2235 "frontend/parser.ml"
           : (Abstract_syntax_tree.fun_decl))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 2257 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let v =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2269 "frontend/parser.ml"
            
          in
          (
# 203 "frontend/parser.mly"
                                            ( v, None )
# 2275 "frontend/parser.ml"
           : (Abstract_syntax_tree.var_init))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 2311 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let i =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2324 "frontend/parser.ml"
            
          in
          let v =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2333 "frontend/parser.ml"
            
          in
          (
# 204 "frontend/parser.mly"
                                            ( v, Some i )
# 2339 "frontend/parser.ml"
           : (Abstract_syntax_tree.var_init))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (Abstract_syntax_tree.int_expr) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Abstract_syntax_tree.int_expr) = 
# 128 "frontend/parser.mly"
    ( e )
# 2379 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 68 "frontend/parser.mly"
       (string)
# 2400 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2412 "frontend/parser.ml"
            
          in
          (
# 131 "frontend/parser.mly"
    ( AST_int_const e )
# 2418 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 2440 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2452 "frontend/parser.ml"
            
          in
          (
# 134 "frontend/parser.mly"
    ( AST_int_identifier e )
# 2458 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2495 "frontend/parser.ml"
            
          in
          let o = 
# 161 "frontend/parser.mly"
                     ( AST_UNARY_PLUS )
# 2501 "frontend/parser.ml"
           in
          (
# 137 "frontend/parser.mly"
    ( AST_int_unary (o,e) )
# 2506 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2543 "frontend/parser.ml"
            
          in
          let o = 
# 162 "frontend/parser.mly"
                     ( AST_UNARY_MINUS )
# 2549 "frontend/parser.ml"
           in
          (
# 137 "frontend/parser.mly"
    ( AST_int_unary (o,e) )
# 2554 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2599 "frontend/parser.ml"
            
          in
          let o = 
# 168 "frontend/parser.mly"
                     ( AST_MULTIPLY )
# 2605 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2613 "frontend/parser.ml"
            
          in
          (
# 140 "frontend/parser.mly"
    ( AST_int_binary (o,e1,e2) )
# 2619 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2664 "frontend/parser.ml"
            
          in
          let o = 
# 169 "frontend/parser.mly"
                     ( AST_DIVIDE )
# 2670 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2678 "frontend/parser.ml"
            
          in
          (
# 140 "frontend/parser.mly"
    ( AST_int_binary (o,e1,e2) )
# 2684 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2729 "frontend/parser.ml"
            
          in
          let o = 
# 170 "frontend/parser.mly"
                     ( AST_MODULO )
# 2735 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2743 "frontend/parser.ml"
            
          in
          (
# 140 "frontend/parser.mly"
    ( AST_int_binary (o,e1,e2) )
# 2749 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2794 "frontend/parser.ml"
            
          in
          let o = 
# 171 "frontend/parser.mly"
                     ( AST_PLUS )
# 2800 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2808 "frontend/parser.ml"
            
          in
          (
# 140 "frontend/parser.mly"
    ( AST_int_binary (o,e1,e2) )
# 2814 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.int_expr) = Obj.magic x_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2859 "frontend/parser.ml"
            
          in
          let o = 
# 172 "frontend/parser.mly"
                     ( AST_MINUS )
# 2865 "frontend/parser.ml"
           in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2873 "frontend/parser.ml"
            
          in
          (
# 140 "frontend/parser.mly"
    ( AST_int_binary (o,e1,e2) )
# 2879 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x_inlined1;
            MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
            MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let x_inlined1 : (string) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (string) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v =
          let e2 =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2945 "frontend/parser.ml"
            
          in
          let e1 =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 2954 "frontend/parser.ml"
            
          in
          (
# 144 "frontend/parser.mly"
    ( AST_int_rand (e1, e2) )
# 2960 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = l;
            MenhirLib.EngineTypes.startp = _startpos_l_;
            MenhirLib.EngineTypes.endp = _endpos_l_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let l : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = Obj.magic l in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 67 "frontend/parser.mly"
       (string)
# 3003 "frontend/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__4_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3015 "frontend/parser.ml"
            
          in
          (
# 147 "frontend/parser.mly"
    ( AST_expr_call (e, l) )
# 3021 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = Obj.magic xs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_xs_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let l = 
# 229 "<standard.mly>"
    ( xs )
# 3048 "frontend/parser.ml"
           in
          (
# 151 "frontend/parser.mly"
                                               ( l )
# 3053 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = 
# 208 "<standard.mly>"
    ( [] )
# 3072 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic xs in
        let x : (Abstract_syntax_tree.stat) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3108 "frontend/parser.ml"
            
          in
          (
# 210 "<standard.mly>"
    ( x :: xs )
# 3114 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.toplevel list) = 
# 208 "<standard.mly>"
    ( [] )
# 3133 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.toplevel list) = Obj.magic xs in
        let x : (Abstract_syntax_tree.toplevel) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Abstract_syntax_tree.toplevel list) = 
# 210 "<standard.mly>"
    ( x :: xs )
# 3165 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = 
# 139 "<standard.mly>"
    ( [] )
# 3183 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = 
# 141 "<standard.mly>"
    ( x )
# 3208 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = 
# 139 "<standard.mly>"
    ( [] )
# 3226 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = 
# 141 "<standard.mly>"
    ( x )
# 3251 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.var_init list) = 
# 139 "<standard.mly>"
    ( [] )
# 3269 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.var_init list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Abstract_syntax_tree.var_init list) = 
# 141 "<standard.mly>"
    ( x )
# 3294 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = 
# 139 "<standard.mly>"
    ( [] )
# 3314 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = 
# 141 "<standard.mly>"
    ( x )
# 3343 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.bool_expr Abstract_syntax_tree.ext option) = 
# 111 "<standard.mly>"
    ( None )
# 3361 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3390 "frontend/parser.ml"
            
          in
          (
# 113 "<standard.mly>"
    ( Some x )
# 3396 "frontend/parser.ml"
           : (Abstract_syntax_tree.bool_expr Abstract_syntax_tree.ext option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext option) = 
# 111 "<standard.mly>"
    ( None )
# 3415 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3444 "frontend/parser.ml"
            
          in
          (
# 113 "<standard.mly>"
    ( Some x )
# 3450 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x_inlined1 : (
# 67 "frontend/parser.mly"
       (string)
# 3478 "frontend/parser.ml"
        ) = Obj.magic x_inlined1 in
        let x : (Abstract_syntax_tree.typ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let v =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3492 "frontend/parser.ml"
            
          in
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3501 "frontend/parser.ml"
            
          in
          (
# 218 "frontend/parser.mly"
                           ( s, v )
# 3507 "frontend/parser.ml"
           : (Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
  string Abstract_syntax_tree.ext))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.stat) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3538 "frontend/parser.ml"
            
          in
          (
# 238 "<standard.mly>"
    ( [ x ] )
# 3544 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Abstract_syntax_tree.stat) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3588 "frontend/parser.ml"
            
          in
          (
# 240 "<standard.mly>"
    ( x :: xs )
# 3594 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3624 "frontend/parser.ml"
            
          in
          (
# 238 "<standard.mly>"
    ( [ x ] )
# 3630 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Abstract_syntax_tree.int_expr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 3674 "frontend/parser.ml"
            
          in
          (
# 240 "<standard.mly>"
    ( x :: xs )
# 3680 "frontend/parser.ml"
           : (Abstract_syntax_tree.int_expr Abstract_syntax_tree.ext list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.var_init) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Abstract_syntax_tree.var_init list) = 
# 238 "<standard.mly>"
    ( [ x ] )
# 3706 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Abstract_syntax_tree.var_init list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Abstract_syntax_tree.var_init) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Abstract_syntax_tree.var_init list) = 
# 240 "<standard.mly>"
    ( x :: xs )
# 3745 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
  string Abstract_syntax_tree.ext) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = 
# 238 "<standard.mly>"
    ( [ x ] )
# 3773 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
  string Abstract_syntax_tree.ext) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((Abstract_syntax_tree.typ Abstract_syntax_tree.ext *
   string Abstract_syntax_tree.ext)
  list) = 
# 240 "<standard.mly>"
    ( x :: xs )
# 3817 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : (
# 68 "frontend/parser.mly"
       (string)
# 3838 "frontend/parser.ml"
        ) = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v : (string) = 
# 156 "frontend/parser.mly"
                       ( i )
# 3846 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let i : (
# 68 "frontend/parser.mly"
       (string)
# 3873 "frontend/parser.ml"
        ) = Obj.magic i in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i_ in
        let _v : (string) = 
# 157 "frontend/parser.mly"
                       ( i )
# 3882 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let i : (
# 68 "frontend/parser.mly"
       (string)
# 3909 "frontend/parser.ml"
        ) = Obj.magic i in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i_ in
        let _v : (string) = 
# 158 "frontend/parser.mly"
                       ( "-"^i )
# 3918 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Abstract_syntax_tree.stat) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 270 "frontend/parser.mly"
                ( s )
# 3943 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let s =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4001 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4010 "frontend/parser.ml"
            
          in
          (
# 271 "frontend/parser.mly"
                                                            ( AST_if (e, s, None) )
# 4016 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined2;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined2_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _6;
            MenhirLib.EngineTypes.startp = _startpos__6_;
            MenhirLib.EngineTypes.endp = _endpos__6_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x_inlined1;
              MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _4;
                MenhirLib.EngineTypes.startp = _startpos__4_;
                MenhirLib.EngineTypes.endp = _endpos__4_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _2;
                    MenhirLib.EngineTypes.startp = _startpos__2_;
                    MenhirLib.EngineTypes.endp = _endpos__2_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let x_inlined2 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined2 in
        let _6 : unit = Obj.magic _6 in
        let x_inlined1 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_inlined2_ in
        let _v =
          let t =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined2_, _startpos_x_inlined2_, x_inlined2) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4089 "frontend/parser.ml"
            
          in
          let s =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4099 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4108 "frontend/parser.ml"
            
          in
          (
# 272 "frontend/parser.mly"
                                                                                           ( AST_if (e, s, Some t) )
# 4114 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let s =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4173 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4182 "frontend/parser.ml"
            
          in
          (
# 273 "frontend/parser.mly"
                                                               ( AST_while (e, s) )
# 4188 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _8;
            MenhirLib.EngineTypes.startp = _startpos__8_;
            MenhirLib.EngineTypes.endp = _endpos__8_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = c;
              MenhirLib.EngineTypes.startp = _startpos_c_;
              MenhirLib.EngineTypes.endp = _endpos_c_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _6;
                MenhirLib.EngineTypes.startp = _startpos__6_;
                MenhirLib.EngineTypes.endp = _endpos__6_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = b;
                  MenhirLib.EngineTypes.startp = _startpos_b_;
                  MenhirLib.EngineTypes.endp = _endpos_b_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _4;
                    MenhirLib.EngineTypes.startp = _startpos__4_;
                    MenhirLib.EngineTypes.endp = _endpos__4_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = a;
                      MenhirLib.EngineTypes.startp = _startpos_a_;
                      MenhirLib.EngineTypes.endp = _endpos_a_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _2;
                        MenhirLib.EngineTypes.startp = _startpos__2_;
                        MenhirLib.EngineTypes.endp = _endpos__2_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = _1;
                          MenhirLib.EngineTypes.startp = _startpos__1_;
                          MenhirLib.EngineTypes.endp = _endpos__1_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.stat) = Obj.magic x in
        let _8 : unit = Obj.magic _8 in
        let c : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic c in
        let _6 : unit = Obj.magic _6 in
        let b : (Abstract_syntax_tree.bool_expr Abstract_syntax_tree.ext option) = Obj.magic b in
        let _4 : unit = Obj.magic _4 in
        let a : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4274 "frontend/parser.ml"
            
          in
          (
# 274 "frontend/parser.mly"
                                                                                                                             ( AST_for (a,b,c,s) )
# 4280 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Abstract_syntax_tree.stat) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Abstract_syntax_tree.stat) = 
# 264 "frontend/parser.mly"
                ( s )
# 4306 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined2;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined2_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _6;
            MenhirLib.EngineTypes.startp = _startpos__6_;
            MenhirLib.EngineTypes.endp = _endpos__6_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x_inlined1;
              MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _4;
                MenhirLib.EngineTypes.startp = _startpos__4_;
                MenhirLib.EngineTypes.endp = _endpos__4_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _2;
                    MenhirLib.EngineTypes.startp = _startpos__2_;
                    MenhirLib.EngineTypes.endp = _endpos__2_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let x_inlined2 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined2 in
        let _6 : unit = Obj.magic _6 in
        let x_inlined1 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_inlined2_ in
        let _v =
          let t =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined2_, _startpos_x_inlined2_, x_inlined2) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4378 "frontend/parser.ml"
            
          in
          let s =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4388 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4397 "frontend/parser.ml"
            
          in
          (
# 265 "frontend/parser.mly"
                                                                                                     ( AST_if (e, s, Some t) )
# 4403 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_x_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_x_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let x_inlined1 : (Abstract_syntax_tree.stat) = Obj.magic x_inlined1 in
        let _4 : unit = Obj.magic _4 in
        let x : (Abstract_syntax_tree.bool_expr) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_inlined1_ in
        let _v =
          let s =
            let (_endpos_x_, _startpos_x_, x) = (_endpos_x_inlined1_, _startpos_x_inlined1_, x_inlined1) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4462 "frontend/parser.ml"
            
          in
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4471 "frontend/parser.ml"
            
          in
          (
# 266 "frontend/parser.mly"
                                                                         ( AST_while (e, s) )
# 4477 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _8;
            MenhirLib.EngineTypes.startp = _startpos__8_;
            MenhirLib.EngineTypes.endp = _endpos__8_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = c;
              MenhirLib.EngineTypes.startp = _startpos_c_;
              MenhirLib.EngineTypes.endp = _endpos_c_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _6;
                MenhirLib.EngineTypes.startp = _startpos__6_;
                MenhirLib.EngineTypes.endp = _endpos__6_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = b;
                  MenhirLib.EngineTypes.startp = _startpos_b_;
                  MenhirLib.EngineTypes.endp = _endpos_b_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _4;
                    MenhirLib.EngineTypes.startp = _startpos__4_;
                    MenhirLib.EngineTypes.endp = _endpos__4_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = a;
                      MenhirLib.EngineTypes.startp = _startpos_a_;
                      MenhirLib.EngineTypes.endp = _endpos_a_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _2;
                        MenhirLib.EngineTypes.startp = _startpos__2_;
                        MenhirLib.EngineTypes.endp = _endpos__2_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = _1;
                          MenhirLib.EngineTypes.startp = _startpos__1_;
                          MenhirLib.EngineTypes.endp = _endpos__1_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.stat) = Obj.magic x in
        let _8 : unit = Obj.magic _8 in
        let c : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic c in
        let _6 : unit = Obj.magic _6 in
        let b : (Abstract_syntax_tree.bool_expr Abstract_syntax_tree.ext option) = Obj.magic b in
        let _4 : unit = Obj.magic _4 in
        let a : (Abstract_syntax_tree.stat Abstract_syntax_tree.ext list) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4563 "frontend/parser.ml"
            
          in
          (
# 267 "frontend/parser.mly"
                                                                                                                                       ( AST_for (a,b,c,s) )
# 4569 "frontend/parser.ml"
           : (Abstract_syntax_tree.stat))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.var_decl) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let d =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4599 "frontend/parser.ml"
            
          in
          (
# 95 "frontend/parser.mly"
                            ( AST_global_decl d )
# 4605 "frontend/parser.ml"
           : (Abstract_syntax_tree.toplevel))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Abstract_syntax_tree.fun_decl) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let d =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4635 "frontend/parser.ml"
            
          in
          (
# 96 "frontend/parser.mly"
                            ( AST_fun_decl d )
# 4641 "frontend/parser.ml"
           : (Abstract_syntax_tree.toplevel))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Abstract_syntax_tree.typ) = 
# 221 "frontend/parser.mly"
             ( AST_TYP_INT )
# 4667 "frontend/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Abstract_syntax_tree.var_init list) = Obj.magic xs in
        let x : (Abstract_syntax_tree.typ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__3_ in
        let _v =
          let i = 
# 229 "<standard.mly>"
    ( xs )
# 4707 "frontend/parser.ml"
           in
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 282 "frontend/parser.mly"
      ( x, (_startpos, _endpos) )
# 4715 "frontend/parser.ml"
            
          in
          (
# 200 "frontend/parser.mly"
  ( s, i )
# 4721 "frontend/parser.ml"
           : (Abstract_syntax_tree.var_decl))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
end

let file =
  fun lexer lexbuf ->
    (Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf) : (Abstract_syntax_tree.toplevel list Abstract_syntax_tree.ext))

module Incremental = struct
  
  let file =
    fun initial_position ->
      (Obj.magic (MenhirInterpreter.start 0 initial_position) : (Abstract_syntax_tree.toplevel list Abstract_syntax_tree.ext) MenhirInterpreter.checkpoint)
  
end

# 285 "frontend/parser.mly"
  

# 4763 "frontend/parser.ml"
