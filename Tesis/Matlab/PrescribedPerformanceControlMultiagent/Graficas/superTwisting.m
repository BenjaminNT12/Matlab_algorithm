%Sliding Mode Control- CICLO

clc       
clear all          % You can clear all variables
close all          % Is used to close all open figure windows
 

tFin = 100
T = 0.01;          % Paso de integración 
t = [0:T:tFin];     % Vector de similitud
z = [2.86 1.5];    % Condiciones Iniciales
z1d = sin(t);      % z1 Deseado 
z1d_dot = cos(t);  % Derivada de z1 deseado
z1d_ddot = -sin(t); 
ust = 0;           % Tao (Ley de Control)
qd = pi/2;         % Posición deseada (1.570796)

% Parámetros de control
    phi   =  pi*(1/2); %roll angle 
    theta =  pi*(3/4); %pitch angle
    % xi  = perturbaciones e incertidumbres del modelo
    m = 1.4;          %masa del UAS
    g = 9.81;         %fuerza gravitatoria (9.81 m/s^2) 
    k1 = 3.5;         % Ganancia 1
    k2 = 6;           % Ganancia 2 
    beta1 = 0.25; 
    
%Definiendo el ciclo de modo que se calcula desde function
for i=1:length(t)-1 %ciclo base for
%t1
 [tt,zz] = ode45(@modelosliding,[t(i) t(i+1)],z(i,:),[],ust(i));
 z(i+1,:) = zz(end,:);

    z1 = z(i+1, 1) ; 
    z2 = z(i+1, 2) ;
    zsistema = [z1 ; z2] ;      %vector de estados
    e = z1 - z1d(i);            %error de seguimiento
                                %i es mi apuntador 
    e_dot = z2 - z1d_dot(i);    %derivada del error de seguimiento
    s(i+1) = e_dot + beta1 * e; %Superficie de deslizamiento lineal
    %valor futuro con (i1)

 integral(i+1) = integral(i) + sign(s(i)); 
 ust(i+1)= (m)/(cos(theta)*cos(phi))*(g+z1d_ddot(i)-beta1 * e_dot - k1*abs(s(i))^(0.5)*sign(s(i)) - k2*integral(i));
end

                     % A N E X O S 
    % z = altitud
    % z_dot = velocidad de altitud 
    % z_ddot = aceleración de altitud
    % u = Es la entrada de control que actúa sobre el sistema.



