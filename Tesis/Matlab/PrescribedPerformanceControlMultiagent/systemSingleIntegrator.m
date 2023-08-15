function dxdt = systemSingleIntegrator(t, x, u)
    % x1p = x(9:16);
    x1p = u(:,1);
    dxdt = [x1p];
end