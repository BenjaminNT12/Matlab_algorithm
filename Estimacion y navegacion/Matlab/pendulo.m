function dxdt = pendulo(t,x,u,d)
    d1 = pi/2;
    m = 0.1;
    l = 1;
    k0 = 0.02;
    g = 9.81;
    kp = 4;
    a1 = 1;

    x1p = x(2);
    x2p = -(g/l)*sin(x(1) + d1) - (k0/m)*x(2) + (1/m*l^2)*u;
    dxdt = [x1p; x2p];
end