#include <stdio.h>

int mini(int a,int b);
int maxi(int a,int b);
int abso(int a);

int main()
{
    int result;;

    result = mini(350,150);
    printf("The minimum is %d\n",result);
    result = maxi(350,150);
    printf("The maximum is %d\n",result);
    result = abso(-243);
    printf("The absolute value is %d\n",result);
    return(0);
} 
