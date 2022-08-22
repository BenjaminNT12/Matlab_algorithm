clc
clear all
close all

datos1 = csvread('datos11.csv')

T = 0.05;
tau = 1;
x = datos1(:,1);
xref = datos1(:,2);
t = [0:0.05:119.85];


xf(1) = x(1);

for i=1:length(t)-1
    xf(i+1) = xf(i) + (T/tau)*(x(i) - xf(i));
end



figure(1)
%plot(t,x)
%legend('x')

plot(t,x,t,xf)
legend('x','xfil')
plot(t,x,t,xf,'LineWidth',1.7)
set(gca,'FontSize',13)
xlabel('X-axis [m]')
ylabel('Y-axis [m]')

figure(2)
plot(t,xf,t,xref)
title('X filtrada')


xp = 0;
for i=1:length(t)-1
    xp(i+1) = (xf(i+1)-xf(i))/T;
end
xp2 = diff(x)/T;
figure(3)
plot(t,xp)
legend('xp_E')


xpf(1) = xp(1);
for i=1:length(t)-1
    xpf(i+1) = xpf(i) + (T/tau)*(xp(i) - xpf(i));    
end

xrefp = diff(xref)/T;
figure(4)
plot(t,xpf,t(1:end-1),xrefp)
legend('xpf Euler','xp Ref')
title('X punto Filtrada')