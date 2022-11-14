clear all;
close all;



a=-0.5;
b=1.1;
Z=0.2*randn;

%t=1:1:20;
P=zeros(2,2,1000);
phi=zeros(2,1);
%phit=zeros(1,2);
teta=zeros(2,1000);
y=zeros(1,1000);
y(1)=0;
P(:,:,1)=[100,0;0,100];
u=rand(1,1000);%*sin(1000);
%LAMBDA = 0.5;
for LAMBDA = 0.5
    
a=0.3;
b=0.8;

for k = 2 : 1 : 1000
 l = k-1;
 y(k) = a*y(l)+b*u(k)+0.1*sin(k); %% TUTAJ DODAJE ZAK£ÓCENIA samo Z albo ten sinus

 phi = [u(k); y(l)];
phit = transpose(phi);


 P(:,:,k) = (P(:,:,l) - ((P(:,:,l)*phi*phit*P(:,:,l))/(LAMBDA+phit*P(:,:,l)*phi)))/LAMBDA;
 teta(:,k) = teta(:,l) + P(:,:,k)*phi*(y(k)-phit*teta(:,l));
 
if(k == 250) 
    a=a+0.7;
    b=b+0.5;
    
end
    
%     if(k == 300) 
%     a=a+0.5;
%     b=b+0.5;
%     end
%     if(k == 500) 
%     a=a-1;
%     b=b-1;
% end
%     
end

figure(1);
k = 1:1:1000;
hold on;
plot(k,teta(1,k),'r');
grid on;
%
hold on;

figure(2);
k = 1:1:1000;
hold on;
plot(k,teta(2,k),'r');
grid on;
hold on;

%legend('0.95','0.96','0.97','0.98','0.99');
%legend('0.55');%,'0.62','0.69','0.76','0.83');
end
figure(1);
hold on;
plot(k-1,b*ones(size(k+2)),"m");

figure(2);
hold on;
plot(k-1,a*ones(size(k+2)),"m");
hold on;
%%%%%%%%%%% BEZ LAMBDY %%%%%%%%%%%%%%%%%
% a=-0.5;
% b=1.1;
% for k = 2 : 1 : 200
%  l = k-1;
%  y(k) = a*y(l)+b*u(k);
% 
%  phi = [u(k); y(l)];
% phit = transpose(phi);
% 
% 
%  P(:,:,k) = (P(:,:,l) - ((P(:,:,l)*phi*phit*P(:,:,l))/(1+phit*P(:,:,l)*phi)));
%  teta(:,k) = teta(:,l) + P(:,:,k)*phi*(y(k)-phit*teta(:,l));
%  
% if(k == 100) 
%     a=a+0.5;
%     b=b+0.5;
% end
%     
% end
% figure(1);
% k = 1:1:200;
% hold on;
% plot(k,teta(1,k));
% hold on;
% 
% figure(2);
% k = 1:1:200;
% hold on;
% plot(k,teta(2,k));
% hold on;