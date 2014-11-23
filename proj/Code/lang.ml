(* -------------------- Data types ------------------------------ *)

type unop = Neg
type binop = Conj | Disj | Impl | Equiv

type form = 
  Const of bool
| Var of string
| Unop of unop * form
| Binop of binop * form * form

type sequent = Seq of form list * form

type deriv_info = DerivInfo of string

type derivation = 
  Deriv of derivation list * deriv_info * sequent

type rule_info = RlInfo of string

type rule = Rl of sequent list * rule_info * sequent

type rule_defs = 
  RuleRefs of string list
| Rules of rule list

type proof = Proof of derivation

type rule_or_proof_file = 
  RuleFile of rule list
| ProofFile of rule_defs * proof

(* -------------------- Functions ------------------------------ *)
