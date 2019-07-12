param T;
param d{t in 1..T};
param k{t in 1..T};
param c{t in 1..T};
param h{t in 1..T};
param I_0;

var y{t in 1..T} binary;
var x{t in 1..T} >=0;
var I{t in 1..T} >=0;

minimize cost: sum{t in 1..T} (k[t]*y[t]+c[t]*x[t]+h[t]*I[t]);

subject to x_y_relationship{t in 1..T}: x[t]<=1200*y[t];
subject to inventory1: I[1]=x[1]-d[1]+I_0;
subject to inventory{t in 2..T}: I[t]=x[t]-d[t]+I[t-1];