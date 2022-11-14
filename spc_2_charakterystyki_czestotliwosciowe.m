clear all; close all; clc;

%ustalam omegê
omega = 2;  

%obiekt inercyjny 2. rzêdu
sys=tf(1,poly([-1,-.5]))
%denominator equivalent to: [1,1.5,.5]  =   x^2 + 1.5x + 0.5

t=1:0.1:30;
%t=1:200;
u=sin(omega*t);
figure(1);
subplot(1,2,1); lsim(sys,u,t); title("y(t)"); legend("y(t) dla u(t)=2*omega*t");  %symulacja odpowiedzi systemu dla zadanego pobudzenia w wybraym odcinku czasu
subplot(1,2,2); nyquist(sys);

w=-.165 + j*(-.144);    %dla systemu tf(1,poly([-1,-.5]))
my_sim=abs(w)*sin(omega*t+angle(w));
figure(2);
plot(t,my_sim); title("y_{ust}(t)")%to jest g³ówna sk³adowa odpowiedzi obiektu na zadane pobudzenie;

%ró¿nica poka¿e mi charakter pozosta³ych sk³adowych odpowiedzi
figure(3);
subplot(2,1,1); plot(t,(lsim(sys,u,t)-my_sim)); title("p(t)");


subplot(2,1,2); hold on; grid on;
plot(t,lsim(sys,u,t)); 
plot(t,my_sim);
title("y(t) oraz y_{ust}(t)"); legend("y(t)","y_{ust}(t)")
hold off;


figure(4);
sys_p=tf(1,[1,0,4])
lsim(sys_p,u,t);


