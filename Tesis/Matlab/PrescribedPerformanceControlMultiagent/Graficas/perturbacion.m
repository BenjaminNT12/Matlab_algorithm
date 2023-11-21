% Parámetros de entrada para la función de perturbación
clc 
close all
clear all
t = 0:0.01:30;  % Tiempo

% Generar datos de perturbación para cada eje
for i = 1:length(t)
    x_disturbance(i,:) = [2.6*cos(1.2*pi*t(i))-2.3*sin(0.2*pi*t(i)), sin(2*pi*t(i)) + cos(pi*t(i))*cos(t(i)) , 0.5*sin(pi*t(i))];
end

figure(1)
plot(t,x_disturbance(:,1))
figure(2)
plot(t,x_disturbance(:,2))
figure(3)
plot(t,x_disturbance(:,3))
