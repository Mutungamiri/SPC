function plotingFunction(nr, Ks, someBool)
if someBool == 1
  figure(nr);
  display(Ks);
  
  subplot(2,3,1);
  for i = [1,2,3]
    hold on;
    pzmap(Ks(i,:));    
  end
  %pzmap(Ks)
  subplot(2,3,2);
  %step(Ks);
  for i = [1,2,3]
    hold on;
    step(Ks(i,:));    
  end
  subplot(2,3,3);
  %impulse(Ks);
  for i = [1,2,3]
    hold on;
    impulse(Ks(i,:));    
  end    
  subplot(2,3,4);
  %nyquist(Ks)
  for i = [1,2,3]
    hold on;
    nyquist(Ks(i,:));
    grid;
  end
  subplot(2,3,5:6);
  %bode(Ks);
  for i = [1,2,3]
    hold on;
    bode(Ks(i,:));
    grid;
  end
end
end