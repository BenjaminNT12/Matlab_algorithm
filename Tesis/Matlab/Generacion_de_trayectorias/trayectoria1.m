% Definir el rango de T
close all
close all
T = 0:0.1:500;

% Calcular yawDesired para cada valor de T
% yawDesired = rad2deg((sin(0.3*T)) + 0.5*cos(0.7*T));
% yawDesired = rad2deg((sin(0.3*T)) + 0.5*cos(0.7*T)); t2
% yawDesired = rad2deg((sin(0.5*T)) + 0.9*cos(0.4*T)); 
% yawDesired=(180/pi)*(1.2*sin(0.1*T)- 1.9*cos(0.15*T));
% yawDesired=(180/pi)*(sin(0.2*T)+ 0.9*cos(0.1*T));

yawDesired=( (180/pi)*( 0.4*( sin(0.1*T) + 0.9*cos(0.07*T) ) ) ) + 790;
            % (180/math.pi)*(0.4*np.sin(0.1*_time) + 0.9*np.cos(0.07*_time))+790
            % 0.7*(math.degrees(0.4*math.sin(0.15*_time) + 0.9*math.cos(0.1*_time))) + 790

% Crear la gráfica
figure;
plot(T, yawDesired);
title('Gráfica de yawDesired');
xlabel('T');
ylabel('yawDesired');