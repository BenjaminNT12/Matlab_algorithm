clear all
clear axis;
syms s
clc;
h = 10;
tic 
w = 0;
for w = 0.001:0.001:10
    a = w/tan(w*h);
    b = -w/sin(w*h);
    plot(a,b,'o-b');
    hold on;
end
for c = -10:0.001:10
    d = -c;
    plot(c,d,'x-r');
    hold on;
end
plot(1/h,-1/h,'p-g');
hold on;

axis([-10,10,-10,10])
hold on;
% 
% QP = s-4-2-exp(-s*h)
% P = qpmr_1(QP,[-10 10 -10 10],0.1*pi/2.5,0.001);
% toc




