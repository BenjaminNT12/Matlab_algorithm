function dxdt = system(t, X, u)
    % Crear una función de transferencia para un sistema de primer orden
    x1p = X(2);
    x2p = sin(2*pi*t) + cos(2*pi*0.5*t)*cos(X(1)) + u;
    dxdt = [x1p; x2p];
end