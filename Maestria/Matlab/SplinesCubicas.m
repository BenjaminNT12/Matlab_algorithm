% interpolacion splines cubica
clear all;
clc;
cla;
format long;
disp('x = [3 4.5 7 9];')
disp('y = [2.5 1 2.5 0.5]')
disp('Metodo de Splines CUBICAS(INTERPOLACION)')
syms xe;

m = 1;
x = [3 4.5 7 9 10];
y = [2.5 1 2.5 0.5 2];
%x = [0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
%y = [2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];
len = length(x)
fm = 0;
while m < 100
%    x(m) = input('Ingrese los valores de entrada (x) = ');
%    y(m) = input('Ingrese los valores de salida (y) = ');
    plot(x(m),y(m),'ok');
    hold on;
%    if m >= 3
%        R = input('Desea ingresar otro valor (Y)/(N)? ','s');    
%        if R == 'N' || R == 'n'
%            R = 0;
%            break;
%        end
%    end
    if m == len
        break;
    else
        m = m + 1;
        fm(m) = 1;
    end 
end
m
fm(m) = 0;
nI = 1;
M(m-2,m) = 0
n = 2
for i = 0:m-3
    p(nI)   = (x(nI+1)-x(nI))*fm(nI);
    p(nI+1) = 2*(x(nI+2)-x(nI))*fm(nI+1);
    p(nI+2) = (x(nI+2)-x(nI+1))*fm(nI+2);
    p(m) = (((6/(x(nI+2)-x(nI+1)))*(y(nI+2)-y(nI+1)))+((6/(x(nI+1)-x(nI)))*(y(nI)-y(nI+1))))
    for(j = 0:m-1)
        M(nI,j+1) = p(nI+j-i);
    end 
    nI = nI + 1;
end
M
M = rref(M)
fxpp(m) = 0;
for i = 1:m-2
    fxpp(i+1) = M(i,m);
end
nI = 2;
for i = 1:m-1
    fxi(i) = ((fxpp(nI-1)/(6*(x(nI)-x(nI-1))))*(x(nI)-xe)^3)+((fxpp(nI)/(6*(x(nI)-x(nI-1))))*(xe-x(nI-1))^3)+(((y(nI-1)/(x(nI)-x(nI-1)))-((fxpp(nI-1)*(x(nI)-x(nI-1)))/6))*(x(nI)-xe))+(((y(nI)/(x(nI)-x(nI-1)))-((fxpp(nI)*(x(nI)-x(nI-1)))/6))*(xe-x(nI-1)))
    t = linspace(x(i),x(i+1));
    fxip = subs(fxi(i),t);
    plot(t,fxip);
    nI = nI+1;
end









