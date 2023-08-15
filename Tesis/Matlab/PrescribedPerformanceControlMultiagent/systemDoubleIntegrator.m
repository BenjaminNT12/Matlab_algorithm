function dxdt = systemDoubleIntegrator(t, x, u)
    x1p = x(16:30);
    x2p = u(:);
    dxdt = [x1p;x2p];
end
