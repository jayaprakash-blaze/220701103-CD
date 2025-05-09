%{ 
#include "y.tab.h" 
%} 
 
%% 
[0-9]+      { yylval.str = strdup(yytext); return NUMBER; } 
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; } 
[+\-*/=()]  { return yytext[0]; } 
[ \t\n]     { /* Ignore whitespace */ } 
.           { printf("Unexpected character: %s\n", yytext); } 
%%