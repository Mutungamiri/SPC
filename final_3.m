
for k=1:150
    Q(k) = q(k);
end

x = 1:k;

plot(x,Q);

%y = fminsearch(Q,x);