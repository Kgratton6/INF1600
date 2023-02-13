#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

bool parité(char valeur){

   char masque = 0b00000001;
   int compteur = 0;
   int decalage = 0;
   
   while (decalage < 8) 
   {

      if ((0b11011100 >> decalage) & masque) 
      {
         compteur++;
      }
      decalage++;

   }

   if ((compteur % 2) == 0) {
      return true;
   }
   else{
      return false;
   }

}



int main(int argc, char** argv) 
{

   char c = 0b11011100;
   bool reponse = parité(c);
   if (reponse == true){
      printf("le nombre de 1 est pair\n");
   }
   if (reponse == false) {
      printf("le nombre de 1 est impair\n");
   }

}