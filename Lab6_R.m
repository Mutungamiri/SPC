clear all;
close all;
 
% *LAB6*
%dodaæ zak³ócenia
 
a=0.3;
b=0.3;
t=1:1:1000;
P=zeros(2,2,1000);
fi=zeros(2,1);
teta=zeros(2,1000);
y=zeros(1,1000);
y(1)=0;
P(:,:,1)=[100,0;0,100];
u=rand(1,1000);
Z=0.3*randn;
lambda=0.4;
 
for k = 2 : 1 : 1000
 last = k-1;
 y(k) = a*y(last)+b*u(k)+Z;
 
 if (k>300)
     a=0.7;
 end
 
 fi = [u(k); y(last)];
 
 P(:,:,k) = (P(:,:,last) - ((P(:,:,last)*fi*fi'*P(:,:,last))/(lambda+fi'*P(:,:,last)*fi)))*lambda^-1;
 teta(:,k) = teta(:,last) + P(:,:,k)*fi*(y(k)-fi'*teta(:,last));
   
end
 
a=0.3;
b=0.3;
P2=zeros(2,2,1000);
fi=zeros(2,1);
teta2=zeros(2,1000);
y2=zeros(1,1000);
y2(1)=0;
P2(:,:,1)=[100,0;0,100];
 
for k = 2 : 1 : 1000
 last = k-1;
 y2(k) = a*y2(last)+b*u(k)+Z;
 
 if (k>300)
     a=0.7;
 end
 
 fi = [u(k); y2(last)];
 
 P2(:,:,k) = P2(:,:,last) - ((P2(:,:,last)*fi*fi'*P2(:,:,last))/(1+fi'*P2(:,:,last)*fi));
 teta2(:,k) = teta2(:,last) + P2(:,:,k)*fi*(y2(k)-fi'*teta2(:,last));
   
end
 
 
figure(1)
k = 1:1:1000
plot(k,teta(1,k), 'r');
 
hold on;
plot(k,teta2(1,k), 'g');
legend('Z parametrem lambda', 'Bez parametru lambda', 'Location','southeast');
hold off;
 
figure(2);
k = 1:1:1000
plot(k,teta(2,k), 'r');
 
hold on;
plot(k,teta2(2,k), 'g');
legend('Z parametrem lambda', 'Bez parametru lambda','Location','southeast');
hold off;