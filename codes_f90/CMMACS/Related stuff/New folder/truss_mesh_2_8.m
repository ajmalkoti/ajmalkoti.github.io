
% geometry and connectivity for example problem in Figure 2.8 
functiontruss_mesh_2_8;
include_flags;
% Node coordinates (origin placed at node 1) 
x  = [0.0 1.0 2.0 ];  % x coordinate 
y  = [0.0 0.0 0.0 ];  % y coordinate
% connectivity array
IEN = [1 2 
2 3]; 
% plot truss
plottruss;