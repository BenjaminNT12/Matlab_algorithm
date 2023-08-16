function [x1p, x2p, x3p] = sistemaPPC(x2 , x3, fx, Bx, u)
    x1p = x2;
    x2p = x3;
    x3p = fx+Bx*u;
end