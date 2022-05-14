load "problem.ppl"
load "analytical.ppl"

ur1(x) = ur(0,x,0)
sigmal1(x) = sigmal(0,x,0)
sigmar1(x) = sigmar(0,x,0)
sigmatheta1(x) = sigmatheta(0,x,0)

delta = 0.05

set preamble "\usepackage{amsmath}"
set width 12*unit(cm)

set axis x arrow nomirrored
set axis y arrow nomirrored


# ------------
# distributions
set grid
set terminal pdf
set xrange [a:b]
set xlabel "$r$ [mm]"
set yrange [*:*]
set key top right


set title "shape"

set output "shape-ur.pdf"
set ylabel "$u_r(r)$ [mm]"
plot ur1(x)                    w l  lw 5  lt 1   color tan          ti "Analytical $u_r(r)~\pm$ 1\%",\
     0.99*ur1(x)               w l  lw 2  lt 4   color tan          ti "",\
     1.01*ur1(x)               w l  lw 2  lt 4   color tan          ti "",\
     "pipe-dist-shape-1-3.dat" u 2:4 w l  lw 1  lt 2   color cyan         ti "",\
     "pipe-dist-shape-1-3.dat" u 2:4 w p  pt 30 ps 1.5 color cyan         every (100)/(1*3) ti "$n=3$ 1st order",\
     "pipe-dist-shape-1-6.dat" u 2:4 w l  lw 1  lt 4   color magenta      ti "",\
     "pipe-dist-shape-1-6.dat" u 2:4 w p  pt 31 ps 1.5 color magenta      every (100)/(1*6) ti "$n=6$ 1st order",\
     "pipe-dist-shape-2-2.dat" u 2:4 w l  lw 2  lt 3   color black        ti "",\
     "pipe-dist-shape-2-2.dat" u 2:4 w p  pt 32 ps 1.5 color black        every (100)/(2*2) ti "$n=2$ 2nd order"

set output "shape-sigmatheta.pdf"
set ylabel "$\sigma_\theta(r)$ [MPa]"
plot sigmatheta1(x)            w l  lw 5  lt 1   color tan          ti "Analytical $\sigma_\theta(r)~\pm$ 1\%",\
     0.99*sigmatheta1(x)       w l  lw 2  lt 4   color tan          ti "",\
     1.01*sigmatheta1(x)       w l  lw 2  lt 4   color tan          ti "",\
     "pipe-dist-shape-1-3.dat" u 2:5 w l  lw 1  lt 2   color cyan         ti "",\
     "pipe-dist-shape-1-3.dat" u 2:5 w p  pt 30 ps 1.5 color cyan         every (100)/(1*3) ti "$n=3$ 1st order",\
     "pipe-dist-shape-1-6.dat" u 2:5 w l  lw 1  lt 4   color magenta      ti "",\
     "pipe-dist-shape-1-6.dat" u 2:5 w p  pt 31 ps 1.5 color magenta      every (100)/(1*6) ti "$n=6$ 1st order",\
     "pipe-dist-shape-2-2.dat" u 2:5 w l  lw 2  lt 3   color black        ti "",\
     "pipe-dist-shape-2-2.dat" u 2:5 w p  pt 32 ps 1.5 color black        every (100)/(2*2) ti "$n=2$ 2nd order"

set output "shape-sigmal.pdf"
set ylabel "$\sigma_l(r)$ [MPa]"
plot sigmal1(x)                w l  lw 5  lt 1   color tan          ti "Analytical $\sigma_\theta(r)~\pm$ 1\%",\
     0.99*sigmal1(x)           w l  lw 2  lt 4   color tan          ti "",\
     1.01*sigmal1(x)           w l  lw 2  lt 4   color tan          ti "",\
     "pipe-dist-shape-1-3.dat" u 2:6 w l  lw 1  lt 2   color cyan         ti "",\
     "pipe-dist-shape-1-3.dat" u 2:6 w p  pt 30 ps 1.5 color cyan         every (100)/(1*3) ti "$n=3$ 1st order",\
     "pipe-dist-shape-1-6.dat" u 2:6 w l  lw 1  lt 4   color magenta      ti "",\
     "pipe-dist-shape-1-6.dat" u 2:6 w p  pt 31 ps 1.5 color magenta      every (100)/(1*6) ti "$n=6$ 1st order",\
     "pipe-dist-shape-2-2.dat" u 2:6 w l  lw 2  lt 3   color black        ti "",\
     "pipe-dist-shape-2-2.dat" u 2:6 w p  pt 32 ps 1.5 color black        every (100)/(2*2) ti "$n=2$ 2nd order"

