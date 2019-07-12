param D;
param A;
param P;
param W_q;
param h{i in 1..D};
param t{i in 1..D, j in 1..A};

var x{j in 1..A} binary;
var y{i in 1..D, j in 1..A} binary;

minimize response_time: sum{i in 1..D, j in 1..A} h[i]*(t[i,j]+W_q)*y[i,j];

subject to limited_resources: sum{j in 1..A} x[j]=P;
subject to x_y_relatiobship{i in 1..D, j in 1..A}: y[i,j]<=x[j];
subject to assignment{i in 1..D}: sum{j in 1..A} y[i,j]=1; 

