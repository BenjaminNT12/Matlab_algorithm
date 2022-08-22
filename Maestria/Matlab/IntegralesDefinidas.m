clear all;
clc;
syms x y
format shortG
funcion = x^2 + y^2;

n = 100;
aX = 5;
bX = 7;
ex = linspace(aX,bX,n+1);
aY = ex;
bY = 2*ex;

for cont1 = 1: n+1
    vecSol(cont1) = subs(funcion,x,ex(cont1));
end

for ii = 1:n+1
    h(ii) = (bY(ii)-aY(ii))/n; 
    res = 0; 
    for y = aY(ii):h(ii):bY(ii)
        k = subs(vecSol(ii),y);
        if y == aY(ii)
            d = k;
        end
        if y == bY(ii)
            e = k;
        end
        res = res+k;
    end 
    res = res-d-e;
    res = res*2;
    res = res+d+e;
    res = res/(2*n);
    res = res*(bY(ii)-aY(ii));
    double(res);
    solVecInt(ii,:) = double(res);
end

resX = 0;
for iii=1:n+1
    if iii==1
        dX=solVecInt(iii);
    end
    if iii==3
        eX =solVecInt(iii);
    end
    resX = resX+solVecInt(iii);
end
resX = resX-dX-eX;
resX = resX*2;
resX = resX+dX+eX;
resX = resX/(2*n);
resX = resX*(bX-aX);
double(resX)