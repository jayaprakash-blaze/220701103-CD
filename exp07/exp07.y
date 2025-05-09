%{ 
#include <stdio.h> 
#include <stdlib.h> 
void yyerror(const char *s); 
int yylex(void); 
%} 
%token IF ELSE FOR WHILE SWITCH CASE IDENTIFIER REL_OP ARITH_OP 
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON 
%start program 
%% 
program: 
    statement 
  | program statement 
  ; 
statement: 
    if_statement 
  | for_loop 
  | while_loop 
  | switch_case 
  ; 
 
if_statement: 
    IF LPAREN condition RPAREN LBRACE statements RBRACE 
  | IF LPAREN condition RPAREN LBRACE statements RBRACE ELSE LBRACE 
statements RBRACE 
  ; 
for_loop: 
    FOR LPAREN assignment SEMICOLON condition SEMICOLON assignment RPAREN 
LBRACE statements RBRACE 
  ; 
while_loop: 
    WHILE LPAREN condition RPAREN LBRACE statements RBRACE 
  ; 
 
switch_case: 
    SWITCH LPAREN expression RPAREN LBRACE case_statements RBRACE 
  ; 
case_statements: 
    CASE expression COLON statements 
  | case_statements CASE expression COLON statements 
  | case_statements DEFAULT COLON statements 
  ; 
condition: 
    IDENTIFIER REL_OP IDENTIFIER 
  | IDENTIFIER REL_OP NUMBER 
  | NUMBER REL_OP IDENTIFIER 
  | NUMBER REL_OP NUMBER 
  ; 
assignment: 
    IDENTIFIER '=' expression 
  ; 
expression: 
    IDENTIFIER 
  | NUMBER 
  | expression ARITH_OP expression 
  ; 
statements: 
    statement 
  | statements statement 
  ; 
%% 
void yyerror(const char *s) { 
    fprintf(stderr, "Error: %s\n", s); 
} 
 
int main() { 
    printf("Enter C control structures for validation:\n"); 
    yyparse(); 
    return 0; 
}