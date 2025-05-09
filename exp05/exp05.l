%{ 
#include "y.tab.h" 
%} 
%option noyywrap 
%% 
// Pattern for valid variable names 
[a-zA-Z][a-zA-Z0-9]*    { return IDENTIFIER; } 
// Ignore whitespace 
[ \t\n]                 { /* Skip */ } 
 
.                       { return yytext[0]; } 
%%