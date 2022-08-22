function dxdt = modeloPVTOL(t,x,u)
    %u = 0;
    dxdt(1,1) = x(2);
    dxdt(2,1) = u;
end