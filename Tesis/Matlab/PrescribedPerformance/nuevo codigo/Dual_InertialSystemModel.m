function dxdt = Dual_InertialSystemModel(t, x, u) 
    
    Jm = 0.026;
    Jl = 0.0113;
    Bm = 1.3;
    n = 11.5;
    Fl = 2.5;
    
    Tm = u; % se puede obtener
    
    x1p = x(2);
    x2p = (1/(n*Jm + Jl))*(Tm - n*Bm*x(2));
    dxdt = [x1p; x2p];
end