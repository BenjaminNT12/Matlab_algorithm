function dxdt = quadCopterModel2Order(t , X, U)

    % Parámetros de control
        m = 1.4;           %masa del UAS
        g = 9.81;          %fuerza gravitatoria (9.;
    
        x = X(1:2,1);
        y = X(3:4,1);
        z = X(5:6,1);
        psi = X(7:8,1);
        theta = X(9:10,1);
        phi = X(11:12,1);
    
        ux = U(1,1);
        uy = U(2,1);
        uz = U(3,1);
        upsi = U(4,1);
        utheta = U(5,1);
        uphi = U(6,1);
        

        x1p = x(2,1);
        x2p = -ux*(cosd(psi(1,1))*sind(theta(1,1))*cosd(phi(1,1)) + sind(psi(1,1))*sind(phi(1,1)))/m;
    
        y1p = y(2,1);
        y2p = -uy*(sind(psi(1,1))*sind(theta(1,1))*cosd(phi(1,1)) - cosd(psi(1,1))*sind(phi(1,1)))/m;
    
        z1p = z(2,1);
        z2p = -uz*(cosd(theta(1,1))*cosd(phi(1,1)))/m + g;
    
        psi1p = psi(2,1);
        psi2p = upsi;
    
        theta1p = theta(2,1);
        theta2p = utheta;
    
        phi1p = phi(2,1);
        phi2p = uphi;
    
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
    