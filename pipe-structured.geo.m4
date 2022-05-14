SetFactory("OpenCASCADE");

l = 2*(b-a);

Point(1) = {-l/2, 0, 0};
Point(2) = {-l/2, a, 0};
Point(3) = {-l/2, 0, a};
Point(4) = {-l/2, -a, 0};
Point(5) = {-l/2, 0, -a};

Point(6) = {-l/2, b, 0};
Point(7) = {-l/2, 0, b};
Point(8) = {-l/2, -b, 0};
Point(9) = {-l/2, 0, -b};

Circle(1) = {3, 1, 2};
Circle(2) = {2, 1, 5};
Circle(3) = {5, 1, 4};
Circle(4) = {4, 1, 3};
Circle(5) = {7, 1, 6};
Circle(6) = {6, 1, 9};
Circle(7) = {9, 1, 8};
Circle(8) = {8, 1, 7};

Line(9) = {3, 7};
Line(10) = {2, 6};
Line(11) = {5, 9};
Line(12) = {4, 8};

Curve Loop(1) = {5, -10, -1, 9};
Plane Surface(1) = {1};
Curve Loop(2) = {6, -11, -2, 10};
Plane Surface(2) = {2};
Curve Loop(3) = {7, -12, -3, 11};
Plane Surface(3) = {3};
Curve Loop(4) = {8, -9, -4, 12};
Plane Surface(4) = {4};

Transfinite Curve {1, 2, 3, 4, 5, 6, 7, 8} = 1+Pi/4*((b+a)/(b-a))*n;
Transfinite Curve {10, 11, 12, 9} = 1+n;
Transfinite Surface {:};

If (Mesh.RecombineAll)
 Extrude {l, 0, 0} { Surface{1}; Surface{2}; Surface{3}; Surface{4}; Layers {1+n}; Recombine; }
Else
 Extrude {l, 0, 0} { Surface{1}; Surface{2}; Surface{3}; Surface{4}; Layers {1+n}; }
EndIf

Physical Surface("front") = {1, 2, 3, 4};
Physical Surface("back") = {17, 13, 9, 20};
Physical Surface("pressure") = {12, 16, 19, 7};
Physical Volume("bulk") = {2, 3, 4, 1};

Mesh.ElementOrder = order;
