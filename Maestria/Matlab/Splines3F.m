% interpolacion splines cubica
function fxi = Splines3F(x,y)
syms xe;
m = 1;
disp('Splines 3')
len = length(x);
fm = 0;
while m < len
    if m == len
        break;
    else
        m = m + 1;
        fm(m) = 1;
    end 
end
fm(m) = 0;
nI = 1;
M(m-2,m) = 0
n = 2
for i = 0:m-3
    p(nI)   = (x(nI+1)-x(nI))*fm(nI);
    p(nI+1) = 2*(x(nI+2)-x(nI))*fm(nI+1);
    p(nI+2) = (x(nI+2)-x(nI+1))*fm(nI+2);
    p(m) = (((6/(x(nI+2)-x(nI+1)))*(y(nI+2)-y(nI+1)))+((6/(x(nI+1)-x(nI)))*(y(nI)-y(nI+1))));
    for(j = 0:m-1)
        M(nI,j+1) = p(nI+j-i);
    end
    nI = nI + 1;
end
M
M = rref(M)
fxpp(m) = 0;
for i = 1:m-2
    fxpp(i+1) = M(i,m)
end
nI = 2;
for i = 1:m-1
    fxi(i) = ((fxpp(nI-1)/(6*(x(nI)-x(nI-1))))*(x(nI)-xe)^3)+((fxpp(nI)/(6*(x(nI)-x(nI-1))))*(xe-x(nI-1))^3)+(((y(nI-1)/(x(nI)-x(nI-1)))-((fxpp(nI-1)*(x(nI)-x(nI-1)))/6))*(x(nI)-xe))+(((y(nI)/(x(nI)-x(nI-1)))-((fxpp(nI)*(x(nI)-x(nI-1)))/6))*(xe-x(nI-1)))
    t = linspace(x(i),x(i+1));
    fxip = subs(fxi(i),t);
    plot(t,fxip,'LineWidth',2);
    nI = nI+1;
end

