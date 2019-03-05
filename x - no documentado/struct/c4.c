#include <stdio.h>

struct st_struct {
    int intvalue;
    short shortvalue;
    char charfirst;
    char charsecond;
};

void a4(struct st_struct *);

int main()
{
    struct st_struct st;

    a4(&st);

    printf("intvalue=%d\n",st.intvalue);
    printf("shortvalue=%d\n",st.shortvalue);
    printf("charfirst=%c\n",st.charfirst);
    printf("charsecond=%c\n",st.charsecond);
} 
