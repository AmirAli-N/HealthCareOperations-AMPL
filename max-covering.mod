##parameters
param D; #number of demand zones
param F; #number of facility locations
param P; #max number of facilities
param h{i in 1..D}; #demand at location i
param a{i in 1..D, j in 1..F}; #whether zone i is covered by zone j
##variables
var x{j in 1..F} binary; #whether a facility is built in zone j
var y{i in 1..D} binary; #whether demand zone i is covered
##objective
maximize coverage: sum{i in 1..D} h[i]*y[i];
##constraint
subject to facilities: sum{j in 1..F} x[j]<=P;
subject to demand{i in 1..D}: sum{j in 1..F} a[i,j]*x[j]>=y[i];