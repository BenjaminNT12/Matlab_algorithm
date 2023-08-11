function dxdt = sistema6(t, x, u)
    
    denominador = l*((4/3)-m*(cos(x(1))^2)*x(1)/(mc+m));

    f = (g*sin(x(1)) - m*l*x(2)^2*cos(x(1))*sin(x(1))/(mc+m)) / denominador;
    b = (cos(x(1))/(mc+m)) / denominador;

    x1p = x(2);
    x2p = f+b*u;

    dxdt = [x1p; x2p];
end
