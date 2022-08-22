%Jose Carlos Carmona Rosas
clear all;
clc;
cla;
format long;
syms xe;

m = 1;
x = [0.97 1.12 2.92 3.00 3.33 3.97];
y = [2.58 0.43 0.06 5.74 7.44 8.07];
len = length(x)
fm = 0;
while m < len+1
    plot(x(m),y(m),'x');
    hold on;
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
    px(nI)   = (x(nI+1)-x(nI))*fm(nI);
    px(nI+1) = 2*(x(nI+2)-x(nI))*fm(nI+1);
    px(nI+2) = (x(nI+2)-x(nI+1))*fm(nI+2);
    px(m) = (((6/(x(nI+2)-x(nI+1)))*(y(nI+2)-y(nI+1)))+((6/(x(nI+1)-x(nI)))*(y(nI)-y(nI+1))));
    for(j = 0:m-1)
        M(nI,j+1) = px(nI+j-i);
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
    A=((fxpp(nI-1)/(6*(x(nI)-x(nI-1))))*(x(nI)-xe)^3)
    B=((fxpp(nI)/(6*(x(nI)-x(nI-1))))*(xe-x(nI-1))^3)
    C=(((y(nI-1)/(x(nI)-x(nI-1)))-((fxpp(nI-1)*(x(nI)-x(nI-1)))/6))*(x(nI)-xe))
    D=(((y(nI)/(x(nI)-x(nI-1)))-((fxpp(nI)*(x(nI)-x(nI-1)))/6))*(xe-x(nI-1)))
    fxi(i) = A+B+C+D
    t = linspace(x(i),x(i+1));
    fxip = subs(fxi(i),t);
    plot(t,fxip);
    nI = nI+1;
end