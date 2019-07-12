param M;
param W;

var x{i in 1..M, j in 1..W} binary;

maximize marriage: sum{i in 1..M, j in 1..W} x[i,j];

subject to 1man_to_woman{j in 1..W}: sum{i in 1..M} x[i,j]=1;
subject to 1woman_to_man{i in 1..M}: sum{j in 1..W} x[i,j]=1;
subject to Alan_Alice: x[1,4]+x[1,3]+x[2,1]<=1;
subject to Alan_Brenda: x[2,2]<=1;
subject to Alan_Cindy: x[1,1]+x[1,2]+x[1,4]+x[4,3]<=1;
subject to Alan_Debbie: x[1,2]<=1;
subject to Bob_Alice: x[2,2]+x[2,3]+x[2,4]<=1;
#subject to Bob_Brenda:
subject to Bob_Cindy: x[2,2]+x[2,4]+x[1,3]+x[4,3]<=1;
subject to Bob_Debbie: x[2,2]+x[3,4]+x[1,4]<=1;
subject to Carl_Alice: x[3,2]+x[1,1]+x[2,1]<=1;
subject to Carl_Brenda: x[1,2]+x[2,2]+x[4,2]<=1;
subject to Carl_Cindy: x[3,1]+x[3,2]+x[1,3]+x[2,3]+x[4,3]<=1;
subject to Carl_Debbie: x[3,1]+x[3,2]+x[3,3]+x[1,4]<=1;
subject to Dan_Alice: x[4,4]+x[1,1]+x[2,1]+x[3,1]<=1;
subject to Dan_Brenda: x[4,1]+x[4,4]+x[1,2]+x[2,2]<=1;
subject to Dan_Cindy: x[4,1]+x[4,2]+x[4,4]<=1;
subject to Dan_Debbie: x[1,4]+x[2,4]+x[3,4]<=1;
