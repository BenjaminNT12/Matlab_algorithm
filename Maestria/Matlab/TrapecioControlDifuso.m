% % function R = trapezoidal(a,b,c,x)
clear all
clear axis
clc

a = 4
b = 8
c = 10
d = 15
x=0:0.001:100;
trap = max(min((x-a)/(b-a),min(1,(d-x)/(d-c))),0)
plot(x,trap);
hold on

c = 10;
sig = 20;

x = 0:0.001:100;
gauss = exp(-(1/2)*((x-c)/sig).^2)
plot(x,gauss);
hold on

a = 5
b = 2
c = 30
x = 0:0.001:100;
bell = 1./(1+abs((x-c)./a).^(2*b))
plot(x,bell);
hold on

a = 4
c = 45
x = 0:0.001:100;
sig = 1./(1+exp(-a.*(x-c)))
plot(x,sig);
hold on



