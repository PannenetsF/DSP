fs = 3.5e3;
Wp = 1.05e3 / (fs / 2);
Ws = 0.6e3 / (fs / 2);
Rp = 1;
Rs = 50;

latex_exp = "";

% (b0 + b1 z^-1 + ... bn z^-n) 
% -----------------------------
% (a0 + a1 z^-1 + ... am z^-m) 

[n,Wn_get] = buttord(Wp, Ws, Rp, Rs)
[b, a] = butter(n, Wn_get, "high");

figure(1);
freqz(b, a)
subplot(2,1,1)
title(sprintf('n = %d order Butterworth Highpass Filter: amplitude-frequency response',n))
subplot(2,1,2)
title(sprintf('n = %d order Butterworth Highpass Filter: phase-frequency response',n))

[s_exp, l_exp] = co2exp(a, b);
sprintf("n = %d order Butterworth Highpass Filter: \n %s", n,  s_exp);

latex_exp = [latex_exp, l_exp];

[n, Wp_get] = cheb1ord(Wp, Ws, Rp, Rs);
[b, a] = cheby1(n, Rp, Wp_get, "high");


figure(2);
freqz(b, a)
subplot(2,1,1)
title(sprintf('n = %d order Chebyshev I Highpass Filter: amplitude-frequency response',n))
subplot(2,1,2)
title(sprintf('n = %d order Chebyshev I Highpass Filter: phase-frequency response',n))

[s_exp, l_exp] = co2exp(a, b);
sprintf("n = %d order Chebyshev I Highpass Filter: \n %s", n,  s_exp);
latex_exp = [latex_exp, l_exp];

[n, Ws_get] = cheb2ord(Wp, Ws, Rp, Rs);
[b, a] = cheby2(n, Rs, Ws_get, "high");


figure(3);
freqz(b, a)
subplot(2,1,1)
title(sprintf('n = %d order Chebyshev II Highpass Filter: amplitude-frequency response',n))
subplot(2,1,2)
title(sprintf('n = %d order Chebyshev II Highpass Filter: phase-frequency response',n))


[s_exp, l_exp] = co2exp(a, b);
sprintf("n = %d order Chebyshev II Highpass Filter: \n %s", n,  s_exp);
latex_exp = [latex_exp, l_exp];

[n, Wp_get] = ellipord(Wp, Ws, Rp, Rs);
[b, a] = ellip(n, Rp, Rs, Wp, "high");

figure(4);
freqz(b, a)
subplot(2,1,1)
title(sprintf('n = %d order Elliptic Highpass Filter: amplitude-frequency response',n))
subplot(2,1,2)
title(sprintf('n = %d order Elliptic Highpass Filter: phase-frequency response',n))

[s_exp, l_exp] = co2exp(a, b);
sprintf("n = %d order Elliptic Highpass Filter: \n %s", n,  s_exp);
latex_exp = [latex_exp, l_exp];

input('Press Enter to Save Figures and Continue...');
saveas(1, './l2p1.png');
saveas(2, './l2p2.png');
saveas(3, './l2p3.png');
saveas(4, './l2p4.png');

latex_exp

close all;
