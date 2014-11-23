type token =
  | IDENTIFIER of (string)
  | INTCONSTANT of (int)
  | STRINGCONSTANT of (string)
  | CHARCONSTANT of (string)
  | LPAREN
  | RPAREN
  | LSQBRACE
  | RSQBRACE
  | LRULEPAR
  | RRULEPAR
  | DOT
  | COMMA
  | SEMICOLON
  | COLON
  | HASH
  | TURNSTILE
  | TRUE
  | FALSE
  | PROOF
  | RULE
  | RULE_FILES
  | EQUIV
  | IMPL
  | OR
  | AND
  | NOT
  | EOF

open Parsing;;
# 2 "parser.mly"

open Lang ;;

let parse_error p = (* Called by the parser function on error *)
  print_endline p;
  flush stdout
;;

# 41 "parser.ml"
let yytransl_const = [|
  261 (* LPAREN *);
  262 (* RPAREN *);
  263 (* LSQBRACE *);
  264 (* RSQBRACE *);
  265 (* LRULEPAR *);
  266 (* RRULEPAR *);
  267 (* DOT *);
  268 (* COMMA *);
  269 (* SEMICOLON *);
  270 (* COLON *);
  271 (* HASH *);
  272 (* TURNSTILE *);
  273 (* TRUE *);
  274 (* FALSE *);
  275 (* PROOF *);
  276 (* RULE *);
  277 (* RULE_FILES *);
  278 (* EQUIV *);
  279 (* IMPL *);
  280 (* OR *);
  281 (* AND *);
  282 (* NOT *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* IDENTIFIER *);
  258 (* INTCONSTANT *);
  259 (* STRINGCONSTANT *);
  260 (* CHARCONSTANT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\004\000\005\000\007\000\007\000\
\009\000\011\000\012\000\006\000\015\000\016\000\014\000\014\000\
\008\000\008\000\008\000\013\000\013\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\000\000"

let yylen = "\002\000\
\001\000\001\000\003\000\002\000\003\000\003\000\001\000\003\000\
\001\000\001\000\001\000\001\000\003\000\003\000\007\000\006\000\
\005\000\004\000\001\000\003\000\002\000\001\000\001\000\001\000\
\002\000\003\000\003\000\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\031\000\001\000\002\000\000\000\
\000\000\012\000\000\000\000\000\000\000\000\000\000\000\004\000\
\000\000\000\000\005\000\000\000\003\000\024\000\000\000\000\000\
\000\000\022\000\023\000\000\000\000\000\000\000\000\000\011\000\
\008\000\000\000\006\000\019\000\000\000\000\000\000\000\000\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\010\000\000\000\030\000\000\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\013\000\015\000\
\000\000\018\000\000\000\014\000\017\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000\015\000\009\000\013\000\035\000\
\029\000\030\000\050\000\031\000\036\000\010\000\039\000\061\000"

let yysindex = "\255\255\
\013\255\000\000\253\254\014\255\000\000\000\000\000\000\002\255\
\023\000\000\000\030\255\026\255\029\255\037\255\043\000\000\000\
\031\255\014\255\000\000\049\255\000\000\000\000\059\255\036\255\
\059\255\000\000\000\000\059\255\042\255\240\254\045\255\000\000\
\000\000\009\255\000\000\000\000\006\255\060\255\054\255\240\254\
\000\000\059\255\059\255\059\255\059\255\059\255\036\255\053\255\
\000\000\055\255\000\000\058\255\000\000\240\254\240\254\251\254\
\016\255\044\255\054\255\072\255\054\255\053\255\000\000\000\000\
\064\255\000\000\054\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\065\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\066\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\005\000\022\000\013\000\
\004\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\065\000\052\000\
\000\000\056\000\000\000\000\000\241\255\000\000\040\000\026\000"

let yytablesize = 294
let yytable = "\001\000\
\026\000\032\000\021\000\027\000\020\000\043\000\044\000\045\000\
\046\000\022\000\011\000\051\000\029\000\023\000\012\000\034\000\
\048\000\044\000\045\000\046\000\014\000\028\000\016\000\053\000\
\025\000\026\000\027\000\043\000\044\000\045\000\046\000\022\000\
\003\000\004\000\028\000\023\000\017\000\018\000\024\000\045\000\
\046\000\019\000\021\000\064\000\038\000\066\000\025\000\026\000\
\027\000\022\000\020\000\069\000\047\000\023\000\022\000\034\000\
\028\000\042\000\023\000\022\000\052\000\060\000\062\000\023\000\
\025\000\026\000\027\000\063\000\046\000\025\000\026\000\027\000\
\065\000\068\000\028\000\026\000\027\000\007\000\037\000\028\000\
\040\000\009\000\033\000\041\000\028\000\049\000\059\000\067\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\054\000\055\000\056\000\057\000\058\000\000\000\000\000\
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
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\026\000\000\000\
\026\000\027\000\021\000\027\000\020\000\000\000\000\000\000\000\
\026\000\000\000\029\000\027\000\029\000\000\000\026\000\026\000\
\026\000\027\000\027\000\028\000\029\000\028\000\000\000\000\000\
\000\000\000\000\029\000\000\000\000\000\028\000"

let yycheck = "\001\000\
\000\000\017\000\000\000\000\000\000\000\022\001\023\001\024\001\
\025\001\001\001\014\001\006\001\000\000\005\001\001\001\007\001\
\008\001\023\001\024\001\025\001\019\001\000\000\000\000\039\000\
\016\001\017\001\018\001\022\001\023\001\024\001\025\001\001\001\
\020\001\021\001\026\001\005\001\007\001\012\001\008\001\024\001\
\025\001\013\001\000\000\059\000\009\001\061\000\016\001\017\001\
\018\001\001\001\014\001\067\000\008\001\005\001\001\001\007\001\
\026\001\016\001\005\001\001\001\001\001\009\001\008\001\005\001\
\016\001\017\001\018\001\010\001\025\001\016\001\017\001\018\001\
\001\001\010\001\026\001\017\001\018\001\013\001\023\000\026\001\
\025\000\016\001\018\000\028\000\026\001\034\000\047\000\062\000\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\042\000\043\000\044\000\045\000\046\000\255\255\255\255\
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
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\006\001\255\255\
\008\001\006\001\008\001\008\001\008\001\255\255\255\255\255\255\
\016\001\255\255\006\001\016\001\008\001\255\255\022\001\023\001\
\024\001\022\001\023\001\006\001\016\001\008\001\255\255\255\255\
\255\255\255\255\022\001\255\255\255\255\016\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LSQBRACE\000\
  RSQBRACE\000\
  LRULEPAR\000\
  RRULEPAR\000\
  DOT\000\
  COMMA\000\
  SEMICOLON\000\
  COLON\000\
  HASH\000\
  TURNSTILE\000\
  TRUE\000\
  FALSE\000\
  PROOF\000\
  RULE\000\
  RULE_FILES\000\
  EQUIV\000\
  IMPL\000\
  OR\000\
  AND\000\
  NOT\000\
  EOF\000\
  "

let yynames_block = "\
  IDENTIFIER\000\
  INTCONSTANT\000\
  STRINGCONSTANT\000\
  CHARCONSTANT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proof_file) in
    Obj.repr(
# 37 "parser.mly"
  ( _1 )
# 247 "parser.ml"
               : Lang.rule_or_proof_file))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'rule_file) in
    Obj.repr(
# 39 "parser.mly"
  ( _1 )
# 254 "parser.ml"
               : Lang.rule_or_proof_file))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'rule_refs) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'proof) in
    Obj.repr(
# 44 "parser.mly"
  (ProofFile(_1, _2))
# 262 "parser.ml"
               : 'proof_file))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'ruleList) in
    Obj.repr(
# 49 "parser.mly"
  (RuleFile(_1))
# 269 "parser.ml"
               : 'rule_file))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'idListCommaSep) in
    Obj.repr(
# 53 "parser.mly"
(RuleRefs (_2))
# 276 "parser.ml"
               : 'rule_refs))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'derivation) in
    Obj.repr(
# 58 "parser.mly"
(Proof (_3))
# 283 "parser.ml"
               : 'proof))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
([_1])
# 290 "parser.ml"
               : 'idListCommaSep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'idListCommaSep) in
    Obj.repr(
# 68 "parser.mly"
(_1::_3)
# 298 "parser.ml"
               : 'idListCommaSep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 73 "parser.mly"
([_1])
# 305 "parser.ml"
               : 'formListCommaSep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'derivation) in
    Obj.repr(
# 78 "parser.mly"
([_1])
# 312 "parser.ml"
               : 'derivationListSemicolonSep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 83 "parser.mly"
([_1])
# 319 "parser.ml"
               : 'sequentListSemicolonSep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'rule) in
    Obj.repr(
# 88 "parser.mly"
([_1])
# 326 "parser.ml"
               : 'ruleList))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 92 "parser.mly"
(RlInfo (_2))
# 333 "parser.ml"
               : 'rule_info))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 96 "parser.mly"
(DerivInfo (_2))
# 340 "parser.ml"
               : 'deriv_info))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'sequentListSemicolonSep) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'rule_info) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 101 "parser.mly"
  (Rl(_4, _6, _7))
