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

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Lang.rule_or_proof_file
