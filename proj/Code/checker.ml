open Lang ;;

exception ParseLexError of exn * (string * int * int * string * string)

let parse infile = 
  let lexbuf = Lexing.from_channel (open_in infile) in
  try 
    Parser.start Lexer.token lexbuf
  with exn ->
    begin
      let curr = lexbuf.Lexing.lex_curr_p in
      let line = curr.Lexing.pos_lnum in
      let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
      let tok = Lexing.lexeme lexbuf in
      let tail = Lexer.ruleTail "" lexbuf in
      raise (ParseLexError (exn,(infile, line,cnum,tok,tail)))
    end
;;


let main () = 
  try
    let infile = Sys.argv.(1) in 
    parse infile; 0
  with ParseLexError (exn,(filename, line,cnum,tok,tail)) ->
    (print_string ("Parsing error in file: " ^ filename ^ 
                      " on line: " ^ (string_of_int line) ^ 
                      " column: " ^ (string_of_int cnum) ^
                      " token: "  ^ tok ^
                      "\nrest: "  ^ tail ^ "\n")
    ;
     1)
;;

main();;

