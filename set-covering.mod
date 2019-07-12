##parameters
param D; #number of demand zones
param F; #number of facility locations
param c{j in 1..F}; #cost of building at location j
param a{i in 1..D, j in 1..F}; #whether zone i is covered by zone j
##variables
var x{j in 1..F} binary; #whether a facility is built in zone j
##objective
minimize cost: sum{j in 1..F} c[j]*x[j];
##constraint
subject to demand{i in 1..D}: sum{j in 1..F} a[i,j]*x[j]>=1;
