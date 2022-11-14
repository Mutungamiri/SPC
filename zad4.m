T1 = 2;
T2 = 3;
T3 = 4;
k=6;



L1 = [ 1 ];
M1 = [ T1 1 ];

sys1 = tf(L1,M1); %transmitancja 1 inercja

L2 = [ k ];
M2 = [ T2 0 ];

sys2 = tf(L2,M2); %transmitancja 2 ca?kowanko

L3 = [ 1 ];
M3 = [ T3 1 ];

sys3 = tf(L3,M3); %transmitancja 3 inercja

sys_temp = series(sys1,sys2);
system = series(sys_temp, sys3)


sim('symulacja');



