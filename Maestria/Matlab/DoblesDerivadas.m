clear all
clc
syms x y;
fx = (2*x*y) + (2*x) - (x^2) - (2*y^2) +72;
NPuntos = 3;
LimiteX = 8;
LimiteY = 6;
intervalo = NPuntos - 1;
IX = LimiteX/intervalo;
IY = LimiteY/intervalo;

InX = 0;
InY = 0;
Px = 1;
Py = 1;
val = 0
for j = 1:NPuntos
    for k = 1:NPuntos
        MPt(k,j) = double(subs(fx,[x,y],[InX,InY]));
        InY = (InY + IY);
    end
    InY = 0;
    InX = (InX + IX);
end

for j = 1:NPuntos
    val(j) = (LimiteX-0)*(MPt(j,1)+2*MPt(j,2)+MPt(j,3))/4
end

R = (LimiteY-0)*(val(1)+2*val(2)+val(3))/4;
R
