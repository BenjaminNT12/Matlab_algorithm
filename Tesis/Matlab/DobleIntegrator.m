function dxdt = DobleIntegrator(t, x, u) 
    x1p = x(2,:);
    x2p = u(:);

    dxdt = [x1p; x2p];
end