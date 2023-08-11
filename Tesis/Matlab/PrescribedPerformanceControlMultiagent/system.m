function dxdt = system(t,x,u)
    x1 = x(:,1);
    x2 = x(:,2);

    x1p = x2;
    x2p = u(:);
    dxdt = [x1p; x2p];
end
