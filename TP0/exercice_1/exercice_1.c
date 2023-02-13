#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "exercice_1.h"

int pgcd(int val1, int val2) {
   
   int pgcd = 0;
   int var1 = val1;
   int var2 = val2;
   int temp = 0;
   while(var2 != 0) {
      temp = var2;
      var2 = var1 % var2;
      var1 = temp;
   }
   pgcd = var1;

   
   return pgcd;
}



