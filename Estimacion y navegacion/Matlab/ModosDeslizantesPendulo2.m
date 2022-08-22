clc
clear all
close all

d1 = pi/2;
m = 0.1;
l = 1;
k0 = 0.02;
g = 9.81;
kp = 4;
a1 = 1;
theta(1) = 0;
thetaP(1) = 0;
theta2P(1) = 0;
u(1) = 0;
x = [0 0];
t = [0 : 0.1 : 8];
x1 = 0
x2 = 0

for i = 1: length(t)-1
    [tt, xx] = ode45(@pendulo, [t(i) t(i+1)], x(i,:), [], u(i), d1)
    theta2P(i+1) = xx(end,2)
    thetaP(i+1) = thetaP(i) + ((theta2P(i) +theta2P(i+1))/2)*(t(i+1)-t(i))
    x2(i+1) = thetaP(i+1)
    theta(i+1) = theta(i) + ((thetaP(i) + thetaP(i+1))/2)*(t(i+1)-t(i))
    x1(i+1) = theta(i+1) - d1
    u(i+1) = -kp*sign(a1*x1(i+1) + x2(i+1));
    x(i+1,:) = [x1(i+1) x2(i+1)]
end

figure(1)
plot(t,theta)
hold on
grid on
figure(2)
plot(t,u)
hold on
grid on


