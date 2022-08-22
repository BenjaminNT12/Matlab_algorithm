[clear all
clc
lS = 1;
lI = 0;
VectInit = [sin(-10) sin(-9) sin(-8) sin(-7) sin(-6) sin(-5) sin(-4) sin(-3) 3 4];
x(1) = 2;
h = 0.1;
t=0;
tA = 0;
intervaloAnterior = length(VectInit);
tA = 0.1;
i = 1;
for cont = 1:(lS/h - 1)*2
    if tA<lS
        eval = 5*VectInit(i);
        x(i+1) = x(i) + eval*h;
    end
    if tA>=lS
        ex=0;
        eval = 5*ex;
        x(i+1) = x(i) + eval*h;
        ex=x + h;
    end 
    tA = tA + h;
    i=i+1;
end