set output "shape-sigmar.pdf"
set key top left
set ylabel "$\sigma_r(r)$ [MPa]"
plot sigmar1(x)                w l  lw 5  lt 1   color tan          ti "Analytical $\sigma_\theta(r)~\pm$ 5\%",\
     0.95*sigmar1(x)           w l  lw 2  lt 4   color tan          ti "",\
     1.05*sigmar1(x)           w l  lw 2  lt 4   color tan          ti "",\
     "pipe-dist-shape-1-3.dat" u 2:7 w l  lw 1  lt 2   color cyan         ti "",\
     "pipe-dist-shape-1-3.dat" u 2:7 w p  pt 30 ps 1.5 color cyan         every (100)/(1*3) ti "$n=3$ 1st order",\
     "pipe-dist-shape-1-6.dat" u 2:7 w l  lw 1  lt 4   color magenta      ti "",\
     "pipe-dist-shape-1-6.dat" u 2:7 w p  pt 31 ps 1.5 color magenta      every (100)/(1*6) ti "$n=6$ 1st order",\
     "pipe-dist-shape-2-2.dat" u 2:7 w l  lw 2  lt 3   color black        ti "",\
     "pipe-dist-shape-2-2.dat" u 2:7 w p  pt 32 ps 1.5 color black        every (100)/(2*2) ti "$n=2$ 2nd order"


     
# -----------------------------------------------
# linearized stresses
set key above
set xlabel "Number $n$ of elements through the pipe thickness"
set xrange [*:*]
set xtics 1
set mxtics 0.5

set output "shape-M_v.pdf"
set yrange [(1-delta)*M_vonmises:(1+delta)*M_vonmises]
set ylabel "Membrane von Mises stress $\text{M}_v$ [MPa]"
plot M_vonmises                w l  lw 5 lt 1               color tan  ti "Analytical $\text{M}_v~\pm$ 1\%",\
     1.01*M_vonmises           w l  lw 2 lt 4               color tan  ti "",\
     0.99*M_vonmises           w l  lw 2 lt 4               color tan  ti "",\
     "convergence-shape-1.dat" u 1:3 w lp lw 3 lt 2 pt 4 ps 2     color red  ti "1st order",\
     "convergence-shape-2.dat" u 1:3 w lp lw 3 lt 3 pt 3 ps 2     color blue ti "2nd order"

set output "shape-M_t.pdf"
set yrange [(1-delta)*M_tresca:(1+delta)*M_tresca]
set ylabel "Membrante Tresca stress $\text{M}_t$ [MPa]"
plot M_tresca                  w l  lw 5 lt 1              color tan   ti "Analytical $\text{M}_t~\pm$ 1\%",\
     1.01*M_tresca             w l  lw 2 lt 4              color tan   ti "",\
     0.99*M_tresca             w l  lw 2 lt 4              color tan   ti "",\
     "convergence-shape-1.dat" u 1:4 w lp lw 3 lt 2 pt 4 ps 2    color red   ti "1st order",\
     "convergence-shape-2.dat" u 1:4 w lp lw 3 lt 3 pt 3 ps 2    color blue  ti "2nd order"     
     
    
set output "shape-MB_v.pdf"
set key top right
set yrange [(1-delta)*MB_vonmises:(1+delta)*MB_vonmises]
set xlabel "Number $n$ of elements through the pipe thickness"
set ylabel "Membrane plus bending von Mises stress $\text{MB}_v$ [MPa]"
plot MB_vonmises               w l  lw 5 lt 1               color tan     ti "Analytical $\text{MB}_v~\pm$ 1\%",\
     1.01*MB_vonmises          w l  lw 2 lt 4               color tan     ti "",\
     0.99*MB_vonmises          w l  lw 2 lt 4               color tan     ti "",\
     "convergence-shape-1.dat" u 1:5 w lp lw 3 lt 2 pt 18 ps 2    color red     ti "1st order",\
     "convergence-shape-2.dat" u 1:5 w lp lw 3 lt 3 pt 17 ps 2    color blue    ti "2nd order" 

     
     
set output "shape-MB_t.pdf"
set key top right
set yrange [(1-delta)*MB_tresca:(1+delta)*MB_tresca]
set xlabel "Number $n$ of elements through the pipe thickness"
set ylabel "Membrane plus bending Tresca stress $\text{MB}_t$ [MPa]"
plot MB_tresca                 w l  lw 5 lt 1               color tan     ti "Analytical  $\text{MB}_t~\pm$ 1\%",\
     1.01*MB_tresca            w l  lw 2 lt 4               color tan     ti "",\
     0.99*MB_tresca            w l  lw 2 lt 4               color tan     ti "",\
     "convergence-shape-1.dat" u 1:6 w lp lw 3 lt 2 pt 18 ps 2    color red     ti "1st order",\
     "convergence-shape-2.dat" u 1:6 w lp lw 3 lt 2 pt 17 ps 2    color blue    ti "2nd order"


     
     
