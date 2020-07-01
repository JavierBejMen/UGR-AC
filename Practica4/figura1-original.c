#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

struct {
        int a;
        int b;
}  s[5000];

int main(int argc, char const *argv[]) {
   int ii, i, X1, X2, R[40000];

   double start, end;
   double elapsed;
   start = omp_get_wtime();

   for (ii=0; ii<40000;ii++) {
      X1=0; X2=0;
      for(i=0; i<5000;i++)  X1+=2*s[i].a+ii;
      for(i=0; i<5000;i++)  X2+=3*s[i].b-ii;

      if (X1<X2)  R[ii]=X1;  else  R[ii]=X2;
   }

   end = omp_get_wtime();
   elapsed = end - start;

   printf("\nPrimera: %d\t Ultima: %d\nTiempo (s): %f\n",
     R[0], R[39999], elapsed);

   return EXIT_SUCCESS;
}
