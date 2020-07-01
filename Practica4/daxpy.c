#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]){
    if (argc < 3) {
        fprintf(stderr, "ERROR, uso: %s <tamaño> <constante>\n", argv[0]);
        return EXIT_FAILURE;
    }

    unsigned n = strtol(argv[1], NULL, 10);
    int a = strtol(argv[2], NULL, 10);
    int *y, *x;
    if ((y = (int*) malloc(n*sizeof(int))) == NULL){
      perror("Error alocando memoria para y");
      return EXIT_FAILURE;
    }
    if ((x = (int*) malloc(n*sizeof(int))) == NULL){
      perror("Error alocando memoria para x");
      return EXIT_FAILURE;
    }

    for (unsigned i=0; i<n; i++){
        y[i] = i+2;
        x[i] = i*2;
    }

    struct timespec cgt1,cgt2; double ncgt;
    clock_gettime(CLOCK_REALTIME,&cgt1);
    for (unsigned i=0; i<n; i++)
        y[i] += a*x[i];
    clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("y[0] = %i, y[%i] = %i\n", y[0], n-1, y[n-1]);
    printf("\nTiempo (segundos) = %11.9f\n", ncgt);
    free(y);
    free(x);
    return EXIT_SUCCESS;
}
