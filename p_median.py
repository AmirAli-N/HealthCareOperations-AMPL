import numpy

h=numpy.loadtxt(fname='C:\\Users\\Amir Ali\\Google Drive\\Teaching-Health care operations management\\Python tutorial\\p_median-demand.txt', dtype=int, delimiter=',')
d=numpy.loadtxt(fname='C:\\Users\\Amir Ali\\Google Drive\\Teaching-Health care operations management\\Python tutorial\\p_median-travel_time.txt', dtype=int, delimiter=' ')

Demand_zone=range(0,5)
Facility_zone=range(0,5)

from gurobipy import *

m=Model("p_median")

x=m.addVars(Facility_zone, vtype=GRB.BINARY)
y=m.addVars(Demand_zone, Facility_zone, vtype=GRB.BINARY)

m.setObjective(sum(h[i]*sum(d[i,j]*y[i,j] for j in Facility_zone) for i in Demand_zone), GRB.MINIMIZE)

m.addConstr(sum(x[j] for j in Facility_zone)<=2, "limited_facilities")
for i in Demand_zone:
    for j in Facility_zone:
        m.addConstr(y[i,j]<=x[j], "x_y_relationship[%d][%d] %i%j")

for i in Demand_zone:
    m.addConstr(sum(y[i,j] for j in Facility_zone)==1, "demand_assignment[%d] %i")

m.optimize()

print('the optimal objective value is: ', m.objVal)

x_disp=m.getAttr('x', x)
y_disp=m.getAttr('x', y)

print('the optimal solution is:\n', x_disp)
print('the optimal assignemtn plan is:\n',y_disp)


