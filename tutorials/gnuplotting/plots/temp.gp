#set terminal postscript landscape color enhanced
#set output "my-plot.ps" 
set terminal png enhanced
set output "my-plot.png" 
#
# Set overall margins for the combined set of plots and size them
# to generate a requested inter-plot spacing
#
if (!exists("MP_LEFT"))   MP_LEFT = .1
if (!exists("MP_RIGHT"))  MP_RIGHT = .95
if (!exists("MP_BOTTOM")) MP_BOTTOM = .1
if (!exists("MP_TOP"))    MP_TOP = .9
if (!exists("MP_GAP"))    MP_GAP = 0.05

set multiplot layout 2,2 columnsfirst title "{/:Bold=15 Multiplot with explicit page margins}" \
              margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_GAP

set format y "%.1f"
set key box opaque
set ylabel 'ylabel'
set xrange [-2*pi:2*pi]

plot sin(x) lt 1
set xlabel 'xlabel'
plot cos(x) lt 2

unset ylabel
unset ytics

unset xlabel
plot sin(2*x) lt 3
set xlabel 'xlabel'
plot cos(2*x) lt 4
unset multiplot