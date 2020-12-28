w = -pi:0.01:pi;
hw = (1 + e.^(-j*w))./(1 - e.^(-j*w));
W = -10000:10000;
W = w+0.1;
HW = 1/j./W;
subplot(2,2,1);
plot(w,abs(hw),'.-.');
title('|H(ejw)|');
subplot(2,2,2);
plot(w,angle(hw),'.-.');
title('angle of H(ejw)');
subplot(2,2,3);
plot(W,abs(HW),'.-.');
title('|H(jW)|');
subplot(2,2,4);
plot(W,angle(HW),'.-.');
title('angle og H(jW)');
saveas(1, '../figure/1607.png')
input('');

