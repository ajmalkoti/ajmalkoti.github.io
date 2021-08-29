clc;    clear all;
% the wavefield generated W using the green function for 2D
% S = source wavelet (in freq domain)
% H_0^2 = Hankel transform of zero order and second kind
% W(w) = - (i/4) S(w) H_0^2(kr)
% the final wavelet should appear at time, t= dist / vel= 0.5sec

%% Parameter Setting
vel=2000;       r=1000;                  % velocity of medium, distance at which wavefield will be observed
T=1;        dt=.0025;       f0=25;      % Total time,  time step, central freq

%% Create Source Wavelet
N = round(T/dt);                                % No of samples
t0 = 5/(sqrt(2)*pi*f0);                         % Zero time shift
tvec  = dt*(0:N-1);                             % time vector
pft = pi*f0*(tvec-t0 +1*dt);
srcvec = (1 -2*pft.^2).*exp(- pft.^2);  % source wavelet
%srcvec = (1 -2* tau.*tau * f0^2 * pi^2).*exp(-tau.^2 * pi^2 * f0^2);  % source wavelet

%% FT of signal
fmax=1/dt; % max frequency 
freqvec= linspace(0,fmax,N);    % Freq vector:   0 <= f <= Fmax
sw=fft(srcvec);                           % fourier transform of wavelet, S(w)

%% 2-D Greens Function 
w = 2*pi*freqvec;
H02 = besselh(0,2,w/vel*r);         H02(1)=0;
GF = -(1i/4)*H02;
WF= ifft(GF.*sw);       % Calculating the Wavefield  

%% Plot
subplot(2,2,1);     plot(tvec,srcvec);     title('\bf{Source wavelet}');          xlabel('Time(sec)');              ylabel('Amplitude ')
subplot(2,2,2);     plot(freqvec,abs(sw));    title('\bf{Source freq spec}');  xlabel('Frequencies (Hz)');  ylabel('Amplitude ')
xlim([0 fmax/2])
subplot(2,2,3);     plot(freqvec,abs(GF));   title('\bf{Green Function}');      xlabel('Frequencies (Hz)'); ylabel('Amplitude ');
xlim([0 fmax/2])
subplot(2,2,4);      plot(tvec,real(WF));    title('\bf{Wafefield}');       xlabel('Time(sec)');  ylabel('Amplitude')