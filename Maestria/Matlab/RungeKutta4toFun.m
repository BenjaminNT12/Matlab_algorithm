% Runge Kutta de 4to Orden 
function R = RungeKutta4toFun(f,VInitX,VEndX,VInitY,h)
syms x y;
VEndY = VInitY;
Vector4erOrden = 0;
c = 1;
for i = VInitX:h:VEndX-h
    K1 = double(subs(f,[x,y],[VInitX,VEndY]));
    K2 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K1*h)]));
    K3 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K2*h)]));
    K4 = double(subs(f,[x,y],[VInitX+h,VEndY+(K3*h)]));
    VEndY = VEndY + (1/6*(K1+2*K2+2*K3+K4)*h);
    Vector4erOrden(c) = VEndY;
    VInitX = VInitX + h;
    c = c + 1;
end
R = Vector4erOrden;
