#include <stdio.h>

void por_cuatro(int tamanio,int arr[]);

int main()
{
    int i;
    int tamanio=10;
    int array[10];

    for(i=0; i<tamanio; i++) {
        array[i] = i;
        printf("%d ",array[i]);
    }
    printf("\n");

    por_cuatro(tamanio,array);

    for(i=0; i<tamanio; i++) {
        printf("%d ",array[i]);
    }
    printf("\n");
} 
