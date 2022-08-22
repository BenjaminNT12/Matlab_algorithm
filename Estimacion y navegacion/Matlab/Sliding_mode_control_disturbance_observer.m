% Sliding mode control for a class of uncertain nonlinear system based on disturbance observer
clc
clear all
close all

t       = [0 : 0.01 : 30];
x       = [2 1];
u(1)    = 0;
dg(1)   = -1;
c       = [1;1];
beta    = 1;
alpha   = 1;
xdP     = [0; 0];
xd      = [0 0];
z       = [0 0];
sigma   = 0;
v       = 0.05;
zp      = 0
d(1)    = 0.02
dt(1)   = 0


for i = 1: length(t)-1
    [tt, xx]    = ode45(@pendulo2, [t(i) t(i+1)], x(i,:), [], u(i), d(i));
    x(i+1,:)    = xx(end,:);
    
    ebar(i+1,:) = x(i+1,:) - xd;
    sigma(i+1)  = c'*ebar(i+1,:)';
    
    zp(i+1)     = -l(x(i+1,:))*g2(x(i+1,:))*z(i)-l(x(i+1,:))*(g2(x(i+1,:))*p(x(i+1,:))+f(x(i+1,:))+g1(x(i+1,:))*u(i));
    z(i+1)      = z(i) + zp(i+1)*0.01;
    dg(i+1)     = z(i+1) - p(x(i+1,:));
    
    u(i+1)      = -inv(c'*g1(x(i+1,:)))*(c'*f(x(i+1,:))-c'*xdP+c'*g2(x(i+1,:))*dg(i+1)+alpha*sat(sigma(i+1),v)+(abs(sigma(i+1)*c'*g2(x(i+1,:)))^2)/beta);
    
    d(i+1)      = 0.1*sin(t(i+1));
    dt(i+1)     = d(i+1) - dg(i+1); 

end

figure(1)
plot(t,x)
grid on
% xlabel("Time, Sec")
% ylabel("output, y")

figure(2)
plot(t,u)
grid on
% xlabel("Time, Sec")
% ylabel("output, y")


figure(3)
plot(t,ebar)
grid on
% xlabel("Time, Sec")
% ylabel("output, y")


figure(4)
plot(t,d, t, dg)
grid on
% xlabel("Time, Sec")
% ylabel("output, y")








