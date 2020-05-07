#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

int main ( int argc, char **argv ){
  if (argc < 2){
    perror("Falta tamaño de la matriz\n");
    return EXIT_FAILURE;
	}

	unsigned int N = atoi(argv[1]);

  if(N == 0){
    perror("Tamaño invalido");
    return EXIT_FAILURE;
  }

	double *vector, *result, **matriz;
	vector = (double *) malloc(N*sizeof(double));
	result = (double *) malloc(N*sizeof(double));
	matriz = (double **) malloc(N*sizeof(double*));

  if (vector == NULL || result == NULL || matriz == NULL){
    perror("Error en la asignación de memoria");
    return EXIT_FAILURE;
  }

	for (int i = 0; i < N; i++){
		if ((matriz[i] = (double*) malloc(N*sizeof(double))) == NULL){
      perror("Error en la asignación de memoria para la matriz");
      return EXIT_FAILURE;
    }
	}

	for (int i = 0; i < N; i++){
		for (int j = 0; j < N; j++){
      if (i >= j){
        matriz[i][j] = 0.1 + (double)j/N;
      }
      else{
        matriz[i][j] = 0;
      }

			vector[i] = (double)j/N;
			result[i] = 0;
		}
	}

  if (N <= 10){
    printf("Matriz:\n");
    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        printf("[%0.4f] ", matriz[i][j]);
      }
      printf("\n");
    }


    printf("Vector:\n");
    for (int i = 0; i < N; i++){
      printf("[%f] ", vector[i] );
    }
    printf("\n");
  }

  /** COMPUTO **/
  double start, end;
  double elapsed;
  start = omp_get_wtime();

	for (int i = 0; i < N; i++){
		for (int j = i; j < N; j++){
			result[i] += matriz[i][j] * vector[j];
		}
	}

  end = omp_get_wtime();
  elapsed = end - start;

  printf("Resultado:\n");
  if (N <= 10){
    for (int i = 0; i < N; i++){
      printf("[%f] ", result[i]);
    }
  }

  printf("\nPrimera: %f\t Ultima: %f\nTiempo (s): %f\n",
    result[0], result[N-1], elapsed);


	for (int i = 0; i < N; ++i){
		free(matriz[i]);
	}

	free(matriz);
	free(vector);
	free(result);

	return EXIT_SUCCESS;
}
