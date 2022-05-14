#!/bin/bash -e

for i in analytical.ppl convergence-*.dat; do
  if [ ! -e $i ]; then
    echo "error: ${i} not found, please read README fist"
    exit 1
  fi
done

# convert FeenoX's ^ to pyxplot's **
sed 's/\^/**/g' problem.fee > problem.ppl


for shape in ust10 uct10 sst10 sct10 ssh20 sch20 ssh27 sch27; do
 if [ -e convergence-${shape}-1.dat ]; then

  echo ${shape}
 
  # compare number of elements
  paste  convergence-${shape}-1.dat convergence-${shape}-2.dat | awk '{print $1,$7,$8,$21,$22}' > nodes-elements-${shape}.dat

  # do the heavy-lifting 2D plotting
  m4 -Dshape=${shape} plot.ppl.m4 | pyxplot

#   # draw the meshes
#   if [ ! -z "$(which convert)" ]; then
#    n=$(tail -n 1 convergence-${shape}-1.dat | awk '{print $1}')
#    for i in $(seq 1 ${n}); do
#     gmsh -v 0 pipe-draw-mesh-1-${i}.geo
#     convert -trim pipe-mesh-1-${i}.png pipe-mesh-1-${i}.png;
#     convert -trim pipe-mesh-zoom-1-${i}.png pipe-mesh-zoom-1-${i}.png;  
#     montage -mode concatenate -geometry +50 -tile 2x1 pipe-mesh-1-${i}.png pipe-mesh-zoom-1-${i}.png pipe-mesh-${i}.png
#    done 
#   fi 
  
 fi
done
