% Runge Kutta de 4to Orden 
clear all;
clc;
cla;
syms x y;
VInitX = 0;
VInitY = 1;
h = 1;
VEndX = 4;
VEndY = VInitY;
Vector4erOrden = 0;
f = 4*exp(0.8*x)-0.5*y;
c = 1;
for i = VInitX:h:VEndX-h
    K1 = double(subs(f,[x,y],[VInitX,VEndY]));
    K2 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K1*h)]));
    K3 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K2*h)]));
    K4 = double(subs(f,[x,y],[VInitX+h,VEndY+(K3*h)]));
    VEndY = VEndY + (1/6*(K1+2*K2+2*K3+K4)*h)
    Vector4erOrden(c) = VEndY;
    VInitX = VInitX + h;
    c = c + 1;
end
t = linspace(1,VEndX,c-1)
Vector4erOrden
plot(t,Vector4erOrden)
