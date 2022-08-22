figure;
[x,y] = meshgrid(-3:1:3,-3:1:3)

g = 9.81
l = 0.5 
k = 0.05
m = 0.5 

x1 = y;
y1 = -(g/l)*sin(x)-(k/m)*y;
% quiver(x,y,x1,y1)
xlabel('x')
xlabel('y')
title('plano de fase')
xlim([-3 3])
ylim([-3 3])
grid

hold on
t=-3:0.1:3;
plot(t,t,'r')
plot(t,-4*t,'r');

[t,yy]=ode45(@myode,[0 20],[2 8]);
plot(yy(:,1),yy(:,2),'k')