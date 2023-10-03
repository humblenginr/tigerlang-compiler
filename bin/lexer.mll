{ 
open Tiger_lang.Token
}
rule token = parse
    (* Whitespaces, tabs and newlines *)
       [' ' '\t' '\n'] {token lexbuf}
    |  eof {Eof}
    (* Keywoards *)
    |  "function" {Function}
    |  "let" {Let}
    |  "in" {In}
    |  "if" {If}
    |  "then" {Then}
    |  "else" {Else}
    |  "var" {Var}
    |  "of" {Of}
    |  "to" {To}
    |  "do" {Do}
    |  "end" {End}
    |  "type" {Type}
    |  "array" {Array}
    (* Operators*)
    |  '&'  {And}
    |  '|'  {Or}
    |  ":=" {Assign}
    |  '=' {Eq}
    |  "!=" {Neq}
    |  '+' {Plus}
    |  '-' {Minus}
    |  '/' {Divide}
    |  '*' {Times}
    |  '<' {Lt}
    |  "<=" {Le}
    |  '>' {Gt}
    |  ">=" {Ge}
    (* *)
    |  '{' {LBrace}
    |  '}' {RBrace}
    |  '(' {LParen}
    |  ')' {RParen}
    |  '[' {LBrack}
    |  ']' {RBrack}
    |  ';' {Semicolon}
    |  '.' {Dot}
    (* Base Constructs *)
    |  ['0' - '9']+ as lxm {Int(int_of_string lxm)}
    |  ['a'-'z' 'A'-'Z']+(['a'-'z' 'A'-'Z'] | ['0'-'9'] | '_')* as lxm {Id(lxm)}
    |  "\".*\"" as lxm {String(lxm)}
