function demo_fft_for_AcSIR()
clc; clear all; fun; close all; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program calculates for different specturms of a given signal.
% some of the  signal options are 
% sin for sine function 
% cos for cosine function
% exp for exponential function 
% rand for random function.
% input_file ( yet to be implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s_type = answ(1);
dt=str2double(answ(2));
T=str2double(answ(3));
f=str2double(answ(4));

% synthesize the signal
N_t= round(T/dt);
tvec=(0:N_t-1)*dt;
if strcmpi(s_type,'sin')
    st=sin(2*pi*f*tvec);
elseif strcmp(s_type,'cos')
    st=cos(2*pi*f*tvec);
elseif strcmp(s_type,'exp')
    st=exp(2*pi*f*tvec);
elseif strcmp(s_type,'rand')
    st=rand(1,N_t);
elseif strcmp(s_type,'input_file')
    % Yet to be implemented
    % load('F:\ajay\source.text');
end

% plot the signal
subplot(2,2,1);  plot(tvec,st);
xlabel('Time in (sec)')
ylabel('Amplitudes')
title('Input Signal')

% Take fft of the signal
N_f = 2^nextpow2(N_t);
sf = fft(st, N_f);
F_max= 1/dt;
fvec= linspace(0,F_max/2,N_f/2 );

subplot(2,2,2);
plot(fvec, abs(sf(1:N_f/2)))
xlim([0,4*f])
xlabel('Frequency (Hz)')
ylabel('Amplitude ')
title('Amplitude spectrum of the signal')

subplot(2,2,3);
plot(fvec, angle(sf(1:N_f/2)))
% xlim([0,4*f])
xlabel('Frequency (Hz)')
ylabel('Phase ')
title('Phase spectrum of the signal')

subplot(2,2,4);
plot(fvec, log(abs(sf(1:N_f/2)).^2))
%  xlim([0,4*f])
xlabel('Frequency (Hz)')
ylabel('log Power ')
title('Log power spectrum of the signal')

    function fun()
        dlgtit = 'Input for FFT';
        pmpt = {'Type of signal :  ','Time step :  ', 'Duration of signal :  ','Frequency of signal :'};
        dfltans = {'sin','.001','1','10'};
        num_lines = 1;
        answ = inputdlg(pmpt,dlgtit,num_lines,dfltans);
    end
end