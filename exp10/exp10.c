#include <stdio.h> 
#include <string.h> 
// Function to generate TAC for arithmetic expressions 
void generateArithmeticTAC(const char* expr) { 
    // Example: a = b + c * d 
    // Expected TAC: 
    // t1 = c * d 
    // t2 = b + t1 
    // a = t2 
 
    char result[10], op1[10], op[2], op2[10]; 
    sscanf(expr, "%s = %s %s %s", result, op1, op, op2); 
 
    if (strcmp(op, "+") == 0 || strcmp(op, "-") == 0) { 
        printf("t1 = %s %s %s\n", op1, op, op2); 
        printf("%s = t1\n", result); 
    } else if (strcmp(op, "*") == 0 || strcmp(op, "/") == 0) { 
        printf("t1 = %s %s %s\n", op1, op, op2); 
        printf("%s = t1\n", result); 
    } else { 
        printf("Unsupported operation: %s\n", op); 
    } 

} 
 
// Function to generate TAC for if-else statements 
void generateIfElseTAC(const char* condition, const char* trueStmt, const char* falseStmt) 
{ 
    // Example: 
    // if (a < b) x = 1; else x = 2; 
    // Expected TAC: 
    // if a < b goto L1 
    // goto L2 
    // L1: x = 1 
    // goto L3 
    // L2: x = 2 
    // L3: 
 
    printf("if %s goto L1\n", condition); 
    printf("goto L2\n"); 
    printf("L1: %s\n", trueStmt); 
    printf("goto L3\n"); 
    printf("L2: %s\n", falseStmt); 
    printf("L3:\n"); 
} 
 
// Function to generate TAC for while loops 
void generateWhileLoopTAC(const char* condition, const char* body) { 
    // Example: 
    // while (a < b) { x = x + 1; } 
    // Expected TAC: 
    // L1: if a >= b goto L2 
    // x = x + 1 
    // goto L1 
    // L2: 
 
    printf("L1: if %s goto L2\n", condition); 
    printf("%s\n", body); 
    printf("goto L1\n"); 
    printf("L2:\n"); 
} 
 
int main() { 
    // Example usage: 
    printf("TAC for arithmetic expression:\n"); 
    generateArithmeticTAC("a = b + c"); 
 
    printf("\nTAC for if-else statement:\n"); 
    generateIfElseTAC("a < b", "x = 1", "x = 2"); 
 
    printf("\nTAC for while loop:\n"); 
    generateWhileLoopTAC("a >= b", "x = x + 1"); 
 
 
    return 0; 
}