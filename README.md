# Stress linearization in an infinite pipe

This study shows many things

 1. How the error of computing ASME linearized stresses depends on the number of elements through the thickness of a pipe. Two second-order elements are enough.
 2. The error with respect to the analytical solution vs. CPU and memory usage. It is shown that, even the stresses are basically normal, second-order elements are more efficient that first-order elements.
 3. The rate of convergence with respect to mesh size.
 
 
Show a single tet4 vs tet10 with nodes.
Show a full mesh of tet4 vs tet10 with nodes.
Derive the factor of 6 between the number of DOFs.
Show the difference between straight and curved tet10s. Negative jacobians! Figure from Christophe's paper.

This case uses displacement-based FEM formulation for linear isotropic elasticity.
Note the denominator $r$ in the solution. The iso-parametric displacement-based formulation with polynomial shape functions fail for small $r$ because it is hard for a line and a parabola to approximate $1/r$ when $r \rightarrow 0$.

Wall time and memory are computed only for the solver, not for the mesher. Wall time excludes computation of $L_2$ error.

 * hex20?
 * hex27?
 * mumps?
 
 * plane strain
 * axisymmetric
 
 * compare straight-curved
 * penalty/lagrange
 * the sigmas are not interpolated right, they need to use the constants from the nafems challenge
 
 * unstructured tet4/tet10: ustet10/uctet10
 * structured tet4/10:      sstet10/sctet10
 * structured hex8/hex20    sshex20/schex20
 * strucutred hex8/hex27    sshex27/schex27

 * for each shape above, draw the wheel with the difference between 1st and 2nd order
 
