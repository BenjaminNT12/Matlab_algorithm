% metodo Runge Kutta para 5to orden
clear all;
clc;
cla;
syms x y;
VInitX = 0;
VInitY = 1;
h = 1;
VEndX = 4;
VEndY = VInitY;
Vector5toOrden = 0;
f = 4*exp(0.8*x)-0.5*y;
c = 1;
for i = VInitX:h:VEndX-h
    K1 = double(subs(f,[x,y],[VInitX,VEndY]));
    K2 = double(subs(f,[x,y],[VInitX+((1/4)*h),VEndY+((1/4)*K1*h)]));
    K3 = double(subs(f,[x,y],[VInitX+((1/4)*h),VEndY+((1/8)*K1*h)+((1/8)*K2*h)]));
    K4 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY-((1/2)*K2*h)+(K3*h)]));
    K5 = double(subs(f,[x,y],[VInitX+((3/4)*h),VEndY+((3/16)*K1*h)+((9/16)*K4*h)]));
    K6 = double(subs(f,[x,y],[VInitX+h,VEndY-((3/7)*K1*h)+((2/7)*K2*h)+((12/7)*K3*h)-((12/7)*K4*h)+((8/7)*K5*h)]));
    VEndY = VEndY + ((1/90)*(7*K1+32*K3+12*K4+32*K5+7*K6)*h)
    Vector5toOrden(c) = VEndY;
    VInitX = VInitX + h;
    c = c + 1;
end
t = linspace(1,VEndX,c-1)
Vector5toOrden
plot(t,Vector5toOrden)
