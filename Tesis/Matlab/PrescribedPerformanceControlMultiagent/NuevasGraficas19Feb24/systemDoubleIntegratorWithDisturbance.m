function dxdt = systemDoubleIntegratorWithDisturbance(t, x, u, m, n)
    x1p = x(m*n+1:m*n*2);
    x2p = u(:) + 2*disturbance(2.6*cos(1.2*pi*t)-2.3*sin(0.2*pi*t), sin(2*pi*t) + cos(2*pi*0.5*t)*cos(t) , 0.5*sin(pi*t), length(x1p)/3);
    dxdt = [x1p;x2p];
    
    function disturbanceVector = disturbance(x, y, z, l)
        disturbanceVector = zeros(l*3,1);           
        for i = 1: 3: l*3
            disturbanceVector(i, 1) = x;
            disturbanceVector(i+1, 1) = y;
            disturbanceVector(i+2, 1) = z;
        end
    end
end







