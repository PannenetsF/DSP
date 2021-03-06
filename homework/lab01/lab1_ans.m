[in_t, fs] = audioread ('./Test_music.wav');
b_m= [-0.0024, -0.0042, 0.0095, 0.02, -0.038, -0.0696, 0.1374, 0.4472, 0.4472, 0.1374, -0.0696, -0.038, 0.02, 0.0095, -0.0042, -0.0024];
in_t = in_t(:);
b_m = b_m(:);
prt = 1

t=input("please input mode: 1) diff 2)conv 3)DFT\n");
N = length(in_t) + length(b_m) - 1;

if (t==1)
  func_comp = @(x, h) diff_wave(x, h, 1:N);
elseif (t==2)
  func_comp = @(x, h) conv(x, h);
endif

if (t == 2 && prt == 1)
    figure(6);
    stem(b_m);
    title("The time zone waveform of h");
    saveas(6, './l1s1p6.png');    
endif

if (t == 3)
  [H, W] = freqz(b_m, 1, [0:2*pi/400:2*pi]);
  H_abs=abs(H);
  H_ang=angle(H);
  in_fft = fft(in_t, N);
  h_fft = fft(b_m, N);
  out_fft = in_fft .* h_fft;
  in_fft = fftshift(in_fft);
  h_fft = fftshift(h_fft);
  out_t = ifft(out_fft);
  out_fft = fftshift(out_fft);
  w = 0:2*pi/(N-1):2*pi;
  if (prt == 1) 
    figure(3);
    subplot(2,1,1)
    stem(H_abs)
    title("The frequency response of abs(H)");
    subplot(2,1,2)
    stem(H_ang)
    title("The frequency response of angle(H)");
    figure(4);
    stem(abs(in_fft));
    title("The frequency domain waveform of INPUT");
    figure(5);
    stem(abs(out_fft));
    title('The frequency domain waveform of OUTPUT');

    saveas(3,'./l1s1p3.png');
    saveas(4,'./l1s1p4.png');
    saveas(5,'./l1s1p5.png');
  endif
else
  out_t = func_comp(in_t, b_m);
endif

if (prt == 1)
  figure(1);
  stem(in_t);
  title('The time domain waveform of INPUT');
  figure(2);
  stem(out_t);
  title('The time domain waveform of OUTPUT');
  saveas(1,'./l1s1p1.png');
  saveas(2,'./l1s1p2.png');
endif


input("Enter to Play origin wave...\n")
if (prt == 1) 
  close all force;
endif

player_ori = audioplayer(in_t, fs);
play(player_ori)

input("Enter to Play processed wave...\n")
player_prc = audioplayer(out_t, fs);
play(player_prc)

input("Enter to Continue...")
