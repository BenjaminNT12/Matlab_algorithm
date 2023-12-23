clc; 
clear;
close all;
% Obtiene una lista de todos los archivos en el directorio
files = dir('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/*.txt');

% Inicializa las variables
yaw = [];
yawVel = [];
yawAcc = [];
yawDeseada = [];
control = [];
error = [];
t = [];

% Itera sobre cada archivo
for file = files'
    % Abre el archivo en modo lectura
    fid = fopen(fullfile(file.folder, file.name), 'r');
    % Lee los valores numéricos
    data = textscan(fid, 'yaw: %f Yaw vel: %f Yaw acc: %f yaw Deseada: %f Control: %f Error: %f');
    fclose(fid);  % Cierra el archivo
    
    % Agrega los nuevos datos a las variables existentes
    yaw = [yaw; data{1}];
    yawVel = [yawVel; data{2}];
    yawAcc = [yawAcc; data{3}];
    yawDeseada = [yawDeseada; data{4}];
    control = [control; data{5}];
    error = [error; data{6}];
    t = [t, (0:0.05:length(data{1})*0.05-0.05) + (length(t)*0.05)];
end

% Grafica los datos
figure;

subplot(3, 2, 1);
plot(t, yaw);
title('Yaw');

subplot(3, 2, 2);
plot(t, yawVel);
title('Yaw Velocity');

subplot(3, 2, 3);
plot(t, yawAcc);
title('Yaw Acceleration');

subplot(3, 2, 4);
plot(t, yaw, 'b'); hold on;
plot(t, yawDeseada, 'r--');
hold off;
title('Yaw y Yaw Deseada');
legend('Yaw', 'Yaw Deseada');

subplot(3, 2, 5);
plot(t, control);
title('Control');

subplot(3, 2, 6);
plot(t, error);
title('Error');

figure(2)
plot(t, yaw, 'b'); hold on;
plot(t, yawDeseada, 'r--');
hold off;
title('Yaw y Yaw Deseada');
legend('Yaw', 'Yaw Deseada');


figure(3)
T = 0.05
% subplot(3, 1, 1);
plot(t(1:200/T), deg2rad(yaw( 1:200/T)),  'LineWidth', 1.2)  % Línea azul gruesa
% hold on
% plot(t(1:200/T), Zg(1, 1:200/T), '--', 'LineWidth', 1.2)  % Línea roja punteada
% title('Posición Yaw 0 - 200 Seg.');
xlabel('Segundos');
ylabel('Radianes');
legend('Yaw', 'Yaw estimada');
