#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int temp(int b,int inc,int a) {
    b += inc;
    if(a-b == 0) {
        return 0;
    }
    else {
        return 1;
    }
}

int main() {

    // variables
    int weight = 1;
    int b = 1;
    int inc = 2;
    int var1, var2;
    int a;

    // utiliser un pointeur malloc pour le resultat
    int *pointeurMalloc;
    pointeurMalloc = malloc(sizeof(int));
    pointeurMalloc[0] = 1;

    // prise de donne de l'entre a
    printf("veuillez choisir une valeur de a : ");
    scanf("%d", &a);

    var1 = a;
    var2 = a;
    int var3 = a;
    
    var3 = var3 >> 1;
    var3 = var3 << 1;

    if (a == var3) {                         // temp:
        pointeurMalloc[0] = 0;
        printf("%d \n", pointeurMalloc[0]);
        return 0;
    }

    b += inc;
    if(a-b == 0) {
        pointeurMalloc[0] = 0;
        printf("%d \n", pointeurMalloc[0]);
        return 0;
    }

    do {                                    // boucle:

        while (var1 - weight == 0) {
            b += inc;                       // temp:
            if(a-b == 0) {
                pointeurMalloc[0] = 0;
                printf("%d \n", pointeurMalloc[0]);
                return 0;
            } 
        }

        var1 = var1 - weight;
        var2 = var2 - b;

        if (var2 == 0) {
            pointeurMalloc[0] = 1;         // S2:
            printf("%d \n", pointeurMalloc[0]);
            return 0;
        }


    } while (true);

    free(pointeurMalloc);                 // liberer le pointeur
    return 0;

}