% metodo Runge Kutta para 3er orden
clear all;
clc;
cla;
syms x y;
VInitX = 0;
VInitY = 1;
h = 1;
VEndX = 4;
VEndY = VInitY;
f = 4*exp(0.8*x)-0.5*y;
c = 1;
for i = VInitX:h:VEndX-h
    K1 = double(subs(f,[x,y],[VInitX,VEndY]));
    K2 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K1*h)]));
    K3 = double(subs(f,[x,y],[VInitX+h,VEndY-K1*h+2*K2*h]));
    VEndY = VEndY + (1/6*(K1+4*K2+K3)*h)
    Vector3erOrden(c) = VEndY;
    VInitX = VInitX + h;
    c = c + 1;
end
t = linspace(1,VEndX,c-1)
Vector3erOrden
plot(t,Vector3erOrden)
