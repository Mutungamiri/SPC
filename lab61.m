clear all;
close all;
%------------------------------
%Czesc 1
%Reakcja na skok jednostkowy
%----------------------------
t=1:1:200;
z=(randn(size(t)))/100;
a = 0.4;
b = 1.2;
u = ones(size(t));
y=zeros(size(t));
for i = 2:length(t)
    y(i) = a*y(i-1) + b*u(i) + z(i);
end

%-------------------------------------------------------------------------
%Czesc druga
%Estymacja a i b
%------------------------------------------------------------------------
t=1:1:100000; %zmiana lini czasowej
z=(randn(size(t)))/100; %zak³ócenie
P=1000*eye(2,2);
theta=[0;0];
tmp=0;
y_wy = [];
a_wy = [];
b_wy = [];
u2 = rand(size(t));
z2 = (randn((size(t))))/100;
for i = 1:length(t)   
   Vec=a*tmp+b*u2(i);
   Y=Vec+z2(i);
   phi=[tmp;u2(i)];
   P_poprzednie = P;
   P=(P_poprzednie-((P_poprzednie*(phi*phi')*P_poprzednie)/(1+(phi'*P_poprzednie*phi))));
   theta=theta+P*phi*(Y-(phi'*theta));
   tmp = Y;
   y_wy = [y_wy, tmp]; %wyjœcie systemu
   a_wy = [a_wy, theta(1)]; %estymowane a
   b_wy = [b_wy, theta(2)]; %estymowane b
end

%y_wy(size(t)) = y_wy(end);
%a_wy(size(t)) = a_wy(end);
%b_wy(size(t)) = b_wy(end);

figure(2);
subplot(3,1,1);
plot(t,y_wy);
title("Wyjscie systemu");
subplot(3,1,2);
plot(t,a_wy);
title("a estymowane");
subplot(3,1,3);
plot(t,b_wy);
title("b estymowane");
%-----------------------------------------------------
%zadanie sterowania
%wejœcie i wyjœcie regulowane
%----------------------------------------------------

u3 = []; %wejœcie regulowane -> co nale¿y podaæ na wejœcie aby otrzymaæ zadane wyjœcie
for i = 1:length(t)
        u3(i) = (1/b_wy(i)) * (1 - a_wy(i));
end
y3 = zeros(size(t)); %wyjœcie estymowane
for i = 2:length(t) %od 2 bo u¿ywamy indeksu i-1
    y3(i) = a_wy(i)*y3(i-1) + b_wy(i)*u3(i) + z(i);
end
figure(3);
subplot(2,1,1);
plot(t,u3);
title('Wejscie regulowane');
subplot(2,1,2);
plot(t,y3);
title('Wyjscie regulowane');
%------------------------------------------------------
%skokowa zmiana wspó³czynnika a
%----------------------------------------------------
tmp = 0;
   y_wy2 = [];
   a_wy2 = [];
   b_wy2 = [];
for i = 1:length(t)
   if (i == 500)
       a = a + 0.1;
   end
   Vec=a*tmp+b*u2(i);
   Y=Vec+z2(i);
   phi=[tmp;u2(i)];
   P_poprzednie = P;
   P=(P_poprzednie-((P_poprzednie*(phi*phi')*P_poprzednie)/(1+(phi'*P_poprzednie*phi))));
   theta=theta+P*phi*(Y-(phi'*theta));
   tmp = Y;
   y_wy2 = [y_wy2, tmp];
   a_wy2 = [a_wy2, theta(1)];
   b_wy2 = [b_wy2, theta(2)];
end

%y_wy2(size(t)) = y_wy2(end);
%a_wy2(size(t)) = a_wy2(end);
%b_wy2(size(t)) = b_wy2(end);

figure(4);
subplot(3,1,1);
plot(t,y_wy2);
title("Wyjœcie systemu");
subplot(3,1,2);
plot(t,a_wy2);
title("A estymowane po skoku");
subplot(3,1,3);
plot(t,b_wy2);
title("B estymowane");

%-------------------------------------------------------
%Estymacja wagowa
%lampda in (0,1)
%czym mniejsza lampda tym wiêksze szumy
%-------------------------------------------------------
L = 0.95; %waga lampda
a = 0.4;
   y_wy3 = [];
   a_wy3 = [];
   b_wy3 = [];
for i = 1:length(t)
   if (i == 500)
       a = a + 0.1;
   end
   Vec=a*tmp+b*u2(i);
   Y=Vec+z2(i);
   phi=[tmp;u2(i)];
   P_poprzednie = P;
   P=(1/L * (P_poprzednie-((P_poprzednie*(phi*phi')*P_poprzednie)/(L+(phi'*P_poprzednie*phi)))));
   theta=theta+P*phi*(Y-(phi'*theta));
   tmp = Y;
   y_wy3 = [y_wy3, tmp];
   a_wy3 = [a_wy3, theta(1)];
   b_wy3 = [b_wy3, theta(2)];
end

figure(5);
subplot(3,1,1);
plot(t,y_wy3);
title("Wyjœcie systemu");
subplot(3,1,2);
plot(t,a_wy3);
title("A estymowane wagowo po skoku");
subplot(3,1,3);
plot(t,b_wy3);
title("B estymowane wagowo");

figure(6);
hold on;
plot(t,a_wy2);
plot(t,a_wy3);
title('Zale¿noœæ a po estymacji bez i z wag¹');
grid on;


figure(7);
hold on;
plot(t,b_wy2);
plot(t,b_wy3);
title('Zale¿noœæ b po estymacji bez i z wag¹');
grid on;

