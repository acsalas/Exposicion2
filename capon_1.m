clc; clear all; close all;
N = 19;
lambda = 20;
k = 2*pi/lambda; %wavenumber
d = 10; %separacion de sensores en metros
c = 3E8; %cte vel luz en m/s

eps = 0.00001;
n = 0:N-1;
dol = 0.5; %revisar este parametro

nfft = 256;
Beta = 45; %direccion del arreglo
Betar = Beta*pi/180;
cosBeta = cos(Betar);

%formacion del steering vector en la direccion Beta
a0 = exp(1i* n *k* d * cosBeta);

%graficacion del espectro del arreglo

arg = (-nfft/2:(nfft/2)-1) ./ (nfft*dol);
idx = find(abs(arg) <= 1);
cosbeta = arg(idx);
betar = asin(cosbeta);

% convert angle into degrees
beta = betar .* (180.0 / pi);
% Compute fft of w (radiation pattern)
patternv = (abs(fftshift(fft(a0,nfft)))).^2;
% convert radiation pattern to dBs
patternr = 10*log10(patternv(idx) ./N + eps);
% Compute directive gain pattern
rbarr = 0.5 *sum(patternv(idx)) ./ (nfft * dol);
patterng = 10*log10(patternv(idx) + eps) - 10*log10(rbarr + eps);

figure(1)
plot(beta, patterng,'linewidth',1.5)

figure(2)

polar(betar,patternv)
title ('Array pattern')


%generar el vector de pesos w (tambien de dimension N)
w = zeros(1,N);
w(1) = 1;  
%w = exp(1i* n );

%generar señal s
wd = 2*pi*c/lambda;
t = 0:.001:1;
s = exp(1i*wd*t);

%generar ruido
N0 = .01; %varianza
Noise = randn(N, length(t))*N0;

x = a0'*s+Noise;

y = w*x;
%grafica señal
figure(3)

plot(t,y);

%algoritmo de Capon
R = x*x';
R_inv = inv(R);

w_opt = R_inv*a0'/(conj(a0)*R_inv*a0');
y_opt = w_opt'*x;

%grafica señal
figure(4)

plot(t,y_opt);

%coeficientes optimos segun Capon

% Compute fft of w (radiation pattern)
patternvopt = (abs(fftshift(fft(conj(w_opt)'.*a0,nfft)))).^2;
% convert radiation pattern to dBs
patternropt = 10*log10(patternvopt(idx) ./N + eps);
% Compute directive gain pattern
rbarr = 0.5 *sum(patternvopt(idx)) ./ (nfft * dol);
patterngopt = 10*log10(patternvopt(idx) + eps) - 10*log10(rbarr + eps);

figure(5)
plot(beta, patterng,'linewidth',1.5)
hold on
plot (beta, patterngopt,'g');
hold off

figure(6)

polar(betar,patternv)
hold on
polar(betar,patternvopt,'g')
hold off
title ('Array pattern')

