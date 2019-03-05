#include <stdio.h>

struct st_struct {
    char charfirst;
    int intvalue;
    char charsecond;
    short shortvalue;
};

struct st_struct *a1(void);

int main()
{
    struct st_struct *st;

    st = a1();

    printf("size of struct=%d\n",sizeof(struct st_struct));
    printf("charfirst=%c\n",st->charfirst);
    printf("intvalue=%d\n",st->intvalue);
    printf("charsecond=%c\n",st->charsecond);
    printf("shortvalue=%d\n",st->shortvalue);
} 
