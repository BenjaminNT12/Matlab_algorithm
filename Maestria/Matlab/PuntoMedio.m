% punto medio metodo de integracion
clc;
clear all;
syms x y;
VInitX = 0;
VInitY = 1;
h = 0.5;
VEndX = 4;
VEndY = VInitY;
f = 4*exp(0.8*x)-0.5*y;
j = 1;
for i = VInitX:h:VEndX-h
    VEndYMedio = VEndY + subs(f,[x,y],[VInitX,VEndY])*(h/2);
    VInitXMedio = VInitX+h/2;
    YprimaMedio = subs(f,[x,y],[VInitXMedio,VEndYMedio]);
    VEndY = VEndY + subs(f,[x,y],[VInitXMedio,VEndYMedio])*(h);
    VInitX = VInitX+h
    VectorPuntoMedio(j) = double(VEndY);
    j = j + 1
end

VectorPuntoMedio