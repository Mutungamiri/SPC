clear all; clc; close all; dis = 0;
%---------------------------------------------------------------------%
% Proporcjonalny                                                      %
%---------------------------------------------------------------------%
a = 1;
b = 1;
roots = -1;
p = poly(roots);
Ks = [tf([a, b], p); tf([2*a, 2*b], p); tf([3*a, 3*b], p)];
plotingFunction(1, Ks, dis);
%---------------------------------------------------------------------%
% Inercyjny                                                           %
%---------------------------------------------------------------------%
a = 0;
b = 1;
roots = -1;
p = poly(roots);
Ks = [tf([a, b], p); tf([2*a, 2*b], p); tf([3*a, 3*b], p)];
plotingFunction(2, Ks, dis);
Ks = [tf([a, b], poly(roots)); tf([2*a, 2*b], poly(roots-1)); ...
  tf([3*a, 3*b], poly(roots-2))];
plotingFunction(3, Ks, dis);
%---------------------------------------------------------------------%
% Oscylacyjny                                                         %
%---------------------------------------------------------------------%
a = 0;
b = 1;
Ks = [tf([a, 1.05*b], poly([-.1+.5i, -.1-.5i])); tf([a, 2/25*b], ...
  poly([-.1+0.1i, -.1-0.1i])); tf([a, b], poly([-.3+0.4i, -.3-0.4i]))];
dis = 1;
plotingFunction(4, Ks, dis);
dis = 0;
%---------------------------------------------------------------------%
% Calkujacy                                                           %
%---------------------------------------------------------------------%
a = 1;
b = 1;
roots = [-1, 0];
p = poly(roots);
Ks = [tf([a, b], p); 1/2*tf([a, b], p); 1/3*tf([a, b], p)];
plotingFunction(5, Ks, dis);
%---------------------------------------------------------------------%
% Rozniczkujacy                                                       %
%---------------------------------------------------------------------%
dis = 1;
a = 1;
b = 1;
c = 0;
roots = -1;
p = poly(roots);
t = 0 : .01 : 10;
%Ks = tf([a, b, c], p)
%plotingFunction(6, Ks, 0);
%figure(6);
%subplot(2,3,1);
  %pzmap(Ks)
  %subplot(2,3,2);
  %plot(step(Ks));
  %grid;
  %subplot(2,3,4);
  %nyquist(Ks)
  %subplot(2,3,5:6);
  %bode(Ks);
%---------------------------------------------------------------------%
% Opozniajacy                                                         %
%---------------------------------------------------------------------%
a = 1;
b = 0;
roots = -1;
p = poly(roots);
Ks = [tf([a, b], p); 2*tf([a, b], p); 3*tf([a, b], p)];
%plotingFunction(7, Ks, dis);