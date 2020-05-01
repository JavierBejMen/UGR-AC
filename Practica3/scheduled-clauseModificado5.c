#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
 #include <omp.h>
#else
 #define omp_get_thread_num() 0
#endif
main(int argc, char **argv) {
  omp_sched_t kind;
  int dyn_var, nthreads_var;
  int i, n=16,chunk,a[n],suma=0;
  if(argc < 6) {
    fprintf(stderr, "Uso: %s n_iter kind chunk nthreads dyn\n", argv[0]);
    exit(-1);
  }
  omp_get_schedule(&kind, &chunk);
  printf("Antes:\ndyn-var: %d\nnthreads-var: %d\nthread-limit-var: %d\n\
run-sched-var: %d,%d\n", omp_get_dynamic(), omp_get_num_threads(),
    omp_get_thread_limit(), kind, chunk);

  n = atoi(argv[1]); if (n>200) n=200;

  chunk = atoi(argv[3]);
  kind = atoi(argv[2]); omp_set_schedule(kind,chunk);
  nthreads_var = atoi(argv[4]); omp_set_num_threads(nthreads_var);
  dyn_var = atoi(argv[5]); omp_set_dynamic(dyn_var);

  omp_get_schedule(&kind, &chunk);
  printf("\nDespues:\ndyn-var: %d\nnthreads-var: %d\nthread-limit-var: %d\n\
run-sched-var: %d,%d\n", omp_get_dynamic(), omp_get_num_threads(),
    omp_get_thread_limit(), kind, chunk);

  for (i=0; i<n; i++) a[i] = i;
  #pragma omp parallel
  {
    #pragma omp for firstprivate(suma) \
    lastprivate(suma)
    for (i=0; i<n; i++)
    {
      suma = suma + a[i];
      //printf(" thread %d suma a[%d]=%d suma=%d \n",
      //omp_get_thread_num(),i,a[i],suma);
    }
  }

  printf("\n\nFuera de 'parallel for' suma=%d\n",suma);

}
