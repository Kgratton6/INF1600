#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char **argv)
{
   int taille = 0;
   int valeur = 0;
   int nbElement = 0;
   int index = 0;
   int compteur = 0;
   int *pointeurMalloc;
   printf("Veuillez inserer le nombre d'elements souhaites\n");
   scanf("%d", &nbElement);
   taille = nbElement * sizeof(int);
   pointeurMalloc = malloc(taille);
   printf("Veuillez entrer les elements du tableau (-1 pour cesser l'entree de donnees)\n");
   while (valeur != -1) {
      scanf("%d", &valeur);
      pointeurMalloc[index++] = valeur;
      ++compteur;
      if (nbElement <= compteur) {
         nbElement = compteur;
      }
      if (taille < nbElement * 2) {
         pointeurMalloc = realloc(pointeurMalloc, nbElement * 2);
         free(pointeurMalloc);
      }
   }
   for (int index = 0; index < nbElement; ++index) {
      printf("%d ", pointeurMalloc[index]);
   }
   printf("\n");
   return 0;
}

