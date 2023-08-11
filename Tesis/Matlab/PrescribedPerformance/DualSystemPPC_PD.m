clc
clear
close all

x = [0.1 0];
T = 0.01;
N =  100
t = 0 : T : 10;

k1 = 380.2;
k2 = 30.6;
k3 = 93.4;
yd = 5*sin(2*pi*t);
ydp = 10*pi*cos(2*pi*t);
eI(1) = 0;

for i = 1: length(t)-1
    ITERACION = i
    e(i+1) =   yd(i) - x(i,1);
    
    ep(i+1) =  ydp(i) - x(i,2);
    eI(i+1) = eI(i) + e(i+1)*T;
    u(i+1) = k1*e(i+1) + k2*ep(i+1) + k3*eI(i+1); % PD 
    z1p(i+1) = 1;
    [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));

    x(i+1, 1) = (xx(end, 1));
    x(i+1, 2) = (xx(end, 2));
end




% PPF
figure(1)
plot(t, e(:))
ylim([-20 15])
figure(2)
plot(t,u(:))
figure(3)
plot(t,x(:,1))
hold on
plot(t,yd(:))