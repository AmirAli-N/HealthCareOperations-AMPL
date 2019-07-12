set nodes; #define vertices set	
param base symbolic in nodes; #define starting node
param dest symbolic in nodes; #define ending node	
set roads within (nodes diff {dest}) cross (nodes diff {base}); #define the set of edges
param t{roads}; #define travel time for each edge		

var x{(i,j) in roads} binary; #define a decision variable for each edge

minimize time: sum{(i,j) in roads} t[i,j]*x[i,j];

subject to base_node: sum{(base, j) in roads} x[base,j]=1; #starting node constraint
subject to dest_node: sum{(i, dest) in roads} x[i,dest]=1; #ending node constraint
subject to balance{i in nodes diff {base,dest}}: sum{(i,j) in roads} x[i,j]=sum{(k,i) in roads} x[k,i]; #balance flow constraint

