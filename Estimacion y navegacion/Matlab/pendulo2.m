function dxdt = pendulo2(t,x,u,d)
    dxdt = f(x)+g1(x)*u+g2(x)*d;
end