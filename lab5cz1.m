close all;
clear all;
%czasy do modelowania wykresu
t=100;
t2=50;
t3=200;
a=[];
b=[];
P=[10,0;0,10]
y_prev=0;
u=1;
szac=[0;0];
%to zmieniasz w zaleznosci co chcesz policzyc najlepiej w zakresie 0-1
a1=0.4;
%a2=0.3;
b1=100;
%b2=0.2;
par=[a1;b1];
for k=1:1:t
        a1=a1;
        b1=b1;
        par=[a1;b1];
    %if k >= t3
     %   a2=a2;
      %  b2=b2;
       % par=[a2;b2];
    %end
    z=rand*0.005;
    %u=rand;
    u=(1/b1)*(1-a1-z);
    x=[y_prev;u];
    y=x'*par-z;
    szac=szac+P*x*(y-szac'*x);
    a=[a;szac(1)];
    b=[b;szac(2)];
    P=P-(P*x*x'*P)/(1+x'*P*x);
    y_prev=y;
    %zadanie 3
   figure(3);
    title y;
   hold on;
   grid on;
    plot(k,y,'*');
    
end
for f=1:t2:t3
    %wyswietlanie tych gwiazdek
    figure(1)
    hold on;
    grid on;
    plot(f,a1,'*');
    figure(2);
    hold on;
    grid on;
    plot(f,b1,'*');  
    
end
 for f=t3:t2:t
     %wyswietlanie tych gwiazdek 2 razy bo jak podzielisz potem te wykresy
     %to nnie dzia³a³o inaczej wiec zrobi³em 2 petle
    figure(1)
    hold on;
    grid on;
    plot(f,a2,'*');
    figure(2);
    hold on;
    grid on;
    plot(f,b2,'*');  
 
 end

figure(1)
title Parametr-a;
hold on;
grid on;
plot(a);

figure(2);
title Parametr-b;
hold on;
grid on;
plot(b);



