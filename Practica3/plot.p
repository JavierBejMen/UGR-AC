set terminal png size 700,500

set xlabel "n elementos"
set ylabel "time"

set yrange [0:]

set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2


set style line 2 \
    linecolor rgb '#dd181f' \
    linetype 1 linewidth 2

set output 'sec_lines.png'
plot 'data_pmm_sec.dat' using 1:2 title 'secuencial' w lines linestyle 1
set output 'omp_lines.png'
plot 'data_pmm_omp.dat' using 1:2 title 'omp' w lines linestyle 2

set output 'speedup.png'
plot 'data_pmm_s.dat' u 1:2 title 'Ganancia' w lines linestyle 1
