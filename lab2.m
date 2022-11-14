% chirp do sprawdzenia
%         ____
% u(t) ->|K(s)| -> y(t)
%         ----
% na wejscie systemu podajemy sygnal okresowy: sin o pulsacji omega
% ile wyniesie odpowiedz systemu?
% u(t) = sin( omega * t )
% y_ust(t) = A * sin( omega * t + phi)
% K(j * omega)
% A = |K(j*omega)|
% phi = arg{K(j*omega)}
%
% ZAD 1 - system inercyjny 2. rzedu

% im wieksza czestotliwossc
% tym wieksza/mniejsza A - mo¿liwosc ukl do przyjmowania drgan

% 1) 
% * fix omega, u=sin(omega*t)
% * lsim(sys,u,t)
% * nyquist(sys) -> odczytujemy wartosc im & re albo modol i arg dla
%   zadanego omega (+czarny krzyzyk 
%                   -> podaje informacje o danym punkcie na wykresie)
%                      lub nyquist(sys,omega)
% A*sin(omega*t+phi) i rysujemy na lsim(sys,u,t) DLA ZADANEGO OMEGA
% y(t)=y_ust(t)+p(t)
% p(t) -> badamy jego charakter

% 2) charakterystyki amplitudowo fazowe i bodego podst czlonow charakt
% sprawko na wt 26.11 8:00 æw 1 i 2

clear all; hold off; clc;

sys = tf(10,poly([-1, -2]));
omega = pi;
t = 0 : .01 : 20;
u = sin(omega * t);
%u = chirp (t, 100, 20, 105);



figure(1);
subplot(3,2,1);
nyquist(sys);
hold on;
nyquist(sys, omega, '*')
[Re, Im, Phi] = nyquist(sys, omega);
display(Re); display(Im); display(Phi);
Mod = sqrt(Re^2 + Im^2);

plot(t,u);

subplot(3,2,3:4);
lsim(sys,u,t);
hold on; grid on;
lsim(sys,Mod*sin(omega * t + Phi),t,'r');
legend('y(t)','y_{ust}(t)');
subplot(3,2,2);
pzmap(sys);
subplot(3,2,5:6);
bode(sys);
grid;
%subplot(2,2,2);
%grid on;
%plot(yUst)
%* dla 3D K(s) = e^(-s*tau)/Ts+1
% nyquist w 3d z = omega 
% KK 2
% systemy zlozone polaczenia szereg, rown, sprz zwr pca
% wyznacz trans zastepcza
% zbadaj stabilnosc dowolna metoda
% strojenie regulatora