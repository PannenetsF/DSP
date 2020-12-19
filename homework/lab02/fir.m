f_bands = [1.2, 1.8, 3.6, 4.2] * 1e3;
a = [0, 1, 0];
dev = [0.02, 0.1, 0.02]; 
fs = 12e3;
[N, Wn, beta, ftype] = kaiserord(f_bands, a, dev, fs);

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