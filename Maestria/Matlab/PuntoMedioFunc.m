% funcion punto medio
function R = PuntoMedioFunc(f,VInitX,VEndX,VInitY,h)
syms x y;
VEndY = VInitY;
j = 1;
for i = VInitX:h:VEndX-h
    VEndYMedio = VEndY + subs(f,[x,y],[VInitX,VEndY])*(h/2);
    VInitXMedio = VInitX+h/2;
    YprimaMedio = subs(f,[x,y],[VInitXMedio,VEndYMedio]);
    VEndY = VEndY + subs(f,[x,y],[VInitXMedio,VEndYMedio])*(h);
    VInitX = VInitX+h;
    VectorPuntoMedio(j) = double(VEndY);
    j = j + 1;
end

R = VectorPuntoMedio;