%{ 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
int temp_count = 0; 
 
 
char* new_temp() { 
    char* temp = (char*)malloc(8); 
    sprintf(temp, "t%d", temp_count++); 
    return temp; 
} 
 
void emit(char* result, char* op1, char op, char* op2) { 
    printf("%s = %s %c %s\n", result, op1, op, op2); 
} 
 
void emit_assign(char* id, char* expr) { 
    printf("%s = %s\n", id, expr); 
} 
%} 
 
%union { 
    char* str; 
} 
 
%token <str> ID NUMBER 
%type <str> expr term factor 
 
%left '+' '-' 
%left '*' '/' 
 
%% 
statement   : ID '=' expr { emit_assign($1, $3); } 
            ; 
 
expr        : expr '+' term { $$ = new_temp(); emit($$, $1, '+', $3); } 
            | expr '-' term { $$ = new_temp(); emit($$, $1, '-', $3); } 
            | term          { $$ = $1; } 
            ; 
 
term        : term '*' factor { $$ = new_temp(); emit($$, $1, '*', $3); } 
            | term '/' factor { $$ = new_temp(); emit($$, $1, '/', $3); } 
            | factor          { $$ = $1; } 
            ; 
 
factor      : '(' expr ')' { $$ = $2; } 
            | NUMBER       { $$ = $1; } 
            | ID           { $$ = $1; } 
            ; 
%% 
 
int main() { 
    yyparse(); 
    return 0; 
} 
 
 
void yyerror(const char* s) { 
    fprintf(stderr, "Error: %s\n", s); 
}