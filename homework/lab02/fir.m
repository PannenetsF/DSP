f_bands = [1.2, 1.8, 3.6, 4.2] * 1e3;
a = [0 1 0];
b = 10 .^ (-0.05 * [0.02, 0.1, 0.02]);
dev =  (1 - b) ./ (1 + b); 
% -20 log10 ((1-a)/(1+a)) = x 
% (1-a)/(1+a) = 10.^(-0.05 * x) = b 
% 1 - a = b + b * a 
% a = (1 - b) / (1 + b)
fs = 12e3;
[N, Wn, beta, ftype] = kaiserord(f_bands, a, dev, fs);

ftype

N = N + rem(N,2);
win = kaiser(N+1, beta);
fcoeff = fir1(N, Wn, ftype, win);

figure(5);
stem(fcoeff);
title("Bandpass Filter: unit impulse response")

figure(6) 
freqz(fcoeff, 1);

subplot(2,1,1)
title(sprintf('n = %d order Bandpass Filter: amplitude-frequency response',N))
subplot(2,1,2)
title(sprintf('n = %d order Bandpass Filter: phase-frequency response',N))

input('Press Enter to Save Figures and Continue...');
saveas(5, './l2p5.png');
saveas(6, './l2p6.png');
close all;