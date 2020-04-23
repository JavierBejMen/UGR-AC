set terminal png size 700,500

set xlabel "p procesadores"
set ylabel "Ganancia"

set yrange [0:2]
set xrange [0:9]

set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2


set style line 2 \
    linecolor rgb '#dd181f' \
    linetype 1 linewidth 2

set output 'cpu_lines.png'
plot 'data_5000.dat' using 1:4 title 'n=5000' w lines linestyle 1, \
     'data_5000.dat' using 1:5 title 'n=20000' w lines linestyle 2
