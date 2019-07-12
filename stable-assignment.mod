param P;
param H;
param s{i in 1..P, j in 1..H};

var x{i in 1..P, j in 1..H} binary;

maximize score: sum{i in 1..P, j in 1..H} s[i,j]*x[i,j];

subject to 1heart_to_patient{i in 1..P}: sum{j in 1..H} x[i,j]=1;
subject to 1patient_to_heart{j in 1..H}: sum{i in 1..P} x[i,j]=1;
subject to p1_h1: x[1,4]+x[1,3]+x[2,1]<=1;
subject to p1_h2: x[2,2]<=1;
subject to p1_h3: x[1,1]+x[1,2]+x[1,4]+x[4,3]<=1;
subject to p1_h4: x[1,2]<=1;
subject to p2_h1: x[2,2]+x[2,3]+x[2,4]<=1;
#subject to p2_h2:
subject to p2_h3: x[2,2]+x[2,4]+x[1,3]+x[4,3]<=1;
subject to p2_h4: x[2,2]+x[3,4]+x[1,4]<=1;
subject to p3_h1: x[3,2]+x[1,1]+x[2,1]<=1;
subject to p3_h2: x[1,2]+x[2,2]+x[4,2]<=1;
subject to p3_h3: x[3,1]+x[3,2]+x[1,3]+x[2,3]+x[4,3]<=1;
subject to p3_h4: x[3,1]+x[3,2]+x[3,3]+x[1,4]<=1;
subject to p4_h1: x[4,4]+x[1,1]+x[2,1]+x[3,1]<=1;
subject to p4_h2: x[4,1]+x[4,4]+x[1,2]+x[2,2]<=1;
subject to p4_h3: x[4,1]+x[4,2]+x[4,4]<=1;
subject to p4_h4: x[1,4]+x[2,4]+x[3,4]<=1;