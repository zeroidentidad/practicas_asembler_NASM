#include <stdio.h>

int enterorandom(int menor,int mayor);

int main()
{
    int i;
    int a;
    int b;

    a = 1;
    b = 18;
    printf("Entero aleatorio entre %d y %d: %d\n",a,b,enterorandom(a,b));
    a = 5500;
    b = 100;
    printf("Entero aleatorio entre %d y %d: %d\n",a,b,enterorandom(a,b));
    a = -20;
    b = 20;
    printf("Entero aleatorio entre %d y %d: %d\n",a,b,enterorandom(a,b));
}
