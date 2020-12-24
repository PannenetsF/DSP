L = 32;
N = [32 64 128 256 512];

figure(4);
for i = 1:length(N)
  subplot(length(N), 1, i);
  % figure(i);
  win_name = sprintf('hamming window and DFT with %d points', N(i));

  % build the series
  n = 0:L-1;
  x =  3 * sin((pi * n)/3) + 4 * sin((pi * n)/5) + 5 * sin((pi * n)/8);
  
  % choose the window
  win = hamming(L);
  win = [win', zeros(1, length(n) - length(win))];
  % add the window to the signal 
  y = x .* win;
  
  % do fft and show it
  Y = fft(y, N(i));
  Y = fftshift(Y);
  w = (0:N(i)-1).*(2*pi/N(i));
  stem(w,abs(Y),'.-');
  title(win_name);
endfor

input('Press Enter to Continue...');
saveas(4,'./l3p4.png');
close all;
