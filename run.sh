#!/bin/sh -e

for i in $(cat deps-run); do
  if [ -z "$(which $i)" ]; then
    echo "error: $i not installed (or not found)"
    exit 1
  fi
done

if [ -z "$1" ]; then
  n=6
else
  n=$1
fi

./versions.sh > versions.txt
./cpu.sh > cpu.txt

# compute analytical results with maxima
grep -w "=" problem.fee | grep -v 'x,y,z' | awk '{print $1" : "$3";"}' > problem.max
maxima -b analytical.max > analytical.txt

# create a file which can be included from both FeenoX and Pyxplot
# (good they share the same syntax!)
rm -f analytical.ppl
for i in M_vonmises M_tresca MB_vonmises MB_tresca; do
  echo "${i} = $(grep -A1 ev\(${i}\) analytical.txt | tail -n1 | awk '{print $2}')" >> analytical.ppl
done

# show the difference between pure analytical integration
# and numerical integration of analytical results
feenox analytical.fee

b=$(grep "b = " problem.fee | awk -F= '{print $2}' | awk -F\# '{print $1}')
a=$(grep "a = " problem.fee | awk -F= '{print $2}' | awk -F\# '{print $1}')

echo "# numerical integration of numerical solutions"


# run fem parametric cases
for shape in ust10 uct10 sst10 sct10 ssh20 sch20 ssh27 sch27; do
 echo "# ${shape}"
 for order in 1 2; do
 
  rm -f convergence-${shape}-${order}.dat
  for n in $(seq 1 ${n}); do
   # prepare gmsh .geo file from m4 template
   m4 -Da="(${a})" -Db="(${b})" -Dn=${n} -Dorder=${order} pipe-${shape}.geo.m4 > pipe-${shape}-${order}-${n}.geo
   if [ ! -e pipe-${shape}-${order}-${n}.msh ]; then
    gmsh -v 0 -3 pipe-${shape}-${order}-${n}.geo
   fi
   feenox pipe.fee ${shape} ${order} ${n} | tee -a convergence-${shape}-${order}.dat
  
   # create a geo to draw a picture of the mesh
   # showing how many elements are there with Gmsh
   m4 -Dshape=${shape} -Dn=${n} -Dorder=${order} pipe-draw-mesh.geo.m4 > pipe-draw-mesh-${shape}-${order}-${n}.geo
   
  done 
 done
done
