#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
 #include <omp.h>
#else
 #define omp_get_thread_num() 0
#endif

#define MAX 29999


int main(int argc, char const *argv[]) {

  /**Comprobamos argumentos**/
  if(argc != 2){
    perror("Introduzca dimension de la matriz");
    exit(EXIT_FAILURE);
  }

  int n = 0;
  if( (n=atoi(argv[1])) == 0 ){
    printf("Tamaño introducido invalido, usando valor por defecto %d", MAX);
    n = MAX;
  }


  /**Asignacion dinamica**/
  double **matrix, *in_vec, *out_vec;

  if( (matrix = (double**) malloc(n*sizeof(double*))) == NULL ){
    perror("Error allocando filas de la matriz");
    exit(EXIT_FAILURE);
  }

  for(int i=0; i<n; i++){
    if( (matrix[i]=(double*) malloc(n*sizeof(double))) == NULL ){
      perror("Error allocando columnas de la matriz");
      exit(EXIT_FAILURE);
    }
  }

  if( (in_vec=(double*) malloc(n*sizeof(double))) == NULL ){
    perror("Error allocando in_vec");
    exit(EXIT_FAILURE);
  }

  if( (out_vec=(double*) malloc(n*sizeof(double))) == NULL ){
    perror("Error allocando out_vec");
    exit(EXIT_FAILURE);
  }

  /**Inicializacion**/
  #pragma omp parallel for
  for(int i=0; i<n; i++){
    in_vec[i] = n*0.1+i*0.1; //los valores dependen de N
    out_vec[i] = 0;
    for(int j=0; j<n ; j++){
      matrix[i][j] = n*0.1-j*0.1;
    }
  }

  /**Computo**/
  double start, end;
  double elapsed;

  start = omp_get_wtime();
  #pragma omp parallel for
  for(int i=0; i<n; i++){
    //printf("T: %d multiplica %d\n", omp_get_thread_num(), i);
    for(int j=0; j<n; j++){
      out_vec[i] += matrix[i][j] * in_vec[j];
    }
  }
  end = omp_get_wtime();
  elapsed = end - start;

  /**Resultado**/
  printf("multiplicacion para %i:\n",n);
  if(n < 10){
    printf("[");
    for(int i=0; i<n; i++){
      printf(" %f ", out_vec[i]);
    }
    printf("]\n");
  }
  else{
    printf("out_vec[0] = %f\nout_vec[%d] = %f\n", out_vec[0], n, out_vec[n-1]);
  }
  printf("\nTiempo: %11.9f segundos\n\n", elapsed);

  /**Liberar**/
  free(in_vec);
  free(out_vec);

  for(int i=0; i<n; i++){
    free(matrix[i]);
  }

  free(matrix);

  return EXIT_SUCCESS;
}
