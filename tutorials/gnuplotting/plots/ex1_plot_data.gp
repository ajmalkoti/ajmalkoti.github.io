#set terminal png enhanced
#set output "ex1_plot_data.png" 
reset
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5
set style line 2 \
    linecolor rgb '#dd181f' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 1.5

plot 'ex1_plot_data.dat' using 1:2 with linespoints linestyle 1,\
  'ex1_plot_data.dat' using 1:(3*($2)) with linespoints linestyle 2

