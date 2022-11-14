clear all;

a=1/4;
b = 1/2;
k=8;
s0 = -1/4;
s1 = -1/2;
s2 = 0;
t1 = 1;
roots = [s0];
roots2 = [s1];
roots1 = [s2];

Ko1 = tf(a, poly(roots))

Ko2 = tf(b, poly(roots2))

Kr = tf(k, poly(roots1));

Kz = c2d(Kr, t1, 'zoh');

Kotw = Ko1*Ko2*Kr;
t = 10;


%Kotw1 = Ko1*Ko2*Kz;

figure(1)
subplot(2,2,1)
step(Kotw,t)
grid on
subplot(2,2,2)
step(Kr, t)
grid on
subplot(2,2,4)
step(Kz,t)
grid on

