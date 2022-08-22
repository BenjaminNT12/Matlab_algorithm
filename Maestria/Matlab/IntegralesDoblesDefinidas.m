%Integrales dobles definidas


clc;
clear all;
syms x y;
f = (x^2) + (y^2);
LiY = x;
LsY = 2*x;
LiX = 5;
LsX = 7;
N = 3;
iN = ( LsX - LiX )/(N-1)
inx = LiX
Vs = 0
Vi = 0
for i = 1:N
    Vs(i) = subs(LiY,inx);
    Vi(i) = subs(LsY,inx);
    inx = inx + iN
end
Vi
Vs
for i = 1:N
    VcThor(i) = TrapecioMult(f,Vi(i),Vs(i),N)
end

VcThor
