% Ejemplo 4.1.3.2
% Adaptive RBF Controller Design
clear all;
close all;
clc;

T = 0.01;
t = [0:0.01:30];
N = length(t);
x = [pi/60; 0];
% x0=[ones(5,1)];
c = [-2 -1 0 1 2;
    -2 -1 0 1 2];
b = 0.20;


gama = 1200;
yd = 0.1*sin(t);
dyd = 0.1*cos(t);
ddyd = -0.1*sin(t);
u = 0;
kp = 30;
kd = 50;
K = [kp kd]';
B = [0;1];
e = yd -x(1);
de = dyd - x(2);

Fai = [0 1;-kp -kd];
E = [e(1,1), de(1,1)]';
A = Fai';
Q = [500 0;0 500];
P = lyap(A,Q);
wh = zeros(5,1);
xi = [e; de];
h = zeros(5,1);
g = 9.8;
mc = 1.0;
m = 0.1;
l = 0.5;
%



for i=1:length(t)-1
    for j=1:5
        h(j,i+1)=exp(-norm(xi(:,i)-c(:,j)) ^2/(2*b^2));  % Capa oculta
    end
    entrada(i) = norm(xi(:,i));
end
entrada(i+1) =  entrada(i); 


figure(1)
plot(entrada, h(1,:))
figure(2)
plot(entrada, h(2,:))
figure(3)
plot(entrada, h(3,:))
figure(4)
plot(entrada, h(4,:))
figure(5)
plot(entrada, h(5,:))


















% fxh(end+1)=0;
% figure(1)
% plot(t,x(1,:))
% figure(2)
% plot(t,x(2,:))
% % figure(3)
% % plot(t,u)
% figure(4)
% plot(t,fxh(1:end))

function dxdt  = planta(t,x,u)

g=9.8;
mc=1.0;
m=0.1;
l=0.5;
S=l*(4/3-m*(cos(x(1)))^2/(mc+m));
fx=g*sin(x(1))-m*l*x(2)^2*cos(x(1))*sin(x(1))/(mc+m);
fx=fx/S;
gx=cos(x(1))/(mc+m);
gx=gx/S;

dxdt(1,1) = x(2);
dxdt(2,1) = fx + gx*u;
end