# 349 "parser.ml"
               : 'rule))
; (fun __caml_parser_env ->
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'rule_info) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 103 "parser.mly"
  (Rl([], _5, _6))
# 357 "parser.ml"
               : 'rule))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'derivationListSemicolonSep) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'deriv_info) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 108 "parser.mly"
  (Deriv(_2, _4, _5))
# 366 "parser.ml"
               : 'derivation))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'deriv_info) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 110 "parser.mly"
  (Deriv([], _3, _4))
# 374 "parser.ml"
               : 'derivation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'sequent) in
    Obj.repr(
# 112 "parser.mly"
  (Deriv([], DerivInfo "axiom", _1))
# 381 "parser.ml"
               : 'derivation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formListCommaSep) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 117 "parser.mly"
   (Seq(List.rev _1, _3))
# 389 "parser.ml"
               : 'sequent))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 119 "parser.mly"
   (Seq([], _2))
# 396 "parser.ml"
               : 'sequent))
; (fun __caml_parser_env ->
    Obj.repr(
# 124 "parser.mly"
    ( Const(true) )
# 402 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    Obj.repr(
# 126 "parser.mly"
    ( Const(false) )
# 408 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 128 "parser.mly"
  ( Var(_1) )
# 415 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 130 "parser.mly"
  ( Unop(Neg, _2) )
# 422 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'form) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 132 "parser.mly"
  ( Binop(Conj, _1, _3) )
# 430 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'form) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 134 "parser.mly"
  ( Binop(Disj, _1, _3) )
# 438 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'form) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 136 "parser.mly"
  ( Binop(Equiv, _1, _3) )
# 446 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'form) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'form) in
    Obj.repr(
# 138 "parser.mly"
  ( Binop(Impl, _1, _3) )
# 454 "parser.ml"
               : 'form))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'form) in
    Obj.repr(
# 140 "parser.mly"
    ( _2 )
# 461 "parser.ml"
               : 'form))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Lang.rule_or_proof_file)
