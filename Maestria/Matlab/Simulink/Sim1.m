format long
Ra = 1.3
m = 0.13
kemf = 0.7
La = 0.001
l = 0.2
x1 = pi/4
A = [0 1 0;g/l*cos(x1) 0 -kemf/(m*l^2);0 -kemf/La -Ra/La]
B = [0;0;1000]
C = [0 0 0]
D = 0
