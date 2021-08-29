% preprocessing– read input data and set up mesh information
function[K,f,d]  = preprocessor;
include_flags;
% input file to include all variables 
input_file_example2_2; 
%input_file_example2_8; 
% generate LM array 
fore = 1:nel
forj = 1:nen
form = 1:ndof
ind = (j-1)*ndof + m;
LM(ind,e) = ndof*IEN(j,e) - ndof + m;
end
end
end