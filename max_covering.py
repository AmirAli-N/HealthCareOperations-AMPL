import numpy #import NumPy library which includes the function loadtxt

h=numpy.loadtxt(fname='max_covering-demand.txt', dtype=int, delimiter=',') #load data file max_covering-demand.txt into variable h
print(h)

a=numpy.loadtxt(fname='max_covering-coverage_matrix.txt', dtype=int, delimiter='\t') #load data file max_covering-coverage_matrix.txt into variable a
print(a)

Demand_zone=range(0,5) #define a range for demand zones: 0,1,2,3,4
Facility_zone=range(0,5) #define a range for facility zones: 0,1,2,3,4

from gurobipy import * #import all libraries of GurobiPy

max_cov=Model("max-covering") #build a model objec (sort of like a model file) with max-covering as its label 

x=max_cov.addVars(Facility_zone, vtype=GRB.BINARY) #define x variables for facility zones of the type binary for the object max_cov
y=max_cov.addVars(Demand_zone, vtype=GRB.BINARY) #define y variables for Demand zones of the type binary for the object max_cov

max_cov.setObjective(sum(y[i]*h[i] for i in Demand_zone), GRB.MAXIMIZE) #build the objective function: min(sum_i {h_i*y_i}) for the object max_cov 

max_cov.addConstr(sum(x[j] for j in Facility_zone)<=2, "limited_facilities") #add constraint sum_j {x_j}<=2 to the max_cov object with its label
for i in Demand_zone: #for every i in demand zones add the constraint sum_j {a_ij*x_j}>=y_i with its own label 
	max_cov.addConstr(sum(a[i][j]*x[j] for j in Facility_zone)>=y[i], "coverage[%d] % i") #coverage[%d] %i replaces the values of i in demand zones with d

max_cov.optimize() #solve the model

print(x)
print(y)

x_disp=max_cov.getAttr('x', x) #get the values of x solution
y_disp=max_cov.getAttr('x', y) #get the values of y solution

print(x_disp)
print(y_disp)

print(max_cov.objVal) #print the objective value


