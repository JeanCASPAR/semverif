# 15 "frontend/lexer.mll"
 
open Lexing
open Parser

(* keyword table *)
let kwd_table = Hashtbl.create 10
let _ =
  List.iter (fun (a,b) -> Hashtbl.add kwd_table a b)
    [
     (* types *)
     "void",      TOK_VOID;
     "int",       TOK_INT;

     (* constants *)
     "true",      TOK_TRUE;
     "false",     TOK_FALSE;

     (* expression operators *)
     "rand",      TOK_RAND;
     "brand",     TOK_BRAND;

     (* control flow *)
     "for",       TOK_FOR;
     "while",     TOK_WHILE;
     "return",    TOK_RETURN;
     "break",     TOK_BREAK;
     "if",        TOK_IF;
     "else",      TOK_ELSE;
     "goto",      TOK_GOTO;

     (* special statements *)
     "assert",    TOK_ASSERT;
   ]

# 37 "frontend/lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\220\255\002\000\007\000\222\255\078\000\088\000\234\255\
    \235\255\236\255\022\000\008\000\002\000\003\000\030\000\031\000\
    \105\000\032\000\103\000\107\000\033\000\251\255\252\255\253\255\
    \254\255\162\000\228\255\230\255\232\255\229\255\231\255\239\255\
    \143\000\224\255\227\255\226\255\242\255\241\255\240\255\238\255\
    \237\255\237\000\139\000\109\000\111\000\004\001\019\001\159\000\
    \002\000\253\255\254\255\049\000\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\034\000\033\000\255\255\030\000\030\000\255\255\
    \255\255\255\255\255\255\255\255\022\000\012\000\011\000\010\000\
    \009\000\008\000\007\000\006\000\005\000\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \032\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\030\000\030\000\030\000\255\255\
    \002\000\255\255\255\255\001\000\255\255";
  Lexing.lex_default =
   "\255\255\000\000\255\255\255\255\000\000\255\255\255\255\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \032\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\050\000\
    \255\255\000\000\000\000\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\002\000\004\000\002\000\049\000\003\000\000\000\002\000\
    \002\000\004\000\000\000\000\000\002\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\017\000\002\000\000\000\000\000\015\000\011\000\002\000\
    \024\000\023\000\020\000\019\000\007\000\018\000\039\000\016\000\
    \006\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\008\000\009\000\014\000\012\000\013\000\038\000\
    \037\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\036\000\035\000\031\000\026\000\025\000\
    \052\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\022\000\010\000\021\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\040\000\033\000\030\000\000\000\028\000\000\000\
    \032\000\255\255\043\000\000\000\255\255\044\000\044\000\044\000\
    \044\000\000\000\000\000\000\000\029\000\000\000\034\000\042\000\
    \027\000\049\000\000\000\000\000\048\000\005\000\000\000\000\000\
    \041\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \000\000\000\000\043\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\000\000\000\000\000\000\000\000\042\000\
    \000\000\051\000\000\000\000\000\000\000\000\000\044\000\000\000\
    \041\000\000\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\000\000\000\000\000\000\
    \001\000\025\000\000\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\000\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\045\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\046\000\000\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\002\000\048\000\000\000\255\255\002\000\
    \003\000\003\000\255\255\255\255\003\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\002\000\255\255\255\255\000\000\000\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\011\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\000\
    \013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\014\000\015\000\017\000\020\000\000\000\
    \051\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\010\000\016\000\018\000\255\255\019\000\255\255\
    \016\000\032\000\006\000\255\255\032\000\043\000\043\000\044\000\
    \044\000\255\255\255\255\255\255\018\000\255\255\016\000\006\000\
    \019\000\047\000\255\255\255\255\047\000\005\000\255\255\255\255\
    \006\000\255\255\255\255\255\255\255\255\255\255\255\255\006\000\
    \255\255\255\255\006\000\042\000\042\000\042\000\042\000\042\000\
    \042\000\042\000\042\000\255\255\255\255\255\255\255\255\006\000\
    \255\255\047\000\255\255\255\255\255\255\255\255\044\000\255\255\
    \006\000\255\255\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\255\255\255\255\255\255\
    \000\000\025\000\255\255\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\041\000\041\000\
    \041\000\041\000\041\000\041\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\255\255\041\000\041\000\
    \041\000\041\000\041\000\041\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\045\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\046\000\255\255\046\000\046\000\046\000\046\000\
    \046\000\046\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\032\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\047\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 70 "frontend/lexer.mll"
                                                          id
# 221 "frontend/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 71 "frontend/lexer.mll"
( try Hashtbl.find kwd_table id with Not_found -> TOK_id id )
# 225 "frontend/lexer.ml"

  | 1 ->
# 74 "frontend/lexer.mll"
         ( TOK_LPAREN )
# 230 "frontend/lexer.ml"

  | 2 ->
# 75 "frontend/lexer.mll"
         ( TOK_RPAREN )
# 235 "frontend/lexer.ml"

  | 3 ->
# 76 "frontend/lexer.mll"
         ( TOK_LCURLY )
# 240 "frontend/lexer.ml"

  | 4 ->
