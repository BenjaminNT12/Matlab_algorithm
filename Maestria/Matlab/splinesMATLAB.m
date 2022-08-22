clear all;
cla;
clc;
x=[0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
y=[2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];
hold on
plot(x,y,'bo','markersize',4,'markerfacecolor','b')

z=@(xx) interp1(x,y,xx,'spline');
fplot(z,[x(1),x(end)])
hold off
xlabel('x')
ylabel('y')
grid on
title('Interpolación splines')