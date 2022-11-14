clear all;


a=1;
k=8;
s1 = -1;
s2 = -2;
s3 = -3;

roots = [s1, s2, s3];

Ko = tf(a, poly(roots));

Kr = tf(k);

Kotw = Ko * Kr;



%e = step(K);

%Q = c*sum(e.^2);

figure(1)



