#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main() {

    int a = 8;
    int weight = 1;
    int i, j, sum1, sum2, result;

    i = a;
    sum1 = a;

    while (i != 0) { // terme1
        i -= weight;
        sum1 += i;
    }

    j = a;           // temp
    sum2 = a * a;

    while (j != 0) { // terme2
        j -= weight;
        sum2 += (j * j);
    }

    result = (sum1 * sum1) - sum2; // fin

    printf("%d \n", result);

}