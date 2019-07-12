param D;
param A;
param M;
param b;
param h{i in 1..D};
param a{i in 1..D, j in 1..A};

var x{j in 1..A} binary;
var y{i in 1..D, k in 1..b} binary;

maximize coverage: sum{i in 1..D} h[i]*y[i,b];

subject to limited_resources: sum{j in 1..A} x[j]=M;
subject to x_y_relation{i in 1..D}: sum{j in 1..A} a[i,j]*x[j]>=sum{k in 1..b} y[i,k];
subject to ambulance{i in 1..D, k in 2..b}: y[i,k]<=y[i, k-1];

