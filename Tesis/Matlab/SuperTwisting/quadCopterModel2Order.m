%Super-Twisting Sliding Mode Control (ST-SMC) es una variante avanzada del Sliding Mode Control
%que permite un mejor rendimiento y una mayor precisión en el control de sistemas no lineales.

%function dzdt = ModeloSMC(z1, z1_dot, z2, z1d, z1d_dot, z1d_ddot, psi, theta, phi, beta, xi, t, u)
function dzdt = quadCopterModel2Order(z, t, u)

% Parámetros de control
    phi  =  pi*(1/2);  %roll angle 
    theta =  pi*(3/4); %pitch angle
    xi = (0.5)*cos(t); %perturbaciones e incertidumbres del modelo

    m = 1.4;           %masa del UAS
    g = 9.81;          %fuerza gravitatoria (9.81 m/s^2) 
    dzdt(1,1) = z(2);
    dzdt(2,1) = ((cos(theta)*cos(phi))/(m))*u - g + xi;
end

