[sig,fs] = audioread('./Test_music.wav');
a = 1;
b = [-0.0024,-0.0042,0.0095,0.02,-0.038,-0.0696,0.1374,0.4472,0.4472,0.1374,-0.0696,-0.038,0.02,0.0095,-0.0042,-0.0024];
h = [-0.0024,-0.0042,0.0095,0.02,-0.038,-0.0696,0.1374,0.4472,0.4472,0.1374,-0.0696,-0.038,0.02,0.0095,-0.0042,-0.0024];

N = length(sig)+length(h)-1;
[H,w] = freqz(b,a,N,'whole');
Sig_freq = fft(sig,N);
Sig_freqshift = fftshift(Sig_freq);
H_freq = fft(h,N);
Y_freq = Sig_freq.*transpose(H_freq);
Y_freqshift = fftshift(Y_freq);
y = ifft(Y_freq);
player = audioplayer(y,fs);play(player);

figure(1);stem(abs(H));%系统函数幅频特性
figure(2);stem(angle(H));%系统函数相频特性
% figure(1)
% freqz(b,a,N,'whole');%系统函数频率特性
figure(3);stem(sig);%原始时域
figure(4);stem(abs(Sig_freqshift));%原始频域
figure(5);stem(y);%滤波后时域
figure(6);stem(abs(Y_freqshift));%滤波后频域