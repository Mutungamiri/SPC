clear all;
close all;
 
t=[0:0.15:300];
 
a=1;
b=1;
c=1;
d=-100;
s = tf('s');
T_1 = 1;
T_2 = 4;
T_3 = 39;
 
 
 
    for k = 1:50
        Ke = ((T_1*s+1)*(T_2*s+1)*(T_3*s+1))/((T_1*s+1)*(T_2*s+1)*(T_3*s+1)+k);
        e = step(Ke,t);
        q_k(k) = sum(e.^2);    
    end
 
 
figure(1);
k=40;
 Ke = ((T_1*s+1)*(T_2*s+1)*(T_3*s+1))/((T_1*s+1)*(T_2*s+1)*(T_3*s+1)+k);
e_2 = (step(Ke,t)).^2;    
%plot(t,e_2,'r');
hold on;
step(Ke,t, 'b');
k=34.4559;
Ke = ((T_1*s+1)*(T_2*s+1)*(T_3*s+1))/((T_1*s+1)*(T_2*s+1)*(T_3*s+1)+k);
step(Ke,t, 'r');
xlabel('T(czas)');
ylabel('E(t)');
hold on;
grid on;
 
figure(2);
k=[1:1:50];
plot(k,q_k(k), 'g');
xMin=14.02;
hold on;
grid on;
 
figure(3);
k=40;
Ke = ((T_1*s+1)*(T_2*s+1)*(T_3*s+1))/((T_1*s+1)*(T_2*s+1)*(T_3*s+1)+k);
e_2 = (step(Ke,t)).^2;  
plot(t,e_2,'b');
k=34.4559;
hold on;
grid on;
Ke = ((T_1*s+1)*(T_2*s+1)*(T_3*s+1))/((T_1*s+1)*(T_2*s+1)*(T_3*s+1)+k);
e_2 = (step(Ke,t)).^2;  
plot(t,e_2,'r');
xlabel('T(czas)');
ylabel('E^2(t)');
title('Kwadrat uchybu')
hold on;
grid on;