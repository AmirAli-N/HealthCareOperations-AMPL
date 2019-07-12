##parameters
param D; #number of demand zones
param F; #number of facility locations
param P; #max number of facilities
param h{i in 1..D}; #demand at location i
param d{i in 1..D, j in 1..F}; #distance between zone i and j
##variables
var x{j in 1..F} binary; #whether a facility is built at location j
var y{i in 1..D, j in 1..F} binary; #if demand zone i is assigned to facility j
##objective
minimize distance: sum{i in 1..D, j in 1..F} h[i]*d[i,j]*y[i,j];
##constraint
subject to facilities: sum{j in 1..F} x[j]<=P;
subject to facility{i in 1..D, j in 1..F}: y[i,j]<=x[j];
subject to demand{i in 1..D}: sum{j in 1..F} y[i, j]=1;
