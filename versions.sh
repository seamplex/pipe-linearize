echo \$ feenox -V
feenox -V
echo \$
echo \$ gmsh -info
gmsh -info 2>&1 | grep -v  options
