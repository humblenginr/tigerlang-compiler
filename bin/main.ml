open Tiger_lang.Token


let get_token_list lexbuf = 
  let rec helper acc = match (Lexer.token lexbuf) with 
        | Eof -> acc
        | t -> helper (t :: acc)
  in List.rev (helper []) 

let rec print_list_items lst = match lst with
    | [] -> ()
    | x :: xs -> print_endline (to_string x); print_list_items (xs)

  
let token_list = 
  let file = open_in "test.tg" in
  let lexbuf = Lexing.from_channel file in
    get_token_list lexbuf 

let () = print_list_items token_list



