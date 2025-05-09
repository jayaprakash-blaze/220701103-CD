#include <stdio.h> 
#include <string.h> 
void generateAssembly(const char* tac) { 
    char result[10], op1[10], op[2], op2[10]; 
    // Parse the TAC instruction 
    sscanf(tac, "%s = %s %s %s", result, op1, op, op2); 
    // Generate assembly code based on the operator 
    if (strcmp(op, "+") == 0) { 
        printf("MOV AX, [%s]\n", op1); 
        printf("ADD AX, [%s]\n", op2); 
        printf("MOV [%s], AX\n", result); 
    } else if (strcmp(op, "-") == 0) { 
        printf("MOV AX, [%s]\n", op1); 
        printf("SUB AX, [%s]\n", op2); 
        printf("MOV [%s], AX\n", result); 
    } else if (strcmp(op, "*") == 0) { 
        printf("MOV AX, [%s]\n", op1); 
        printf("MOV BX, [%s]\n", op2); 
        printf("MUL BX\n"); 
        printf("MOV [%s], AX\n", result); 
    } else if (strcmp(op, "/") == 0) { 
        printf("MOV AX, [%s]\n", op1); 
        printf("MOV BX, [%s]\n", op2); 
        printf("DIV BX\n"); 
        printf("MOV [%s], AX\n", result); 
    } else { 
        printf("Unsupported operation: %s\n", op); 
    } 
} 
int main() { 
    const char* tacInstructions[] = { 
        "t0 = b + c", 
        "t1 = t0 * d", 
        "a = t1" 
    }; 
    int numInstructions = sizeof(tacInstructions) / sizeof(tacInstructions[0]); 
    for (int i = 0; i < numInstructions; i++) { 
        generateAssembly(tacInstructions[i]); 
        printf("\n"); 
    } 
    return 0; 
}