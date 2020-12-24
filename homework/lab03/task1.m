L = [32 64 128];
rec = 1;
ham = 2;
win_type = [rec, ham];
N = 256;

for len = 1:length(L)
  l_now = L(len);
  figure(len);
  for wt = 1:length(win_type)
    w_now = win_type(wt);
    
    % build the series
    n = 0:(l_now/N):l_now;
    n = n(1:length(n)-1);
    x = sin(3 * pi * n / 10) + 0.5 * sin(2 * pi * n / 5);
    
    % choose the window
    if w_now == rec
      win = rectwin(l_now);
      win_name = sprintf('rectangle window of %d', l_now);
     else
      win = hamming(l_now);
      win_name = sprintf('hamming window of %d', l_now);
    endif
    win = [win', zeros(1, length(n) - length(win))];
    % add the window to the signal 
    y = x .* win;
    
    % do fft and show it
    Y = fft(y, l_now);
    Y = fftshift(Y);
    subplot(2,1,wt);
    stem(abs(Y), '.');
    title(win_name);
  endfor
endfor

input('Press Enter to Continue...');
saveas(1,'./l3p1.png');
saveas(2,'./l3p2.png');
saveas(3,'./l3p3.png');
close all;
