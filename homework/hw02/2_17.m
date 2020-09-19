a = -pi:0.01:pi;
b = sin(2.5*a)./sin(0.5*a);
plot(a,b);
plot(a,b);
c = sin(2.5*(a+0.5*pi))./sin(0.5*(a+0.5*pi));
d = sin(2.5*(a-0.5*pi))./sin(0.5*(a-0.5*pi));
plot(a,b+c+d);
subplot (2,1,1)
plot(a,b);
subplot (2,1,2)
plot(a,b/2+c+d);
grid
subplot (2,1,1)
grid
