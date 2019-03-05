#include <stdio.h>

struct st_struct {
    int intvalue;
    short shortvalue;
    char charfirst;
    char charsecond;
};

struct st_struct *a1(void);

int main()
{
    struct st_struct *st;

    st = a1();

    printf("size of struct=%d\n",sizeof(struct st_struct));
    printf("intvalue=%d\n",st->intvalue);
    printf("shortvalue=%d\n",st->shortvalue);
    printf("charfirst=%c\n",st->charfirst);
    printf("charsecond=%c\n",st->charsecond);
} 
