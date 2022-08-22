clc
clear all
close all

d1 = pi/2
m = 0.1
l = 1
k0 = 0.02
g = 9.81
kp = 4
a1 = 1
theta(1) = 0
thetaP(1) = 0
u(1) = 0
x(1) = [0 0];
t = [0 : 0.1 : 10]

for i = 1: lenght(t)
    [tt, xx] = ode45(@pendulo, [t(i) t(i+1)], x(i), [], u(i), d);
    thetaP(i+1) = xx(end)
    x2(i+1) = thetaP(i+1)
    theta(i+1) = theta(i+1) + thetaP(i+1)*(t(i+1)-t(i))
    x1(i+1) = theta(i+1) - d1
    u(i+1) = -kp*sign(a1*x1 + x2)
    x(i+1) = [x1 x2];
end

figure(1)
plot(t,x(1,:))
hold on
plot(t,x(2,:))
hold on
plot(t,x(3,:))
hold on
grid on


