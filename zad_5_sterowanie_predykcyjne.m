%close all;
clear all;

t = 1:1:2000;
z = (randn(size(t)))/100; % zak³ócenie
a = 0.5;
b = 1.5;
u = ones(size(t)); %wejœcie
y = zeros(size(t));%wyjœcie

for i=2:length(t)
    y(i) = a*y(i-1) + b*u(i) + z(i); %kolejne wyjœcia w czasie
end

figure(1);
plot(t,y);

%----------------------------------------------------------------------------
P = 1000*eye(2,2); %Macierz jednostkowa przemno¿óna przez spor¹ sta³¹, warunek pocz¹tkowy
theta = [0;0]; % Wektor [a,b]
tmp = 0;% wartoœæ Y_(i-1)
y_wy = [];
u2 = rand(size(t)); %Generowa8nie szumu na 2 wejœcie
z2 = randn((size(t))); %Generwowanie szumu zak³ócaj¹cego

for i = 1:length(t)
    V = a*tmp + b*u2(i);% wyjœcie obiektu bez zak³óceñ
    Y = V + z2(i); %wyjœcie
    phi=[tmp;u2(i)]; %wektor phi
    P_ = P; %P_(i-1)
    P = (P_ - (P_*(phi*phi')*P_)/(1+(phi'*P_*phi))); % macierz kowariancji
    theta = theta + P*phi*(Y-(phi'*theta)); % wektor [a,b]
    tmp = Y; %aktualna wartoœæ jest wartoœci¹ Y_(i-1) w kolejnej iteracji
    y_wy = [y_wy, theta(2)]; 
end

hold on;
figure(2);
y_wy(size(t)) = y_wy(end);
plot(t,y_wy);
hold on;