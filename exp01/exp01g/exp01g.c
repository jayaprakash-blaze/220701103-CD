#include <stdio.h> 
void replaceChar(char str[], char oldChar, char newChar) { 
    for (int i = 0; str[i] != '\0'; i++) { 
        if (str[i] == oldChar) { 
            str[i] = newChar; 
        } 
    } 
} 
int main() { 
    char str[100], oldChar, newChar; 
    printf("Enter a string: "); 
    fgets(str, sizeof(str), stdin); 
    printf("Enter character to replace: "); 
    scanf("%c", &oldChar);     
    getchar(); // Consume leftover newline character 
    printf("Enter new character: "); 
    scanf("%c", &newChar); 
    replaceChar(str, oldChar, newChar); 
    printf("Modified string: %s\n", str); 
    return 0; 
} 