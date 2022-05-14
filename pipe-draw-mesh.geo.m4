Merge "pipe-shape-order-n.msh";

General.TrackballQuaternion0 = 0.5084777988449202;
General.TrackballQuaternion1 = -0.280485582443957;
General.TrackballQuaternion2 = -0.3761412040677031;
General.TrackballQuaternion3 = 0.7220082830033158;

General.TranslationX = 4;
General.TranslationY = -6;

s = 1.3;
General.ScaleX = s;
General.ScaleY = s;
General.ScaleZ = s;

Mesh.ColorCarousel = 2; // Mesh coloring (0=by element type, 1=by elementary entity, 2=by physical entity, 3=by partition)
Mesh.Color.One = {192,192,192};
Mesh.Color.Three = {6,182,216};


Geometry.Points = 0;
Geometry.Lines = 0;

Mesh.SurfaceEdges = 0;
Mesh.SurfaceFaces = 1;
Mesh.VolumeFaces = 1;

Mesh.Clip = 1;
General.Clip0A = 1;
General.Clip0B = 0;
General.Clip0C = 0;
General.Clip0D = 0;

General.ClipWholeElements = 1;
General.SmallAxes = 0;


Print "pipe-mesh-shape-order-n.png";
//Print "pipe-mesh-order-n.svg";


General.TrackballQuaternion0 = 0.4084376106523261;
General.TrackballQuaternion1 = -0.4488724158979518;
General.TrackballQuaternion2 = -0.49842062875781;
General.TrackballQuaternion3 = 0.6190873518973111;

General.TranslationX = -147.4507812459117;
General.TranslationY = -4.20060750294238;

s = 5.1;
General.ScaleX = s;
General.ScaleY = s;
General.ScaleZ = s;

Print "pipe-mesh-zoom-shape-order-n.png";
//Print "pipe-mesh-zoom-order-n.svg";

Exit;
