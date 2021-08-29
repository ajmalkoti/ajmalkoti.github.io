clc; clear all; clf

a= load('xydata.dat');
n =length(a);   x=a(1:n,1);     y=a(1:n,2);
figure(1); plot(x,y,'o')
xlabel('X');ylabel('Data(Y)');

G=[x ones(n,1)];
m=(G'*G)^-1 * G'*y;
d=G*m;

hold on; %plot(x,d,'r')
eps=.1e-10;
cstr= 'kbgrymcbkb';        %'wcmyrgbk';

for p=1:10
    d=G*m;
    for t=1:10
        wt=y-d;
        err1=sum(abs(wt));
        R=diag(max((wt).^(p-2),eps));
        m=(G'*R*G)^-1 *G'*R*y;
        dsyn=G*m;
        err2=sum(abs((y-dsyn)));
        if(err1<=err2)
           continue
        end
        err1=err2;
        d=dsyn;
    end
    figure(1);  plot(x,d,'*--','color',cstr(p))
    figure(2); subplot(5,2,p); plot(x,0,'--' ,x,y-d,'*'); title(strcat('p=',num2str(p)))
    xlabel('X');ylabel('Error');
    %temp=input('');
end

figure(1); legend('Data','p=1', 'p=2','p=3','p=4','p=5','p=6',2)
%temp=input('');