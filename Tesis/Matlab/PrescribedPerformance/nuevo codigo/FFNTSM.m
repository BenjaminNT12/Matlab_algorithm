clc
clear
close all

% condiciones iniciales;
x = [1 0.5];
T = 0.001;
fin = 6;
t = 0 : T : fin;

alpha1 = 1;
beta1 = 1;
alpha2 = 1;
beta2 = 1;

m1 = 9/5;
m2 = 5/9;
n1 = 9/5;
n2 = 5/9;

h = 0.1;
lambda = 100;
k = 2;

g = 9.8;
mc = 1;
m = 0.1;
l = 0.5;

x1d = sin(0.5*pi*t);
x1pd = 0.5*pi*cos(0.5*pi*t);
x1ppd = -(0.5*pi)^2*sin(0.5*pi*t);


for i = 1: length(t)-1

    denominador = l*((4/3)-(m*cos(x(i,1))^2)/(mc+m));


    f = (g*sin(x(i,1)) - m*l*x(i,2)^2*cos(x(i,1))*sin(x(i,1))/(mc+m))/denominador;
    b = (cos(x(i,1))/(mc+m)) / denominador;


    e1(i) = x(i,1) - x1d(i);
    e2(i) = x(i,2) - x1pd(i);


    k1(i) = ((m1+1)/2) + ((m1-1)/2)*sign(abs(x(i,1)) - 1);
    k2(i) = ((m2+1)/2) + ((1-m2)/2)*sign(abs(x(i,1)) - 1);


    s(i) = e2(i) + alpha1*abs(e1(i))^k1(i)*sign(e1(i)) + beta1*abs(e1(i))^k2(i)*sign(e1(i));
    

    gama1(i) = (n1+1)/2 + ((n1-1)/2)*sign(abs(s(i)) - 1);
    gama2(i) = (n2+1)/2 + ((1-n2)/2)*sign(abs(s(i)) - 1);


    u(i) = -b^(-1)*(f - x1ppd(i) + alpha1*k1(i)*abs(e1(i))^(k1(i)-1)*x(i,2) + saturacion6(beta1*k2(i)*abs(e1(i))^(k2(i)-1)*x(i,2), h) + alpha2*abs(s(i))^gama1(i)*sign(s(i)) + beta2*abs(s(i))^gama2(i)*sign(s(i)) + k*rho6(lambda, s(i)));


    [tt, xx] = ode45(@sistema6, [t(i) t(i+1)], x(i,:), [], u(i));

    
    x(i+1, 1) = (xx(end, 1));
    x(i+1, 2) = (xx(end, 2));
end

e1(length(t)) = 0;
u(length(t)) = 0;
s(length(t)) = 0;
gama1(length(t)) = 0;
k1(length(t)) = 0;
k2(length(t)) = 0;

figure(1)
plot(t,x(:,1))
hold on
plot(t,x1d(:))
% hold on 
% plot(t,x(:,2))

figure(2)
plot(t,e1)

figure(3)
plot(x(:,1),x(:,2))

figure(4);
plot(t,u)
% figure(4);
% plot(t,s)
% hold on
% plot(t,k1)
% hold on
% plot(t,k2)
% hold on
% plot(t,x(:,1))
% legend("s","K1","k2","x1")





















%     u(i) = -b^(-1)*(f + alpha1*k1(i)*abs(e1(i))^(k1(i)-1)*x(i,2) + saturacion6(beta1*k2(i)*abs(x(i,1))^(k2(i)-1)*x(i,2), h) + alpha2*abs(s(i))^gama1(i)*sign(s(i)) + beta2*abs(s(i))^gama2(i)*sign(s(i)) + k*sign(s(i)));


% clc
% clear
% close all
% 
% % condiciones iniciales;
% x = [1 0.5];
% T = 0.001;
% fin = 6;
% t = 0 : T : fin;
% 
% alpha1 = 1;
% beta1 = 1;
% alpha2 = 1;
% beta2 = 1;
% g = 9.8;
% mc = 1;
% m = 0.1;
% l = 0.5;
% m1 = 9/5;
% m2 = 5/9;
% n1 = 9/5;
% n2 = 5/9;
% 
% h = 0.1;
% lambda = 100;
% k = 2;
% 
% x1d = sin(0.5*pi*t);
% x1pd = 0.5*pi*cos(0.5*pi*t);
% x1ppd = -(0.5*pi)^2*sin(0.5*pi*t);
% 
% 
% for i = 1: length(t)-1
% 
%     denominador = l*((4/3)-m*(cos(x(i,1))^2)/(mc+m));
% 
%     f = (g*sin(x(i,1)) - m*l*x(i,2)^2*cos(x(i,1))*sin(x(i,1))/(mc+m))/denominador;
%     b = (cos(x(i,1))/(mc+m)) / denominador;
% 
% 
%     e1(i) = x(i,1) - x1d(i);
%     e2(i) = x(i,2) - x1pd(i);
% 
% 
%     k1(i) = (m1+1)/2 + ((m1-1)/2)*sign(abs(x(i,1))-1);
%     k2(i) = (m2+1)/2 + ((1-m2)/2)*sign(abs(x(i,1))-1);
% 
% %     sign(e1(i))^k1(i) = (abs(e1(i))^k1(i))*sign(e1(i))
% 
%     s(i) = e2(i) + alpha1*(abs(e1(i))^k1(i))*sign(e1(i)) + beta1*(abs(e1(i))^k2(i))*sign(e1(i));
% %     s(i) = e2(i) + alpha1*sign(e1(i))^(k1(i)) + beta1*sign(e1(i))^(k2(i));
%     
% 
%     gama1 = (n1+1)/2 + ((n1-1)/2)*sign(abs(s(i)) - 1);
%     gama2 = (n2+1)/2 + ((1-n2)/2)*sign(abs(s(i)) - 1);
% 
% %     (abs(s(i))^gama1)*sign(s(i))
% 
%     u(i) = -b^(-1)*(f - x1ppd(i) + alpha1*k1(i)*(abs(e1(i))^(k1(i)-1))*x(i,2) + saturacion6(beta1*k2(i)*(abs(e1(i))^(k2(i)-1))*x(i,2), h) + alpha2*(abs(s(i))^gama1)*sign(s(i)) + beta2*(abs(s(i))^gama2)*sign(s(i)) + k*rho6(lambda, s(i)));
% %     u(i) = -b^(-1)*(f - x1ppd(i) + alpha1*k1(i)*(abs(e1(i))^(k1(i)-1))*x(i,2) + saturacion6(beta1*k2(i)*(abs(e1(i))^(k2(i)-1))*x(i,2), h) + alpha2*sign(s(i))^gama1 + beta2*sign(s(i))^gama2 + k*rho6(lambda, s(i)));
% 
%     [tt, xx] = ode45(@sistema6, [t(i) t(i+1)], x(i,:), [], u(i));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% end
% 
% e1(length(t)) = 0;
% 
% figure(1)
% plot(t,x(:,1))
% hold on
% plot(t,x1d(:))
% hold on 
% plot(t,x(:,2))
% figure(2)
% plot(t,e1)


