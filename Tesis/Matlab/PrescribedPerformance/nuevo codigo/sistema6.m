function dxdt = sistema6(t, x, u)

    g = 9.8;
    mc = 1;
    m = 0.1;
    l = 0.5;

    denominador = l*((4/3)-(m*cos(x(1))^2)/(mc+m));

    f = (g*sin(x(1)) - m*l*x(2)^2*cos(x(1))*sin(x(1))/(mc+m))/denominador;
    b = (cos(x(1))/(mc+m)) / denominador;
    
    d = sin(10*x(1))+cos(x(2));

    x1p = x(2);
    x2p = f+b*u+d;

    dxdt = [x1p; x2p];
end
