%przedyskutowaæ w³asnoœci systemu K(s) w funkcji parametrów a, b, c, d, e,
%oraz w zale¿noœci od po³o¿enia begunów i zer K(s)

clear all; close all; clc;
%{
%cz³on inercyjny
T=[.5,1,2,4];
k=[.25,.5,1,3,5];
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    figure(1);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. T=" + T(i) + ", k=" + k(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on inercyjny - everything on 1 figure
%wersja finalna
T=[1,1,2,4];
k=[.25,.5,1,1];
figure (1);


subplot(1,3,1); hold on;
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    pzmap(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    step(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    impulse(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;
%}

%{
%cz³on inercyjny - BODE & NYQUIST
T=[1,1,2,4];
k=[.25,.5,1,1];
figure (1);


subplot(1,3,1); hold on;
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    pzmap(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    bode(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[k(i)];
    den=[T(i),1];
    G=tf(num,den);
    
    nyquist(G);
    legend( ...
    "T=" + T(1) + ", k=" + k(1), ...
    "T=" + T(2) + ", k=" + k(2), ...
    "T=" + T(3) + ", k=" + k(3), ...
    "T=" + T(4) + ", k=" + k(4) ...
    );
end
hold off;
%}









%{
%cz³on ca³kuj¹cy
Ti=[1,2,4,10]
for i=1:4
    num=[1];
    den=[Ti(i),0];
    G=tf(num,den)
    
    figure(2);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. Ti=" + Ti(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on calkujacy - FINAL
%OR BODE & NYQUIST
Ti=[1,2,4,10]
figure (2);


subplot(1,3,1); hold on;
for i=1:4
    num=[1];
    den=[Ti(i),0];
    G=tf(num,den)
    
    pzmap(G);
    legend( ...
    "Ti=" + Ti(1), ...
    "Ti=" + Ti(2), ...
    "Ti=" + Ti(3), ...
    "Ti=" + Ti(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[1];
    den=[Ti(i),0];
    G=tf(num,den)
    
    %step(G);
    bode(G)
    legend( ...
    "Ti=" + Ti(1), ...
    "Ti=" + Ti(2), ...
    "Ti=" + Ti(3), ...
    "Ti=" + Ti(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[1];
    den=[Ti(i),0];
    G=tf(num,den)
    
   % impulse(G);
    nyquist(G)
    legend( ...
    "Ti=" + Ti(1), ...
    "Ti=" + Ti(2), ...
    "Ti=" + Ti(3), ...
    "Ti=" + Ti(4) ...
    );
end
hold off;
%}




%{
%cz³on oscylacyjny
k=[0.25,0.5,1,2];
Tn=[,0.5,1,2,4];
ksi=[0,.25,.5,2];
for i=1:4
    num=[k(i)];
    den=[Tn(i)*Tn(i),2*ksi(i)*Tn(i),1];
    G=tf(num,den)
    
    figure(3);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. k=" + k(i) + ", Tn=" + Tn(i) + ", ksi=" + ksi(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on oscylacyjny - FINAL
k=[1,1,1,1];
Tn=[0.5,0.5,4,4];
ksi=[0.1,.7,1,2];
figure (1);


subplot(1,3,1); hold on;
for i=1:4
    num=[k(i)];
    den=[Tn(i)*Tn(i),2*ksi(i)*Tn(i),1];
    G=tf(num,den)
    
    pzmap(G);
    legend( ...
    "k=" + k(1) + ", Tn=" + Tn(1) + ", ksi=" + ksi(1), ...
    "k=" + k(2) + ", Tn=" + Tn(2) + ", ksi=" + ksi(2), ...
    "k=" + k(3) + ", Tn=" + Tn(3) + ", ksi=" + ksi(3), ...
    "k=" + k(4) + ", Tn=" + Tn(4) + ", ksi=" + ksi(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[k(i)];
    den=[Tn(i)*Tn(i),2*ksi(i)*Tn(i),1];
    G=tf(num,den)
    
    %step(G);
    bode(G)
    legend( ...
    "k=" + k(1) + ", Tn=" + Tn(1) + ", ksi=" + ksi(1), ...
    "k=" + k(2) + ", Tn=" + Tn(2) + ", ksi=" + ksi(2), ...
    "k=" + k(3) + ", Tn=" + Tn(3) + ", ksi=" + ksi(3), ...
    "k=" + k(4) + ", Tn=" + Tn(4) + ", ksi=" + ksi(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[k(i)];
    den=[Tn(i)*Tn(i),2*ksi(i)*Tn(i),1];
    G=tf(num,den)
    
    %impulse(G);
    nyquist(G)
    legend( ...
    "k=" + k(1) + ", Tn=" + Tn(1) + ", ksi=" + ksi(1), ...
    "k=" + k(2) + ", Tn=" + Tn(2) + ", ksi=" + ksi(2), ...
    "k=" + k(3) + ", Tn=" + Tn(3) + ", ksi=" + ksi(3), ...
    "k=" + k(4) + ", Tn=" + Tn(4) + ", ksi=" + ksi(4) ...
    );
end
hold off;
%}

%{
%cz³on proporcjonalny
k=[0.25,0.5,1,2];
for i=1:4
    num=[k(i)];
    den=[1];
    G=tf(num,den)
    
    figure(4);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. k=" + k(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on ró¿niczkuj¹cy z inercj¹ (rzeczywisty)
k=[0.25,0.5,1,2];
T=[.5,1,2,4];
for i=1:4
    num=[k(i),0];
    den=[T(i),1];
    G=tf(num,den)
    
    figure(3);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. k=" + k(i) + ", T=" + T(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on rozniczkujacy - FINAL
k=[0.25,0.5,1,2];
T=[.5,1,2,4];
figure (1);


subplot(1,3,1); hold on;
for i=1:4
    num=[k(i),0];
    den=[T(i),1];
    G=tf(num,den)
    
    pzmap(G);
    legend( ...
    "k=" + k(1) + ", T=" + T(1), ...
    "k=" + k(2) + ", T=" + T(2), ...
    "k=" + k(3) + ", T=" + T(3), ...
    "k=" + k(4) + ", T=" + T(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[k(i),0];
    den=[T(i),1];
    G=tf(num,den)
    
    %step(G);
    bode(G)
    legend( ...
    "k=" + k(1) + ", T=" + T(1), ...
    "k=" + k(2) + ", T=" + T(2), ...
    "k=" + k(3) + ", T=" + T(3), ...
    "k=" + k(4) + ", T=" + T(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[k(i),0];
    den=[T(i),1];
    G=tf(num,den)
    
    %impulse(G);
    nyquist(G)
    legend( ...
    "k=" + k(1) + ", T=" + T(1), ...
    "k=" + k(2) + ", T=" + T(2), ...
    "k=" + k(3) + ", T=" + T(3), ...
    "k=" + k(4) + ", T=" + T(4) ...
    );
end
hold off;
%}

%{
%cz³on proporcjonalny
k=[0.25,0.5,1,2];
for i=1:4
    num=[k(i)];
    den=[1];
    G=tf(num,den)
    
    figure(4);
    subplot(4,3,((i-1)*3+1)); pzmap(G);
    subplot(4,3,((i-1)*3+2)); step(G); title("Step resp. k=" + k(i));
    subplot(4,3,((i-1)*3+3)); impulse(G);
end
%}

%{
%cz³on proporcjonalny - FINAL
k=[0.25,0.5,1,2];
figure (1);


subplot(1,3,1); hold on;
for i=1:4
    num=[k(i)];
    den=[1];
    G=tf(num,den)
    
    pzmap(G);
    legend( ...
    "k=" + k(1), ...
    "k=" + k(2), ...
    "k=" + k(3), ...
    "k=" + k(4) ...
    );
end
hold off;


subplot(1,3,2); hold on; 
for i=1:4
    num=[k(i)];
    den=[1];
    G=tf(num,den)
    
    %step(G);
    bode(G)
    legend( ...
    "k=" + k(1), ...
    "k=" + k(2), ...
    "k=" + k(3), ...
    "k=" + k(4) ...
    );
end
hold off;


subplot(1,3,3); hold on; 
for i=1:4
    num=[k(i)];
    den=[1];
    G=tf(num,den)
    
    %impulse(G);
    nyquist(G)
    legend( ...
    "k=" + k(1), ...
    "k=" + k(2), ...
    "k=" + k(3), ...
    "k=" + k(4) ...
    );
end
hold off;
%}














%{
num=[1, 5];
den=[1,2,3,4,5];
G=tf(num,den)

step(G);
impulse(G);
poly(G)
%}