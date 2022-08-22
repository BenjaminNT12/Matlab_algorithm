clear all
clc

k = 0.02
g = 9.81
l = 0.23
m = 0.5
Wn = sqrt(-k)
Xi = k/(2*m*l*Wn)

L1 = 36-k/(m*l)
L2 = 18^2-L1*k/(m*l)-g/l
K1 = (g*m)-(4^2)*m*l
K2 = k-6.4*m*l
