param H;
param P;
param s{i in 1..H, j in 1..P};

var x{i in 1..H, j in 1..P} binary;

maximize score: sum{i in 1..H, j in 1..P} s[i,j]*x[i,j];

subject to heart_patients{i in 1..H}: sum{j in 1..P} x[i,j]=1;
subject to patient_hearts{j in 1..P}: sum{i in 1..H} x[i,j]<=1; 