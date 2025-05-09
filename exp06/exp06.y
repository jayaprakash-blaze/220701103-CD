%{ 
#include <stdio.h> 
#include <stdlib.h> 
int yylex(); 
void yyerror(const char *s); 
%} 
%token NUMBER 
%left '+' /* Lower precedence */ 
%left '*' /* Higher precedence */ 
%% 
expression: 
    expression '+' expression   { $$ = $1 + $3; } 
  | expression '*' expression   { $$ = $1 * $3; } 
  | NUMBER                      { $$ = $1; } 
  ; 
%% 
int main() { 
    printf("Enter an arithmetic expression:\n"); 
    yyparse(); 
    return 0; 
} 
void yyerror(const char *s) { 
    fprintf(stderr, "Error: %s\n", s); 
} 