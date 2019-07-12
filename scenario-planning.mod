#######parameters#######
param D;
param F;
param P;
param q{s in 1..2};
param h{i in 1..D};
param d{i in 1..D, j in 1..F, s in 1..2};
#######variables########
var x{j in 1..F} binary;
var y{i in 1..D, j in 1..F, s in 1..2} binary;
#######objective########
minimize travel_time: sum{s in 1..2, i in 1..D, j in 1..F} h[i]*d[i, j, s]*y[i, j, s];
#######constraint#######
subject to demand{i in 1..D, s in 1..2}: sum{j in 1..F} y[i,j,s]=1;
subject to coverage{i in 1..D, j in 1..F, s in 1..2}: y[i,j,s]<=x[j];
subject to facilities: sum{j in 1..F} x[j]=P;

