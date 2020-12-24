[in_t, fs] = audioread ('./Test_music.wav');
smps = length(in_t);
% fft the input audio 
in_f = fft(in_t, smps);
in_f = fftshift(in_f);
% in_f = fftshift(in_f);
f = ((1:length(in_f))-(length(in_f) / 2))/(length(in_f) / 2)*pi;


% plot the input audio's frequency
figure(5);
subplot(2,1,1);
plot(f, abs(in_f), '.-.');
title("The abs of the audio\'s frequency");
subplot(2,1,2);
plot(f, angle(in_f), '.');
title("The angle of the audio\'s frequency");


% compute the white noise
in_f = fftshift(in_f);
check_f = abs(in_f(1:ceil(length(in_f)/2)));
[max_v, max_i] = max(check_f)
freq_white = 2 * pi * max_i / smps / (1/fs) / 2 / pi;
sprintf("the original frequency of the audio\'s white noise: %f Hz\n", freq_white)

smps = 10000;
% fft the input audio 
in_f = fft(in_t, smps);
% in_f = fftshift(in_f);
f = ((1:length(in_f))-(length(in_f) / 2))/(length(in_f) / 2)*pi;

% plot the input audio's frequency after down sampling 
in_f = fftshift(in_f);
figure(6);
subplot(2,1,1);
plot(f, abs(in_f), '.-.');
title("The abs of the audio\'s frequency: down sampling");
subplot(2,1,2);
plot(f, angle(in_f), '.-.');
title("The angle of the audio\'s frequency: down sampling");

f_bands = [6.7, 7.1, 7.6, 8] * 1e3;
a = [1, 0, 1];
dev = [0.02, 0.1, 0.02]; 
fs = fs;
[N, Wn, beta, ftype] = kaiserord(f_bands, a, dev, fs);

win = kaiser(N+1, beta);
fcoeff = fir1(N, Wn, ftype, win);

figure(7);
stem(fcoeff);
title("Bandpass Filter: unit impulse response")

figure(8) 
freqz(fcoeff, 1);
subplot(2,1,1)
title(sprintf('n = %d order Bandpass Filter: amplitude-frequency response',N))
subplot(2,1,2)
title(sprintf('n = %d order Bandpass Filter: phase-frequency response',N))

figure(9)
out_t = conv(in_t, fcoeff);
out_f = fft(out_t, length(out_t));
out_f = fftshift(out_f);
% out_f = fftshift(out_f);

% plot the output audio's frequency
f = ((1:length(out_f))-(length(out_f) / 2))/(length(out_f) / 2)*pi;
subplot(2,1,1);
plot(f, abs(out_f), '.-.');
title("The abs of the processed audio\'s frequency");
subplot(2,1,2);
plot(f, angle(out_f), '.-.');
title("The angle of the processedaudio\'s frequency");

figure(10)
smps = 10000;
% fft the input audio 
out_f = fft(out_t, smps);
out_f = fftshift(out_f);
% in_f = fftshift(in_f);
f = ((1:length(out_f))-(length(out_f) / 2))/(length(out_f) / 2)*pi;

subplot(2,1,1);
plot(f, abs(out_f), '.-.');
title("The abs of the processed audio\'s frequency: down sampling");
subplot(2,1,2);
plot(f, angle(out_f), '.-.');
title("The angle of the processed audio\'s frequency: down sampling");


input('Press Enter to Save Figures and Continue...');
saveas(5, './l3p5.png');
saveas(6, './l3p6.png');
saveas(7, './l3p7.png');
saveas(8, './l3p8.png');
saveas(9, './l3p9.png');
saveas(10, './l3p10.png');

close all;