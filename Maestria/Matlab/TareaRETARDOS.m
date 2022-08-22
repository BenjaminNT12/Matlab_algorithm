clear all;
clear axis;
clc;
format long;

sigma = 2;
b = 31;
v = 17.6
delta = 0.0128
kp = 22.57
h = 0;
kr = 0;


for n = 0:4
    for w = 0:0.1:50
        h = (1/w)*acot((-w^2+sigma^2+v^2-(2*delta*v*sigma)+b*kp)/(-2*w*((delta*v)-sigma)))+(n*(pi/w))
        kr = (-2*w*((delta*v)-sigma))/(b*exp(h*sigma)*sin(h*w))
        plot(h,kr,'o');
        hold on;
    end
end

 for h = 0:0.01:0.5
    kr = (sigma^2+v^2-(2*delta*v*sigma)+b*kp)/(b*exp(h*sigma))
    plot(h,kr,'o');
    hold on;
 end
axis([0 .5 -30 60])
