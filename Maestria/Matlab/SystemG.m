function dx = SystemG(x,u)
    Ra = 1.3
    m = 0.13
    kemf = 0.7
    La = 0.001
    l = 0.2
    g = 9.81
    qd = x(1)
    qpd = x(2)
    id = ((m*l*g)/kemf)*sin(qd)
    x1 = qd;
    x2 = qpd;
    x3 = id;
    dx = [x2; (g/l)*sin(x1)-(kemf/m*l^2)*x3; -(Ra/La)*x3-(kemf/La)*x2+(1/La)*u]
