clc;
clear all;
syms x;
VInitX = 0;
VInitY = 1;
h = 0.5;
VEndX = 4;
Vval = 0;
VEndY = VInitY;
t = 0;
f = 5*x*(t-1)
c = 1;
for i = VInitX:h:VEndX-h
    VEndY = VEndY + subs(f,VInitX)*h;
    Vval(c) = VEndY;
    VInitX = VInitX + h;
    t = t + h;
    c = c + 1;
end
VEndY

