#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "exercice_1.h"

int main(int argc, char** argv) {

   // TODO: Demander à l'utilisateur deux valeurs pour trouver le PGCD entre elles
   // TODO: Appeler la fonction implementée dans le fichier exercice_1.c
   // TODO: Afficher le PGCD calculé

   int val1, val2, res = 0;
   printf("veuillez choisir un premier nombre : \n");
   scanf("%d", &val1);
   printf("veuillez choisir un deuxième nombre : \n");
   scanf("%d", &val2);

   int resultat = pgcd(val1, val2);

   printf("le PGCD de %d et de %d est %d", val1, val2, resultat);

   return 0;
}
