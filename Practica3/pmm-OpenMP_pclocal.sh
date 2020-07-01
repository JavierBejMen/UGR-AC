#!/usr/bin/env bash
export OMP_NUM_THREADS=8

for (( i = 100; i < 1500; i+=100)); do
  ./pmm-secuencial $i
  ./pmm-OpenMP $i
done

./gen_plot_data

gnuplot -e 'load "plot.p"'
