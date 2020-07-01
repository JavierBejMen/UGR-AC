#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

int main(int argc, char const *argv[]) {

  /** Comprobacion argumentos **/
  if(argc != 2){
    fprintf(stderr, "Uso: %s <N>", argv[0]);
    return EXIT_FAILURE;
  }

  unsigned int N = 0;
  if ((N = atoi(argv[1])) == 0){
    perror("Tamaño de matriz erroneo");
    return EXIT_FAILURE;
  }

  /** Asignacion memoria **/
  double **A, **B, **C;
  if ((A = (double**) malloc(N*sizeof(double**))) == NULL){
    perror("Error asignando memoria filas para A");
    return EXIT_FAILURE;
  }
  if ((B = (double**) malloc(N*sizeof(double**))) == NULL){
    perror("Error asignando memoria filas para B");
    return EXIT_FAILURE;
  }
  if ((C = (double**) malloc(N*sizeof(double**))) == NULL){
    perror("Error asignando memoria filas para C");
    return EXIT_FAILURE;
  }

  for (int i = 0; i < N; i++){
    if ((A[i] = (double*) malloc(N*sizeof(double*))) == NULL){
      perror("Error asignando memoria columnas para A");
      return EXIT_FAILURE;
    }
    if ((B[i] = (double*) malloc(N*sizeof(double*))) == NULL){
      perror("Error asignando memoria columnas para B");
      return EXIT_FAILURE;
    }
    if ((C[i] = (double*) malloc(N*sizeof(double*))) == NULL){
      perror("Error asignando memoria columnas para C");
      return EXIT_FAILURE;
    }
  }

  /** Inicializacion **/
  for (int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      C[i][j] = 0.1 + (double)i/N;
      B[i][j] = 0.1 + (double)j/N;
      A[i][j] = 0;
    }
  }

  /** Computo **/
  double start, end;
  double elapsed;
  start = omp_get_wtime();

  for (int i = 0; i < N; i++){
    for (int k = 0; k < N; k++){
      for (int j = 0; j < N; j++)
      {
        A[i][j] += B[i][k] * C[k][j];
      }
    }
  }

  end = omp_get_wtime();
  elapsed = end - start;

  /** Resultados **/
  if (N < 10){
    printf("Matriz B:\n");
    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        printf("[%f] ", B[i][j]);
      }
      printf("\n");
    }
    printf("Matriz C:\n");
    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        printf("[%f] ", C[i][j]);
      }
      printf("\n");
    }
    printf("Resultado(A):\n");
    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        printf("[%f] ", A[i][j]);
      }
      printf("\n");
    }
  }

  printf("\nPrimera: %f\t Ultima: %f\nTiempo (s): %f\n",
    A[0][0], A[N-1][N-1], elapsed);

  /** Escritura resultados para plot **/
  FILE *data;
  if( (data = fopen("data_pmm_sec.dat", "a")) == NULL){
    printf("No se pudo crear archivo para plot");
  }
  else{
    fprintf(data,"%d %f\n", N, elapsed);
    fclose(data);
  }

  /** Liberacion **/
  for (int i = 0; i < N; i++){
    free(A[i]);
    free(B[i]);
    free(C[i]);
  }

  free(A);
  free(B);
  free(C);

  return EXIT_SUCCESS;
}
