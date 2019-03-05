#include <stdio.h>

int *arr;
int *twodim(void);

int main()
{
    int i;
    int j;

    arr = twodim();

    for(i=0; i<20; i++)
        printf("%02d ",arr[i]);
    printf("\n");
} 
