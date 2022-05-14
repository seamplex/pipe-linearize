SetFactory("OpenCASCADE");

l = 2*(b-a);


Cylinder(1) = {-l/2, 0, 0,  +l, 0, 0,  b};
Cylinder(2) = {-l/2, 0, 0,  +l, 0, 0,  a};
BooleanDifference(3) = {Volume{1};Delete;}{Volume{2};Delete;};

Physical Volume("pipe") = {3};
s() = Boundary{ Volume{3}; };
Physical Surface("front") = {s(1)};
Physical Surface("back") = {s(2)};
Physical Surface("pressure") = {s(3)};

Mesh.CharacteristicLengthMax = (b-a)/n;
Mesh.ElementOrder = order;
Mesh.SecondOrderLinear = 0;

Mesh.Algorithm = 6;
Mesh.Algorithm3D = 4;
Mesh.Optimize = 1;
Mesh.OptimizeNetgen = 1;
Mesh.HighOrderOptimize = 2;

