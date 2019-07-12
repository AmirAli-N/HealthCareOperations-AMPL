param H;
param L;
set P_H;
set P_L;
param s_h{i in 1..H, j in P_H};
param s_l{i in 1..L, j in P_L};

var x{i in 1..H, j in P_H} binary;
var y{i in 1..L, j in P_L} binary;

maximize score: (sum{i in 1..H, j in P_H} s_h[i,j]*x[i,j])+(sum{i in 1..L, j in P_L} s_l[i,j]*y[i,j]);
subject to 1h_p{i in 1..H}: sum{j in P_H} x[i,j]=1;
subject to 1p_h{j in P_H}: sum{i in 1..H} x[i,j]<=1;
subject to 1l_p{i in 1..L}: sum{j in P_L} y[i,j]=1;
subject to 1p_l{j in P_L}: sum{i in 1..L} y[i,j]<=1;
subject to 6hl: sum{i in 1..H} x[i,6]=sum{i in 1..L} y[i,6];
subject to 4hl: sum{i in 1..H} x[i,4]=sum{i in 1..L} y[i,4];
subject to p2: sum{i in 1..L} y[i,2] <= sum{i in 1..H} x[i,2];
subject to p5: sum{i in 1..H} x[i,5] <= sum{i in 1..L} y[i,5];

