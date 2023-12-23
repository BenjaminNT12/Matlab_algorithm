clc; 
clear;
close all;
% Obtiene una lista de todos los archivos en el directorio
files = dir('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/*.txt');

k1 = 0.05;
alpha1 = 1.5; % 1-2
alpha2 = 1.01; % >1 
beta1  = 1.3;
beta2  = 0.5;
gamma1 = 0.1;
sigma1 = 0.1;
sigma2 = 0.3;

P = [k1;
     alpha1;
     alpha2;
     beta1;
     beta2;
     gamma1;
     sigma1];

u = 0; 

W0 = [1; 0.5];
 
 
% Inicializa las variables
yaw = [];
yawVel = [];
yawAcc = [];
yawDeseada = [];
control = [];
error = [];
t = [];
T = 0.05;
 
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

yaw = deg2rad(yaw);

Wg = zeros(2,1);
Wt = W0-Wg;
Z = yaw(1)*ones(2,1);
Zg = yaw(1)*ones(2,1);
phi(:, 1) = [ tanh(Zg(1, 1)); 
              tanh(Zg(2, 1))]; % funcion de activacion de la red vector

Zt = Z - Zg;

for i = 1:length(t)-1
    [tt,zz] = ode45(@identifier, [t(i) t(i+1)], Zg(:,i), [], u, Wg(:,i), phi(:,i), Zt(:, i),P(:));
    Zg(:, i+1) = zz(end, :)';

    Z(:, i+1) = [yaw(i);
                 yawVel(i)];

    Zt(:, i+1) = Z(:, i+1) - Zg(:, i+1);
    
    s(i+1) = Zt(1, i+1) + k1*sign(Zt(2, i+1))*abs(Zt(2, i+1))^alpha1; % sliding surface escalar
    phi(:, i+1) = tanh(Zg(:, i+1)); % funcion de activacion de la red vector

    Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i+1)*phi(:,i+1)+sigma1*Wt(:,i) + sigma2*sign(Wt(:,i))); % W punt, derivada de los pesos estimados de la red escalar
    Wg(:,i+1) = Wg(:,i) + Wgp(:,i+1)*T; % Wg, pesos estimados de la red escalar
    Wt(:,i+1) = W0 - Wg(:,i+1); % W tilde, error de pesos de la red
end


% figure(1)

% subplot(4, 1, 1);
% % plot(t, yawDeseada(:))
% % hold on
% plot(t, Z(1,:))
% hold on
% plot(t, Zg(1,:))
% title('POSICIÓN, Z 1 and Zg 1');

% subplot(4, 1, 2);
% % plot(t, yawVel(:))
% % hold on
% plot(t, Z(2,:))
% hold on
% plot(t, Zg(2,:))
% title('VELOCIDAD, Z 2 and Zg 2');

% subplot(4, 1, 3);
% plot(t, Wg(1,:));
% hold on
% plot(t, Wg(2,:));
% title('PESOS, Wg 1 and Wg 2');

% % plot de s
% subplot(4, 1, 4);
% plot(t, s(:));
% title('s(:)');

% % plot de de la entrada de control

% figure(2)
% plot(t, control(:));


% figure(3)
% plot(t, Z(2,:))
% hold on
% plot(t, Zg(2,:))
% title('VELOCIDAD, Z 2 and Zg 2');

% figure(4)
% plot(t, Z(1,:))
% hold on
% plot(t, Zg(1,:))
% title('POSICIÓN, Z 1 and Zg 1');

% figure(5)
% plot(t, s(:));
% title('s');
% ymax = 1;
% ymin = -1;
% % Establece los límites del eje x
% ylim([ymin ymax]); 





figure(1)

subplot(2, 1, 1);
plot(t(1:200/T), Z(1, 1:200/T), '-.',  'LineWidth', 1.2)  % Línea azul gruesa
hold on
plot(t(1:200/T), Zg(1, 1:200/T), '--', 'LineWidth', 1.2)  % Línea roja punteada
title('Posición Yaw 0 - 200 Seg.');
xlabel('Segundos');
ylabel('Radianes');
legend('Yaw medida', 'Yaw estimada');

subplot(2, 1, 2);
plot(t(1:50/T), Z(1, 1:50/T), '-.', 'LineWidth', 1.2)
hold on
plot(t(1:50/T), Zg(1, 1:50/T), '--', 'LineWidth', 1.2)
title('Posición Yaw 0 - 50 Seg.');
xlabel('Segundos');
ylabel('Radianes');
legend('Yaw medida', 'Yaw estimada');

% subplot(3, 1, 3);
% plot(t(1:10/T), Z(1, 1:10/T), '-.', 'LineWidth', 1.2)
% hold on
% plot(t(1:10/T), Zg(1, 1:10/T), '--', 'LineWidth', 1.2)
% title('Posición Yaw 0 - 10 Seg.');
% xlabel('Segundos');
% ylabel('Radianes');
% legend('Yaw', 'Yaw estimada');


