#include <stdio.h>

void a_ordenar(int tamanio,int arr[]);
int array[] = { 5,32,87,4,92,11,34,3,84,60,17 };

int main()
{
    int i;
    int tamanio = sizeof(array) / sizeof(int);

    for(i=0; i<tamanio; i++) {
        printf("%d ",array[i]);
    }
    printf("\n");

    a_ordenar(tamanio,array);

    for(i=0; i<tamanio; i++) {
        printf("%d ",array[i]);
    }
    printf("\n");
} 
