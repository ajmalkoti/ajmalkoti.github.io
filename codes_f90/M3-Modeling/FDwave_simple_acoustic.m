% basic script for acoustic wave propagtion in a given media.

% model properties
dh = 20;
ny=100;
nx= 200;
vp = 2500*ones(ny,nx);
xvec = (0:nx-1)*dh;
yvec = (0:ny-1)*dh;
figno=1;

% source properties
dt = .001;
T = 1;
t0=.18;
tvec=(0:dt:T)   ;
f0 =4;
pft = pi*f0*(tvec- t0) ;
src = 10*exp(-pft.^2) ;     %(1- 2*pft.^2).* exp(-pft.^2);
nt=length(src);

% Pre allocation of the matrices
P0=zeros(ny,nx);
P1=zeros(ny,nx);
P2=zeros(ny,nx);
derx=zeros(ny,nx);
dery=zeros(ny,nx);
ss = zeros(nt,nx);

% precomputed constant matrix
const =   (vp.*dt/dh).^2;

figure(figno)
for it =1:nt
    P1(ny/2,nx/2) = P1(ny/2,nx/2) + src(it);
    derx(2:end-1,2:end-1) = P1(2:end-1, 3:end)  - 2*P1(2:end-1,2:end-1)   + P1(2:end-1,1:end-2)  ;
    dery(2:end-1,2:end-1) = P1(3:end, 2:end-1)  -2*P1(2:end-1,2:end-1)  +P1(1:end-2,2:end-1)  ;
    P2 = 2*P1 -P0 +  (derx + dery).*const ;
    P0=P1;
    P1=P2;
    ss(it,:) = P2(2,:);
    
    if mod(it,20) ==0
        hsp=subplot(1,2,1);
        imagesc(xvec,yvec,P0);
        xlabel('x[m]')
        ylabel('z[m]')
        set(hsp,'XAxisLocation','Top')
        axis image;
        
        hsp=subplot(1,2,2);
        imagesc(xvec,tvec,ss);
        xlabel('x[m]')
        ylabel('T [s]')
        set(hsp,'XAxisLocation','Top')
        colorbar
        pause(.1)
    end
end



hsp=subplot(1,2,1);
imagesc(xvec,yvec,P0);
xlabel('x[m]')
ylabel('z[m]')
set(hsp,'XAxisLocation','Top')
axis image;

hsp=subplot(1,2,2);
imagesc(xvec,tvec,ss);
xlabel('x[m]')
ylabel('T [s]')
set(hsp,'XAxisLocation','Top')
colorbar
