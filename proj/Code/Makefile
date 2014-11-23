all: checker

checker: lang.cmo parser.cmo lexer.cmo checker.cmo
	ocamlc -o checker $^


# Compilation of .ml files
lang.cmo: lang.ml 
	ocamlc -c $<

checker.cmo: checker.ml lang.cmo parser.cmo
	ocamlc -c $<

##### ocamlyacc parser

# ocaml lexer and parser
lexer.ml: lexer.mll lang.cmo
	ocamllex $<

parser.ml parser.mli: parser.mly lang.cmo
	ocamlyacc -v $<

lexer.cmo: lexer.ml parser.cmo
	ocamlc -c $<
parser.cmo: parser.ml parser.cmi lang.cmo
	ocamlc -c $<

#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean: 
	rm lexer.ml parser.ml *.mli *.cmi *.cmo *.o
