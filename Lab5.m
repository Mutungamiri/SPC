clear all;
close all;
%*******************
% odpowied? skokowa
%*******************
a = 0.3;
b = 0.8;
n = 1 : 1 : 1000;
z = (randn(size(n)))/100;
u = ones(size(n));
y = zeros(size(n));

for i = 2:length(n)
    y(i) = a*y(i-1) + b*u(i) + z(i);
end
 figure(1);
 hold on; grid on;
 for i=1:200
     plot(n,y(n));
 end
%***************************
% Estymacja parametr?w a i b
%***************************
P = 1000*eye(2,2); %Macierz jednostkowa przemno??na przez spor? sta??, warunek pocz?tkowy
theta = [0;0]; % Wektor [a,b]
tmp = 0;% warto?? Y_(i-1)
y_wy = [];
u2 = rand(size(n)); %Generowa8nie szumu na 2 wej?cie
z2 = randn((size(n))); %Generwowanie szumu zak??caj?cego

for i = 1:length(n)
    V = a*tmp + b*u2(i);% wyj?cie obiektu bez zak??ce?
    Y = V + z2(i); %wyj?cie
    phi=[tmp;u2(i)]; %wektor phi
    P_ = P; %P_(i-1)
    P = (P_ - (P_*(phi*phi')*P_)/(1+(phi'*P_*phi))); % macierz kowariancji
    theta = theta + P*phi*(Y-(phi'*theta)); % wektor [a,b]
    tmp = Y; %aktualna warto?? jest warto?ci? Y_(i-1) w kolejnej iteracji
    y_wy = [y_wy, theta(1)]; 
end

figure(2);
y_wy(size(n)) = y_wy(end);
plot(n,y_wy);
hold on;
plot(n,b);
yline(0.3);
xlabel('k');
ylabel('a');
hold off;
grid on;

 
 
 