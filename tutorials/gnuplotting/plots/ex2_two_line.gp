#set terminal png enhanced
#set output "ex2_two_line_Data.png" 
reset
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5
set style line 2 \
    linecolor rgb '#dd181f' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 1.5

plot 'ex2_two_line_Data.dat' index 0 with linespoints linestyle 1, \
     'ex2_two_line_Data.dat' index 1 with linespoints linestyle 2