# -----------------------------------------------
# error vs resources
set key top right
set yrange [1e-6:1]
set logscale y
set logscale x
unset y2label
unset y2tics


set output "shape-error-vs-wall.pdf"
set xrange [1e-2:1e2]
set xlabel "Wall time [sec]"
set ylabel "Relative error"
plot "convergence-shape-1.dat" u 9:(abs($3-M_vonmises)/M_vonmises)   w lp lw 2 lt 2 pt 2 ps 2     color red    ti "$\text{M}_v$ 1st order",\
     "convergence-shape-2.dat" u 9:(abs($3-M_vonmises)/M_vonmises)   w lp lw 3 lt 3 pt 3 ps 2     color blue   ti "$\text{M}_v$ 2nd order",\
     "convergence-shape-1.dat" u 9:(abs($5-MB_vonmises)/MB_vonmises) w lp lw 2 lt 2 pt 16 ps 2    color red    ti "$\text{MB}_v$ 1st order",\
     "convergence-shape-2.dat" u 9:(abs($5-MB_vonmises)/MB_vonmises) w lp lw 3 lt 3 pt 17 ps 2    color blue   ti "$\text{MB}_v$ 2nd order"

set output "shape-error-vs-mem.pdf"
set xrange [1e-2:32]
set xlabel "Memory [Gb]"
set ylabel "Relative error"
plot "convergence-shape-1.dat" u 10:(abs($3-M_vonmises)/M_vonmises)   w lp lw 2 lt 2 pt 2 ps 2    color red    ti "$\text{M}_v$ 1st order",\
     "convergence-shape-2.dat" u 10:(abs($3-M_vonmises)/M_vonmises)   w lp lw 3 lt 3 pt 3 ps 2    color blue   ti "$\text{M}_v$ 2nd order",\
     "convergence-shape-1.dat" u 10:(abs($5-MB_vonmises)/MB_vonmises) w lp lw 2 lt 2 pt 16 ps 2   color red    ti "$\text{MB}_v$ 1st order",\
     "convergence-shape-2.dat" u 10:(abs($5-MB_vonmises)/MB_vonmises) w lp lw 3 lt 3 pt 17 ps 2   color blue   ti "$\text{MB}_v$ 2nd order"
 
     
     
     
# -----------------------------------------------


set key bottom right
set yrange [*:*]
set xrange [*:*]
set xtics
set mxtics
set logscale y
set logscale x

set output "shape-resources-vs-nodes.pdf"
set xlabel "Number $n$ of elements through the pipe thickness"

set ylabel "Wall time [sec]"
set y2label "Memory [Gb]"
set logscale y2
set key top left

plot "convergence-shape-1.dat" u 7:9   w lp lw 2 lt 3 pt 2 ps 1   color red   ti "Wall 1st order",\
     "convergence-shape-2.dat" u 7:9   w lp lw 3 lt 4 pt 4 ps 1   color blue  ti "Wall 2nd order",\
     "convergence-shape-1.dat" u 7:10  w lp lw 2 lt 3 pt 16 ps 1  color red   axes x1y2 ti "Memory 1st order",\
     "convergence-shape-2.dat" u 7:10  w lp lw 3 lt 4 pt 18 ps 1  color blue  axes x1y2 ti "Memory 2nd order"
 

# -----------------------------------------------

set key bottom right
set yrange [*:*]
unset logscale x
unset logscale y2
set logscale y

set output "shape-elements-vs-n.pdf"
set ylabel  "Number of elements"
set y2label "Elements in 2nd order / elements in 1st order"
plot "nodes-elements-shape.dat" u 1:3        w lp lw 2 lt 3 pt 2  ps 1   color red   ti "1st order",\
     "nodes-elements-shape.dat" u 1:5        w lp lw 3 lt 4 pt 4  ps 1   color blue  ti "2nd order",\
     "nodes-elements-shape.dat" u 1:($5/$3)  w lp lw 3 lt 1 pt 6         color grey  axes x1y2 ti "ratio"


set output "shape-nodes-vs-n.pdf"
set ylabel  "Number of nodes"
set y2label "Nodes in 2nd order / nodes in 1st order"
plot "nodes-elements-shape.dat" u 1:2        w lp lw 2 lt 3 pt 16 ps 1   color red   ti "1st order",\
     "nodes-elements-shape.dat" u 1:4        w lp lw 3 lt 4 pt 18 ps 1   color blue  ti "2nd order",\
     "nodes-elements-shape.dat" u 1:($4/$2)  w lp lw 3 lt 1 pt 20        color grey  axes x1y2 ti "ratio"
