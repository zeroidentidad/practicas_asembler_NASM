#include <stdio.h>

int gcdargs(int a,int b);

int main()
{
    int result;
    int a;
    int b;

    a = 46;
    b = 90;
    printf("%d and %d have a gcd of %d\n",a,b,gcdargs(a,b));

    a = 9863;
    b = 41272;
    printf("%d and %d have a gcd of %d\n",a,b,gcdargs(a,b));
} 
