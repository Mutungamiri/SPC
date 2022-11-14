clear all; clc; clf;
%a = .6; a2 = .9;
a = .6; a2 = .6;
b = .5; b2 = 1;
n = 1 : 1 : 10000;
u = 1; z = rand(); 
y = zeros(size(n));
theta = [b; a]; theta_= [0; 0];
phi   = [u(1); y(1)];
Pk = [1000, 0; 0, 1000];
a_mat = zeros(size(n)); b_mat = zeros(size(n));
lambda = 1; % zbadaæ wp³yw na dzialanie algorytmu

for k = 2 : length(n)
  if k < 100
  phi = [u; y(k-1)];
  y(k) = a * y(k-1) + b * u + z;
  Pk = (Pk - (Pk * phi * (phi)' * Pk)/(lambda + phi' * Pk * phi)) * 1 / lambda;
  theta_ = theta_ + Pk * phi * (y(k) - phi' * theta_);
  a_mat(k) = theta_(2);
  b_mat(k) = theta_(1);
  u = rand();
  z = mod(randn(),0.1);
  end
  if k >= 100
  phi = [u; y(k-1)];
  y(k) = a2 * y(k-1) + b2 * u + z;
  Pk = (Pk - (Pk * phi * (phi)' * Pk)/(lambda + phi' * Pk * phi)) * 1 / lambda;
  theta_ = theta_ + Pk * phi * (y(k) - phi' * theta_);
  a_mat(k) = theta_(2);
  b_mat(k) = theta_(1);
  u = rand();
  z = mod(randn(),0.1);
  end
end
%{
figure(1);
hold on; 
grid on;
subplot(3,1,1)
plot(n, y(n));
xlabel('k'); ylabel('y(k)');
title('Step response');
%}

figure(2);
%subplot(3,1,2)
plot(n,a_mat)
hold on;
asd = 1:length(n);
asd(1:100) = a;
asd(100:length(n)) = a2;
plot(n, asd', 'r--')
%plot(n, a, 'r--')
%plot(n, a2, 'r--')
xlabel('k'); ylabel('$\hat{a}, a$', 'Interpreter', 'latex');
legend = legend('a','$\hat{a}$', 'Location', 'southeast');
set(legend, 'Interpreter', 'latex');

figure(3);
%subplot(3,1,3)
plot(n,b_mat)
hold on;
asd = 1:length(n);
asd(1:100) = b;
asd(100:length(n)) = b2;
plot(n, asd', 'r--')
%plot(n, b, 'r--')
xlabel('k'); ylabel('$\hat{b}, b$', 'Interpreter', 'latex');


%{
  cel cw 6: y_n bliskie wartoœci alpha (jakieœ)
  ^Y_n=^a_n*y_n-1+^b_n-1
  alpha=^a_n*y_n-1+^b_n-1
  u_n = (1/^b_n)*(alpha-^a_n*y_n-1)
  alpha = sta³a 
      lub 
  alpha = sin
%}