% generate the element stiffness matrix for each element
functionke = trusselem(e)
include_flags;
const = CArea(e)*E(e)/leng(e);  % constant coefficient within the truss element
if ndof == 1
ke = const * [1 -1 ;  % 1-D stiffness 
-1 1]; 
elseif ndof == 2
p = phi(e)*pi/180;  % Converts degrees to radians
s = sin(p); c = cos(p);
s2 = s^2; c2 = c^2;
ke = const*[c2 c*s -c2 -c*s;  % 2-D stiffness
 c*s s2 -c*s -s2;
-c2 -c*s c2 c*s;
-c*s -s2 c*s s2];
end