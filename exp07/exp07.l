%{ 
#include "y.tab.h" 
%} 
%% 
"if"        { return IF; } 
"else"      { return ELSE; } 
"for"       { return FOR; } 
"while"     { return WHILE; } 
"switch"    { return SWITCH; } 
"case"      { return CASE; } 
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; } 
"=="|"!="|"<="|">="|"<"|">" { return REL_OP; } 
"+"|"-"|"*"|"/" { return ARITH_OP; } 
"("         { return LPAREN; } 
")"         { return RPAREN; } 
"{"         { return LBRACE; } 
"}"         { return RBRACE; } 
";"         { return SEMICOLON; } 
[ \t\n]     ; /* Ignore whitespace */ 
.           { printf("Invalid character: %s\n", yytext); } 
%% 
int yywrap() { 
    return 1; 
}