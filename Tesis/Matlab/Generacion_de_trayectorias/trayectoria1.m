% Definir el rango de T
close all
close all
T = 0:0.005:100;

% Calcular yawDesired para cada valor de T
yawDesired = rad2deg((sin(0.3*T)) + 0.5*cos(0.7*T));
% yawDesired = rad2deg((sin(0.3*T)) + 0.5*cos(0.7*T)); t2
% yawDesired = rad2deg((sin(0.5*T)) + 0.9*cos(0.4*T)); t1

% Crear la gráfica
figure;
plot(T, yawDesired);
title('Gráfica de yawDesired');
xlabel('T');
ylabel('yawDesired');