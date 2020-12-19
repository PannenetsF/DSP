L = 32;
N = [32 64 128 256 512];

figure(4);
for i = 1:length(N)
  subplot(length(N), 1, i);
  % figure(i);
  win_name = sprintf('hamming window and DFT with %d points', L);

  % build the series
  n = 0:(5/L):5;
  n = n(1:length(n)-1);
  x = sin(3 * pi * n / 10) + 0.5 * sin(2 * pi * n / 5);
  
  % choose the window
  win = hamming(L);
  % add the window to the signal 
  y = x .* win;
  
  % do fft and show it
  Y = fft(y, N(i));
  plot(abs(Y), '.');
  title(win_name);
endfor

input('Press Enter to Continue...');
saveas(4,'./l3p4.png');
close all;
