function fx = f(x)

g = -   9.81;
m = 0.1; % 0.1
mc = 1; % 1
l = 0.5; %m

fx21 = ((g*sin(x(1))-(m*l*x(2)^2*cos(x(1))*sin(x(1)))/(mc+m))/(l*((4/3)-((m*cos(x(1))^2)/(mc+m)))));
fx = [x(2); fx21];
end