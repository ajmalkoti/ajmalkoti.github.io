clear all
clc;
G=[1 1 0 0; 0 0 1 1; 1 0 1 0; 0 1 0 1];
[U A V]=svd(G);
temp = find(diag(A)<eps);
if (~isempty(temp) )
    disp('Given matrix is singular')
end
n=size(A,1);
Vp=V(:,1:temp-1);
m_res=Vp*(Vp');
figure(1); imagesc(m_res);title('Image for the resolution matrix'); colorbar;

m=(1:4);
d=G*m';
figure(2); plot(m,'*--');
hold on
cstr= 'kbgrymckbgrymc'; 

alpha=.1:.1:10;
for i=1:length(alpha)
  mest = inv(V*(A')*A*(V')+ (alpha(i)^2)*eye(n))*V*A'*U'*d;
  %figure(2); plot(1:n,mest,'--*','color',cstr(i));
  dGm2(i)=sum((d-G*mest).^2);
  m2(i) = sum(mest.^2);
  %temp=input('');
end

figure(3); plot(dGm2,m2, '*--'); 
figure(3); xlabel('||d-Gm||2'); ylabel('||m||2'); title('L-curve for determination of parameter alpha');
for k=1:length(alpha)
str = strcat('   \alpha=',num2str(alpha(k)));
text(dGm2(k),m2(k),str);
end;


alpha = input('enter the value of alpha:  ');
mest = inv(V*(A')*A*(V')+ (alpha^2)*eye(n))*V*A'*U'*d;
figure(2); plot(mest, '*--','color','r')
xlabel('parameter index'); ylabel('parameter value');
title('Estimated value')
