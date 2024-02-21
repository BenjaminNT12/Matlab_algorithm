function dxdt = systemDoubleIntegrator(t, x, u, m, n)
    x1p = x(m*n+1:m*n*2);
    x2p = u(:);
    dxdt = [x1p;x2p];
end
