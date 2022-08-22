% metodo de euler-(heun)
clc;
clear all;
syms x;
VInitX = -1.3;
VInitY = 1;
h = 0.1;
VEndX = 1.3;
VEndY = VInitY;
f = x^2;

for i = VInitX:h:VEndX-h
    VEndY = VEndY + subs(f,VInitX)*h;
    VInitX = VInitX + h;
    hold on
    plot(VInitX,VEndY,'o')
end
VEndY

