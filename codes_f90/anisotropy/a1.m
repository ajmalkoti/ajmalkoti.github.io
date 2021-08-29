function nonhyperbolic()
clear all;  close all
%%%%%%%%%%%%%%%%%%%%%%%%%%
dx=50;
xmax=9000;
x=0:dx:xmax;


d=3000;
vp0=3368;
t0=2*d/vp0;

delta=-0.035;
vnmo=vp0*sqrt(1+2*delta);

epsilon=.11;
eta=(epsilon-delta)/(1+2*delta);
vhor=vp0*sqrt(1+2*epsilon)*sqrt(1+2*eta);


%%%%%%%%%% complete seismogram 1
t2= t0^2 + x.^2/vnmo^2 - (vhor^2-vnmo^2)*x.^4 ./ (vnmo^2*(t0^2 *vnmo^4 +vhor^2 *x.^2));
t=sqrt(t2);
plotseis(x,dx,t,1)

%%%%%%%%%% complete seismogram 2
t2a4= t0^2 + x.^2/vnmo^2;
ta4=sqrt(t2a4);
plotseis(x,dx,ta4,2)


%%%%%%%%%% complete seismogram 3
t2a4= t0^2 + x.^2/vnmo^2 - 2* eta * x.^4 /(t0^2*vnmo^4);
ta4=sqrt(t2a4);
plotseis(x,dx,ta4,3)


figure()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applying the nmo only

t2nmo= t0^2 - (vhor^2-vnmo^2)*x.^4 ./ (vnmo^2*(t0^2 *vnmo^4 +vhor^2 *x.^2));
tnmo=sqrt(t2nmo);
plotseis(x,dx,tnmo,1)

%%%%%%%%%%%%%%%%%%%%%%
% subtracting only A4
t2a4= t0^2 + x.^2/vnmo^2 - (vhor^2-vnmo^2)*x.^4 ./ (vnmo^2*(t0^2 *vnmo^4 +vhor^2 *x.^2))+ 2* eta * x.^4 /(t0^2*vnmo^4);
ta4=sqrt(t2a4);
plotseis(x,dx,ta4,2)

%%%%%%%%%%%%%%%%%%%%%%
% subtracting only A4
t2a4= t0^2 + x.^2/vnmo^2 - (vhor^2-vnmo^2)*x.^4 ./ (vnmo^2*(t0^2 *vnmo^4 +vhor^2 *x.^2))- 2* eta * x.^4 /(t0^2*vnmo^4);
ta4=sqrt(t2a4);
plotseis(x,dx,ta4,3)

%%%%%%%%%%%%%%%%%%%%%%
% applying nonlinear nmo
t2nmoa4= t0^2* ones(1,length(x)); 
tnmoa4=sqrt(t2nmoa4);
plotseis(x,dx,tnmoa4,4)

end 



function r=ricker(dt,T,f,t0)
n=round(T/dt);
tvec=dt*(1:n);
pft=pi^2*f^2*(tvec-t0).^2;
r=(1-2*pft).*exp(-pft);
%plot(tvec,r)
end


function plotseis(x,dx,t,figid)
%%%%%%%%%%%%%%%%%%%
dt=.002;
T=5;
f=30;
%t0=0.05;
Nt=round(T/dt);
Nx=length(x);
m=zeros(Nt,Nx);

for i=1:length(x)
    y=ricker(dt,T,f,t(i));
    m(:,i)=y;
end

subplot(1,4,figid)
imagesc(dx*(0:Nx-1),dt*(0:Nt-1),m);
xlabel('offset (m)');
ylabel('t (s)')
set(gca, 'Xaxislocation','Top')
colormap('gray')
end