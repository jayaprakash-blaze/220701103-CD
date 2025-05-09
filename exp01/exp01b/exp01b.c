#include <stdio.h> 
#include <string.h> 
int findSubstring(char str[], char sub[]) { 
    int strLen = strlen(str), subLen = strlen(sub);   
    for (int i = 0; i <= strLen - subLen; i++) { 
        int j; 
        for (j = 0; j < subLen; j++) { 
            if (str[i + j] != sub[j]) { 
                break; 
            } 
        } 
        if (j == subLen) { 
            return i;  // Found at index i 
        } 
    } 
    return -1;  // Not found 
} 
int main() { 
    char str[100], sub[50]; 
    printf("Enter a string: "); 
    fgets(str, sizeof(str), stdin); 
    printf("Enter the substring: "); 
    fgets(sub, sizeof(sub), stdin); 
    str[strcspn(str, "\n")] = '\0'; 
    sub[strcspn(sub, "\n")] = '\0'; 
    int index = findSubstring(str, sub); 
    if (index != -1) 
        printf("Substring found at index %d\n", index); 
    else 
        printf("Substring not found\n"); 
 
9 
 
    return 0; 
}