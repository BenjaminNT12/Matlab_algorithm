function dxdt = system1(t,x,u,d)
    a = 0.7;
    dxdt = -a*x + u + d; % sistema con perturbaciones
end