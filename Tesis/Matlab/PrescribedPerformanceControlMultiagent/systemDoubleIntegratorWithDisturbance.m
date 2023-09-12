function dxdt = systemDoubleIntegratorWithDisturbance(t, x, u, m, n)
    x1p = x(m*n+1:m*n*2);
    x2p = u(:) + 0.2*rand(length(x1p),1);
    dxdt = [x1p;x2p];
end
