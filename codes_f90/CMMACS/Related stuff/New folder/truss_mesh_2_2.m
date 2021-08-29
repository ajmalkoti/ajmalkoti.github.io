% geometry and connectivity for example 2.2 
functiontruss_mesh_2_2
include_flags;
% Nodal coordinates (origin placed at node 2) 
x  = [1.0 0.0 1.0 ];  % x coordinate 
y  = [0.0 0.0 1.0 ];  % y coordinate
% connectivity array
IEN = [1 2 
3 3]; 
% plot truss
plottruss;