#include <stdio.h>

void prompt_and_read(void);
int in_char(char *prompt);
char *in_string(char *prompt);

int main()
{
    int character;
    char *string;
    int value;

    character = in_char("C prompt for character: ");
    printf("Character retrieved in C: %c\n",(char)character);

    string = in_string("C prompt for string: ");
    printf("String retrieved in C: %s\n",string);

    prompt_and_read();

    value = in_integer("C prompt for integer: ");
    printf("Ineger value returned in C: %d\n",value);
} 
