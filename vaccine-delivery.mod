param T;
param A;
param dose{j in 1..A};
param requirements{j in 1..A};

var x{j in 1..A, i in 1..T} integer >=0;
var v{i in 1..T} binary;
var y{j in 1..A, i in 1..T} binary;

minimize cost: sum{i in 1..T} 200*v[i];

subject to max_antigens{i in 1..T}: sum{j in 1..A} x[j,i]<=3*v[i];
subject to required_dose{j in 1..A}: sum{i in 1..T} x[j,i]=requirements[j];
subject to blending_1{j in {2,5,6}, i in 1..T}: x[j,i]<=3*y[j,i];
subject to blending_2{i in 1..T}: sum{j in {2,5,6}} y[j,i]<=1;
subject to dosage{j in 1..A, i in 1..T}: x[j, i]<=dose[j];