# 77 "frontend/lexer.mll"
         ( TOK_RCURLY )
# 245 "frontend/lexer.ml"

  | 5 ->
# 78 "frontend/lexer.mll"
         ( TOK_STAR )
# 250 "frontend/lexer.ml"

  | 6 ->
# 79 "frontend/lexer.mll"
         ( TOK_PLUS )
# 255 "frontend/lexer.ml"

  | 7 ->
# 80 "frontend/lexer.mll"
         ( TOK_MINUS )
# 260 "frontend/lexer.ml"

  | 8 ->
# 81 "frontend/lexer.mll"
         ( TOK_EXCLAIM )
# 265 "frontend/lexer.ml"

  | 9 ->
# 82 "frontend/lexer.mll"
         ( TOK_DIVIDE )
# 270 "frontend/lexer.ml"

  | 10 ->
# 83 "frontend/lexer.mll"
         ( TOK_PERCENT )
# 275 "frontend/lexer.ml"

  | 11 ->
# 84 "frontend/lexer.mll"
         ( TOK_LESS )
# 280 "frontend/lexer.ml"

  | 12 ->
# 85 "frontend/lexer.mll"
         ( TOK_GREATER )
# 285 "frontend/lexer.ml"

  | 13 ->
# 86 "frontend/lexer.mll"
         ( TOK_LESS_EQUAL )
# 290 "frontend/lexer.ml"

  | 14 ->
# 87 "frontend/lexer.mll"
         ( TOK_GREATER_EQUAL )
# 295 "frontend/lexer.ml"

  | 15 ->
# 88 "frontend/lexer.mll"
         ( TOK_EQUAL_EQUAL )
# 300 "frontend/lexer.ml"

  | 16 ->
# 89 "frontend/lexer.mll"
         ( TOK_NOT_EQUAL )
# 305 "frontend/lexer.ml"

  | 17 ->
# 90 "frontend/lexer.mll"
         ( TOK_AND_AND )
# 310 "frontend/lexer.ml"

  | 18 ->
# 91 "frontend/lexer.mll"
         ( TOK_BAR_BAR )
# 315 "frontend/lexer.ml"

  | 19 ->
# 92 "frontend/lexer.mll"
         ( TOK_SEMICOLON )
# 320 "frontend/lexer.ml"

  | 20 ->
# 93 "frontend/lexer.mll"
         ( TOK_COLON )
# 325 "frontend/lexer.ml"

  | 21 ->
# 94 "frontend/lexer.mll"
         ( TOK_COMMA )
# 330 "frontend/lexer.ml"

  | 22 ->
# 95 "frontend/lexer.mll"
         ( TOK_EQUAL )
# 335 "frontend/lexer.ml"

  | 23 ->
# 96 "frontend/lexer.mll"
         ( TOK_PLUS_PLUS )
# 340 "frontend/lexer.ml"

  | 24 ->
# 97 "frontend/lexer.mll"
         ( TOK_MINUS_MINUS )
# 345 "frontend/lexer.ml"

  | 25 ->
# 98 "frontend/lexer.mll"
         ( TOK_PLUS_EQUAL )
# 350 "frontend/lexer.ml"

  | 26 ->
# 99 "frontend/lexer.mll"
         ( TOK_MINUS_EQUAL )
# 355 "frontend/lexer.ml"

  | 27 ->
# 100 "frontend/lexer.mll"
         ( TOK_STAR_EQUAL )
# 360 "frontend/lexer.ml"

  | 28 ->
# 101 "frontend/lexer.mll"
         ( TOK_DIVIDE_EQUAL )
# 365 "frontend/lexer.ml"

  | 29 ->
# 102 "frontend/lexer.mll"
         ( TOK_PERCENT_EQUAL )
# 370 "frontend/lexer.ml"

  | 30 ->
let
# 106 "frontend/lexer.mll"
                  c
# 376 "frontend/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 106 "frontend/lexer.mll"
                    ( TOK_int c )
# 380 "frontend/lexer.ml"

  | 31 ->
# 109 "frontend/lexer.mll"
       ( comment lexbuf; token lexbuf )
# 385 "frontend/lexer.ml"

  | 32 ->
# 110 "frontend/lexer.mll"
                      ( token lexbuf )
# 390 "frontend/lexer.ml"

  | 33 ->
# 111 "frontend/lexer.mll"
          ( new_line lexbuf; token lexbuf )
# 395 "frontend/lexer.ml"

  | 34 ->
# 112 "frontend/lexer.mll"
        ( token lexbuf )
# 400 "frontend/lexer.ml"

  | 35 ->
# 115 "frontend/lexer.mll"
      ( TOK_EOF )
# 405 "frontend/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 47
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 120 "frontend/lexer.mll"
       ( () )
# 417 "frontend/lexer.ml"

  | 1 ->
# 121 "frontend/lexer.mll"
                ( comment lexbuf )
# 422 "frontend/lexer.ml"

  | 2 ->
# 122 "frontend/lexer.mll"
          ( new_line lexbuf; comment lexbuf )
# 427 "frontend/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

;;

