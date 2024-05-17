#include <stdio.h>
/*
 * lab05 as edited by Corey Young & Caleb Krauter
 */
int sumValues(int v[], int size);

int main(void) {

   int val[5], n;


   for (n = 0; n < 5; n++)
         val[n] = n * n;

   printf("the sum of entered values is %d", sumValues(val, 5));
   return 0;

}

int sumValues(int a[], int length) {

   int sum, i;
   sum = 0;
   for (i = 0; i < length; i++)
          sum += a[i];

   return sum;
}
