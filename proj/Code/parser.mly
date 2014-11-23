%{

open Lang ;;

let parse_error p = (* Called by the parser function on error *)
  print_endline p;
  flush stdout
;;

%}

%token <string> IDENTIFIER
%token <int> INTCONSTANT
%token <string> STRINGCONSTANT
%token <string> CHARCONSTANT
%token LPAREN RPAREN
%token LSQBRACE RSQBRACE
%token LRULEPAR RRULEPAR
%token DOT COMMA SEMICOLON COLON HASH
%token TURNSTILE
%token TRUE FALSE PROOF RULE RULE_FILES
%token EQUIV IMPL OR AND NOT
%token EOF
%right EQUIV
%right IMPL
%right OR
%right AND
%nonassoc NOT 

%start start
%type <Lang.rule_or_proof_file> start

%%

start: 
  proof_file 
  { $1 }
| rule_file 
  { $1 }
;

proof_file:
  rule_refs proof EOF
  {ProofFile($1, $2)}
;

rule_file:
  ruleList EOF
  {RuleFile($1)}
;

rule_refs: RULE_FILES idListCommaSep SEMICOLON
{RuleRefs ($2)}
;


proof: PROOF COLON derivation
{Proof ($3)}
;


/* Diverse lists of (with separators) */

idListCommaSep:
  IDENTIFIER
{[$1]}
| IDENTIFIER COMMA idListCommaSep
{$1::$3}
;

formListCommaSep:
  form
{[$1]}
;

derivationListSemicolonSep:
  derivation
{[$1]}
;

sequentListSemicolonSep:
  sequent
{[$1]}
;

ruleList:
  rule
{[$1]}
;

rule_info: LRULEPAR IDENTIFIER RRULEPAR
{RlInfo ($2)}
;

deriv_info: LRULEPAR IDENTIFIER RRULEPAR
{DerivInfo ($2)}
;

rule: 
  RULE COLON LSQBRACE sequentListSemicolonSep RSQBRACE rule_info sequent
  {Rl($4, $6, $7)}
| RULE COLON LSQBRACE RSQBRACE rule_info sequent
  {Rl([], $5, $6)}
;

derivation: 
  LSQBRACE derivationListSemicolonSep RSQBRACE deriv_info sequent
  {Deriv($2, $4, $5)}
| LSQBRACE RSQBRACE deriv_info sequent
  {Deriv([], $3, $4)}
| sequent
  {Deriv([], DerivInfo "axiom", $1)}
;

sequent: 
   formListCommaSep TURNSTILE form
   {Seq(List.rev $1, $3)}
| TURNSTILE form
   {Seq([], $2)}
;

form:
  TRUE
    { Const(true) }
| FALSE
    { Const(false) }
| IDENTIFIER
  { Var($1) }
| NOT form
  { Unop(Neg, $2) }
| form AND form
  { Binop(Conj, $1, $3) }
| form OR form
  { Binop(Disj, $1, $3) }
| form EQUIV form
  { Binop(Equiv, $1, $3) }
| form IMPL form
  { Binop(Impl, $1, $3) }
| LPAREN form RPAREN
    { $2 }
;
