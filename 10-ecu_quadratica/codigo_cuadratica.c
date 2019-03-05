#include <stdio.h>

int cuadratica(double,double,double,double *,double *);

int main()
{
    double a;
    double b;
    double c;
    double solucion1;
    double solucion2;
    int cond;

    do {
        printf("\na: ");
        scanf("%lf",&a);
        printf("b: ");
        scanf("%lf",&b);
        printf("c: ");
        scanf("%lf",&c);

        cond = cuadratica(a,b,c,&solucion1,&solucion2);
        if(cond == 0) {
            printf("Sin solucion real.\n");
        } else {
            printf("%g and %g\n",solucion1,solucion2);
        }
    } while(1);
} 
