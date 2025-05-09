%{ 
#include <stdio.h> 
%} 
%option noyywrap 
%% 
// Keywords 
"int"|"float"|"char"|"double"|"if"|"else"|"return"|"for"|"while"|"do" { 
    printf("Keyword: %s\n", yytext); 
} 
// Identifiers (starting with a letter or underscore, followed by letters, digits, or underscores) 
[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Identifier: %s\n", yytext); 
} 
// Constants (integer and floating-point numbers) 
[0-9]+(\.[0-9]+)? { 
    printf("Constant: %s\n", yytext); 
} 
// Operators 
"+"|"-"|"*"|"/"|"="|"=="|"!="|"<"|">"|"&&"|"||"|"++"|"--" { 
    printf("Operator: %s\n", yytext); 
26 
 
} 
// Single-line comments 
"//".* { 
    printf("Comment: %s\n", yytext); 
} 
// Multi-line comments 
"/*"([^*]|\*+[^*/])*\*+"/" { 
    printf("Multi-line Comment: %s\n", yytext); 
} 
// Special symbols 
";"|","|"("|")"|"{"|"}"|"["|"]" { 
    printf("Special Symbol: %s\n", yytext); 
} 
// Ignore whitespaces and newlines 
[ \t\n] ; 
 
%% 
int main() { 
    printf("Enter a C code snippet:\n"); 
    yylex(); 
    return 0; 
}