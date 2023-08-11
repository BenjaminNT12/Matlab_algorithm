clc
close all
clear 

M1 = 0.8;
M2 = 2.3;
l1 = 1;
l2 = 1;
g  = 9.8;
L  = 0.1;
H  = 1;
Kn = 0.2;

T = 0.1;
t = [0: T :5];

for i = 1:length(t)
    [x1, x2, x3] = ode45(@sistemaPPC, [t(i) t(i+1)], x2(i), [], x3(i), fx, Bx, u(i));
    fx =  

end
