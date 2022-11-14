clear all;
close all;
%Czesc 1
t=1:1:2000;
z=(randn(size(t)))/100;
a = 0.5;
b = 1.5;
u = ones(size(t));
y=zeros(size(t));
for i = 2:length(t)
    y(i) = a*y(i-1) + b*u(i) + z(i);
end
figure(1);
plot(t,y);
%Czesc druga
P=1000*eye(2,2); %Warunek poczatkowy
theta=[0;0]; %Wektor u, y
tmp=0;
y_wy = [];
a = [];
%b = [];
u2 = rand(size(t)); %Generowanie szumu na wejscie
z2 = randn((size(t))); %Generowanie szumu zaklocajacego
for i = 1:length(t)   
   Vec=a*tmp+b*u2(i); 
   Y=Vec+z2(i);
   phi=[tmp;u2(i)];
   P_poprzednie = P;
   P=(P_poprzednie-((P_poprzednie*(phi*phi')*P_poprzednie)/(1+(phi'*P_poprzednie*phi))));
   theta=theta+P*phi*(Y-(phi'*theta));
   tmp = Y;
   y_wy = [y_wy, theta(2)]; %Theta(2) to wyjscie
   %a = [a,theta(1)];
   %b = [b,theta(2)];
end
hold on;
figure(2);
y_wy(size(t)) = y_wy(end);
plot(t,y_wy);

