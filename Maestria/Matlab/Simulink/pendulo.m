function dx = pendulo(x)
Ra = 1.3
La = 0.001
kemf = 0.7
m = 0.13
l = 0.2
g = 9.81

u = x(1);
x1 = x(2);
x2 = x(3);
x3 = x(4);

dx = [x2;...
    ((g/l)*sin(x1))-((kemf*x3)/(m*l^2));...
    -((Ra/La)*x3)-((kemf/La)*x2)+u/La];