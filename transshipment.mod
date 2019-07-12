set source; #define supplier nodes
set inv; #define inventory nodes
set demand;	#define hospital nodes
set routes within (source cross inv) union (source cross demand) union (inv cross demand); #define all possible links between starting and ending nodes 
param h{routes}; #define cost for each edge
param s{source}; #define supplier ability
param c{inv};	#define inventory capacity
param d{demand}; #define hospital demand		

var x{(i,j) in routes} >=0; #define a decision variable for each edge

minimize time: sum{(i,j) in routes} h[i,j]*x[i,j];

subject to hospital{j in demand}: sum{(i,j) in (((source cross demand) union (inv cross demand)) inter routes)} x[i,j]>=d[j];
subject to supply{i in source}: sum{(i,j) in (((source cross demand) union (source cross inv)) inter routes)} x[i,j]<=s[i];
subject to to_cbc{k in inv}: sum{(i,k) in ((source cross inv) inter routes)} x[i,k]<=c[k];
subject to from_cbc{k in inv}: sum{(k, j) in ((inv cross demand) inter routes)} x[k,j]<=c[k];
subject to in_out_cbc{k in inv}: sum{(i,k)in ((source cross inv) inter routes)} x[i,k]=sum{(k, j) in ((inv cross demand) inter routes)} x[k,j];
