#include <stdio.h>

int mcd(int a,int b);

int main()
{
    int result;
    int a;
    int b;

    a = 46;
    b = 90;
    printf("%d y %d tienen un mcd de %d\n",a,b,mcd(a,b));

    a = 9863;
    b = 41272;
    printf("%d y %d tiene un mcd de %d\n",a,b,mcd(a,b));
} 
