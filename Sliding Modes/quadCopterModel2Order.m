%Super-Twisting Sliding Mode Control (ST-SMC) es una variante avanzada del Sliding Mode Control
%que permite un mejor rendimiento y una mayor precisión en el control de sistemas no lineales.

%function dzdt = ModeloSMC(z1, z1_dot, z2, z1d, z1d_dot, z1d_ddot, psi, theta, phi, beta, xi, t, u)
function dxdt = quadCopterModel2Order(t , X, uz)

    % Parámetros de control
        m = 1.4;           %masa del UAS
        g = 9.81;          %fuerza gravitatoria (9.81 m/s^2) 
    
        xi = (0.5)*cos(t); %perturbaciones e incertidumbres del modelo
    
        IX = 0.00029;
        Iyy = 0.00038;
        Izz = 0.00079;
    
        x = X(1:2,1);
        y = X(3:4,1);
        z = X(5:6,1);
        psi = X(7:8,1);
        theta = X(9:10,1);
        phi = X(11:12,1);
    
        ux = 0;
        uy = 0;
        upsi = 0;
        utheta = 0;
        uphi = 0;
    
        x1p = x(2,1);
        x2p = ux*(sin(phi(1,1))*sin(psi(1,1))+cos(phi(1,1))*cos(psi(1,1))*sin(theta(1,1)))/m;
    
        y1p = y(2,1);
        y2p = uy*(cos(phi(1,1))*sin(theta(1,1))*sin(psi(1,1))-cos(psi(1,1))*sin(phi(1,1)))/m;
    
        z1p = z(2,1);
        z2p = ((cos(theta(1,1))*cos(phi(1,1)))/m)*uz - g + xi;
    
        psi1p = psi(2,1);
        psi2p = (upsi - X(10,1)*X(12,1)*(Iyy-Izz))/IX;
    
        theta1p = theta(2,1);
        theta2p = (utheta - X(8,1)*X(12,1)*(Izz-IX))/Iyy;
    
        phi1p = phi(2,1);
        phi2p = (uphi - X(8,1)*X(10,1)*(IX-Iyy))/Izz;
    
        dxdt = [x1p;
                x2p;
                y1p;
                y2p; 
                z1p; 
                z2p; 
                psi1p; 
                psi2p; 
                theta1p; 
                theta2p; 
                phi1p; 
                phi2p];
    end
    