%{ 
#include <stdio.h> 
int isValid = 1; // Flag to track if the expression is valid 
%} 
%option noyywrap 
%% 
// Numbers (integer and floating-point) 
[0-9]+(\.[0-9]+)? { 
    printf("Number: %s\n", yytext); 
} 
 
// Operators 
"+"|"-"|"*"|"/" { 
    printf("Operator: %s\n", yytext); 
} 
 
// Parentheses 
"(" { printf("Left Parenthesis: %s\n", yytext); } 
")" { printf("Right Parenthesis: %s\n", yytext); } 
29 
 
 
// Ignore spaces and tabs 
[ \t]+ ; 
// Invalid tokens 
. { 
    printf("Error: Invalid token '%s'\n", yytext); 
    isValid = 0; 
} 
%% 
int main() { 
    printf("Enter an arithmetic expression:\n"); 
    yylex(); 
    if (isValid) 
        printf("Valid arithmetic expression.\n"); 
    else 
        printf("Invalid arithmetic expression.\n"); 
 
    return 0; 
}