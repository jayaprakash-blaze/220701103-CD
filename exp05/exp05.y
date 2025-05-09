%{ 
#include <stdio.h> 
void yyerror(const char *msg); 
%} 
%token IDENTIFIER 
%% 
stmt: IDENTIFIER { printf("Valid variable: %s\n", yytext); } 
    ; 
%% 
void yyerror(const char *msg) { 
    printf("Invalid variable\n"); 
} 
 
35 
 
int main() { 
    printf("Enter a variable name: "); 
    yyparse(); 
    return 0; 
} 