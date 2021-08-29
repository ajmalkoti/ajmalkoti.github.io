clc
clf
clear all
% theory in jain and iyenger
%A= load(data.txt);
%x=A(:,1);
%y=A(:,2);
%n= length(A(:,1));

x= 0:.5:10;         %0:3;             %
n= length(x);
y= sin(x);          %[1,2,33,244];    %
figure(1)
plot(x,y)
hold on

h(1:n-1)=0;
for i=1:n-1
    h(i)= x(i+1) - x(i);
end

% we need to solv D*M=f. Prepare D
D(1:n-2, 1:n-2)= 0;             % Initialize
q= (h(1) + h(2))/3; r= h(2)/6;  % first row of D
D(1,1:2)=[q r];
p= h(n-2)/6;    q= (h(n-3) + h(n-2))/3; %Last row of D
D(n-2, n-3:n-2)= [p q];

for i=2:n-3
   p= h(i)/6;
   q= (h(i)+h(i+1))/3;
   r=  h(i+1)/6   ;
   D(i,i-1:i+1 )= [p q r];  
end

F(1:n-2)=0;
for i=1:n-2
    F(i)= -(y(i+1)-y(i))/ h(i) + (y(i+2)- y(i+1))/h(i+1);
end 

M = D\F'; 
M=[0; M; 0];           % for natural spline

x0=   0;  % input('enter initial point');
dx=   .25;  %input('enter the sample interval') ;

z = x0:dx:x(n);
p = length(z);
yi(1) = 0;
yi(p) = y(n);
for i=1:p-1
    q=length(find(x<=z(i))) ;
      a= M(q+1)/(6*h(q));
      b= M(q)/(6*h(q));
      c= (y(q)- M(q)*h(q)^2/6) / h(q);
      d= (y(q+1)- M(q+1)*h(q)^2/6) / h(q);
    yi(i)= a*(x(q+1)-z(i))^3 + b*(z(i)-x(q))^3 + c*(x(q+1)-z(i)) +d*(z(i)-x(q));
end

figure(1)
plot(z,yi, 'r')
grid on