figure(2)

subplot(2, 1, 1);
plot(t(1:200/T), Z(2, 1:200/T), '-.',  'LineWidth', 1.2)  % Línea azul gruesa
hold on
plot(t(1:200/T), Zg(2, 1:200/T), '--', 'LineWidth', 1.2)  % Línea roja punteada
title('Velocidad Yaw 0 - 200 Seg.');
xlabel('Segundos');
ylabel('Rad/Seg');
legend('Velocidad Yaw medida', 'Velocidad Yaw estimada');

subplot(2, 1, 2);
plot(t(1:50/T), Z(2, 1:50/T), '-.', 'LineWidth', 1.2)
hold on
plot(t(1:50/T), Zg(2, 1:50/T), '--', 'LineWidth', 1.2)
title('Velocidad Yaw 0 - 50 Seg.');
xlabel('Segundos');
ylabel('Rad/Seg');
legend('Velocidad Yaw medida', 'Velocidad Yaw estimada');

% subplot(3, 1, 3);
% plot(t(1:10/T), Z(2, 1:10/T), '-.', 'LineWidth', 1.2)
% hold on
% plot(t(1:10/T), Zg(2, 1:10/T), '--', 'LineWidth', 1.2)
% title('Velocidad Yaw 0 - 10 Seg.');
% xlabel('Segundos');
% ylabel('Rad/Seg');
% legend('Velocidad Yaw', 'Velocidad Yaw estimada');


% subplot(4, 1, 3);
% plot(t, Wg(1,:));
% hold on
% plot(t, Wg(2,:));
% title('PESOS, Wg 1 and Wg 2');

% % plot de s
% subplot(4, 1, 4);
% plot(t, s(:));
% title('s(:)');

% plot de de la entrada de control

% figure(2)
% plot(t, control(:));


% figure(3)
% plot(t, Z(2,:))
% hold on
% plot(t, Zg(2,:))
% title('VELOCIDAD, Z 2 and Zg 2');

% figure(4)
% plot(t, Z(1,:))
% hold on
% plot(t, Zg(1,:))
% title('POSICIÓN, Z 1 and Zg 1');

figure(5)
plot(t, s(:));
title('Superficie de Deslizamiento S');  % Corrección de la ortografía
xlabel('Tiempo (s)');  % Etiqueta del eje x
ylabel('S');  % Etiqueta del eje y
legend('Superficie de deslizamiento');  % Etiqueta de los datos
ymax = 1;
ymin = -1;
ylim([ymin ymax]);  % Establece los límites del eje y

figure(6)
% subplot(3, 1, 3);
plot(t(1:10/T), Z(1, 1:10/T), 'LineWidth', 1.2)
hold on
plot(t(1:10/T), Zg(1, 1:10/T), 'LineWidth', 1.2)
title('Posición Yaw 0 - 10 Seg.');
xlabel('Segundos');
ylabel('Radianes');
legend('Yaw medida', 'Yaw estimada');
grid on


figure(7)
% subplot(3, 1, 3);
plot(t(1:10/T), Z(2, 1:10/T), 'LineWidth', 1.2)
hold on
plot(t(1:10/T), Zg(2, 1:10/T), 'LineWidth', 1.2)
title('Velocidad Yaw 0 - 10 Seg.');
xlabel('Segundos');
ylabel('Rad/Seg');
legend('Velocidad Yaw medida', 'Velocidad Yaw estimada');
grid on


figure(8)
plot(t(1:50/T), control(1:50/T));
title('Señal de Control');  % Título de la gráfica
xlabel('Tiempo (s)');  % Etiqueta del eje x
ylabel('Control');  % Etiqueta del eje y
legend('Control');  % Etiqueta de los datos

figure(9)
error1 = Zt(1, :);  % Error de la primera fila
error2 = Zt(2, :);  % Error de la segunda fila
ISE1 = cumtrapz(t, error1.^2);  % Calcula el ISE acumulado para la primera fila
ISE2 = cumtrapz(t, error2.^2);  % Calcula el ISE acumulado para la segunda fila
plot(t, ISE1, 'LineWidth', 1.2);
hold on
plot(t, ISE2, 'LineWidth', 1.2);
title('Error Cuadrático Integral Acumulado');
xlabel('Tiempo (s)');
ylabel('ISE');
legend('ISE1', 'ISE2');
grid on

figure(10)
error1 = Zt(1, :);  % Error de la primera fila
error2 = Zt(2, :);  % Error de la segunda fila
IAE1 = cumtrapz(t, abs(error1));  % Calcula el IAE acumulado para la primera fila
IAE2 = cumtrapz(t, abs(error2));  % Calcula el IAE acumulado para la segunda fila
plot(t, IAE1, 'LineWidth', 1.2);
hold on
plot(t, IAE2, 'LineWidth', 1.2);
title('Error Absoluto Integral Acumulado');
xlabel('Tiempo (s)');
ylabel('IAE');
legend('IAE1', 'IAE2');
grid on


















































