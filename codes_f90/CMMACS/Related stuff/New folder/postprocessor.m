
% postprocessing function 
functionpostprocesser(d)
include_flags;
% prints the element numbers and corresponding stresses
fprintf(1,'element\t\t\tstress\n');
% compute stress vector 
fore=1:nel 
de  = d(LM(:,e));  % displacement at the current element
const  = E(e)/leng(e);  % constant parameter within the element 
ifndof == 1  % For 1-D truss element
stress(e) = const*([-1 1]*de);
end
ifndof == 2  % For 2-D truss element
p = phi(e)*pi/180;    % Converts degrees to radians
c = cos(p); s = sin(p); 
stress(e) = const*[-c -s c s]*de;    % compute stresses
end
fprintf(1,'%d\t\t\t%f\n',e,stress(e));
end