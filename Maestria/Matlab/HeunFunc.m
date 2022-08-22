function R = HeunFunc(f,VInitX,VEndX,VInitY,h)
% metodo numerico para determinar la integral de una duncion diferencial
% por el metodo de Heun
syms x y;
format long
k = 1;
VEndY = VInitY;

for i = VInitX:h:VEndX-h
    Fpredictor = subs(f,[x,y],[VInitX,VEndY]);
    VEndYTemp = VEndY + Fpredictor *h;
    VInitX = VInitX + h;
    Fcorrector = subs(f,[x,y],[VInitX,VEndYTemp]);
    Prom = double((Fpredictor + Fcorrector)/2);
    VEndYTemp = Prom;
    VEndYTemp = VEndY + VEndYTemp *h;
    for j = 1:15
        VEndYTemp = double(VEndY+((Fpredictor+subs(f,[x,y],[VInitX,VEndYTemp]))/2)*h);
    end
    VEndY = VEndYTemp;
    VectorHeun(k) = VEndY;
    k = k+1;
end

R = VectorHeun;

