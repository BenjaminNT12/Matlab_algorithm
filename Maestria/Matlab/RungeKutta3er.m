% metodo Runge Kutta para 3er orden
function R = RungeKutta3er(f,VInitX,VEndX,VInitY,h)
syms x y;
VEndY = VInitY;
c = 1;
for i = VInitX:h:VEndX-h
    K1 = double(subs(f,[x,y],[VInitX,VEndY]));
    K2 = double(subs(f,[x,y],[VInitX+((1/2)*h),VEndY+((1/2)*K1*h)]));
    K3 = double(subs(f,[x,y],[VInitX+h,VEndY-K1*h+2*K2*h]));
    VEndY = VEndY + (1/6*(K1+4*K2+K3)*h);
    Vector3erOrden(c) = VEndY;
    VInitX = VInitX + h;
    c = c + 1;
end
R = Vector3erOrden;

