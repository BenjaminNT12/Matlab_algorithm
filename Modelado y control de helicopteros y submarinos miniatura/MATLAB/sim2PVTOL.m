
[tt,xx] = ode45(@modeloPVTOL2,[0:0.1:5],[0 0 0 0 0 0],[],0,0);
plot(tt,xx(:,1),tt,xx(:,2));
legend('x_1','x_2');