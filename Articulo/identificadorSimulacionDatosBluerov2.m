clc; 
clear;
close all;
% Obtiene una lista de todos los archivos en el directorio
files = dir('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/*.txt');

k1 = 0.03;
alpha1 = 1.05; % 1-2
alpha2 = 1.01; % >1 
beta1  = 0.1;
beta2  = 0.1;
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


Wg = zeros(2,1);
Wt = W0-Wg;
Z = yaw(1)*ones(2,1);
Zg = yaw(1)*ones(2,1);
phi(:, 1) = [ tanh(Zg(1, 1)); 
              tanh(Zg(2, 1))]; % funcion de activacion de la red vector

Zt = Z - Zg;

for i = 1:length(t)-1
    [ttt,zz] = ode45(@identifier, [t(i) t(i+1)], Zg(:,i), [], u, Wg(:,i), phi(:,i), Zt(:, i),P(:));
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


figure(1)

subplot(4, 1, 1);
% plot(t, yawDeseada(:))
% hold on
plot(t, Z(1,:))
hold on
plot(t, Zg(1,:))
title('POSICIÓN, Z(1,:) and Zg(1,:)');

subplot(4, 1, 2);
% plot(t, yawVel(:))
% hold on
plot(t, Z(2,:))
hold on
plot(t, Zg(2,:))
title('VELOCIDAD, Z(2,:) and Zg(2,:)');

subplot(4, 1, 3);
plot(t, Wg(1,:));
hold on
plot(t, Wg(2,:));
title('PESOS, Wg(1,:) and Wg(2,:)');

% plot de s
subplot(4, 1, 4);
plot(t, s(:));
title('s(:)');

% figure(1)
% % plot(t, yawDeseada(:))
% % hold on
% plot(t, Z(1,:))
% hold on
% plot(t, Zg(1,:))

% figure(2)
% % plot(t, yawVel(:))
% % hold on
% plot(t, Z(2,:))
% hold on
% plot(t, Zg(2,:))

% figure(3)
% plot(t, Wg(1,:));
% hold on
% plot(t, Wg(2,:));

% % plot de s
% figure(4)
% plot(t, s(:));


































% figure(8)
% plot(t, Wgp(1,:));
% hold on
% plot(t, Wgp(2,:));

% figure(9)

% % Primer gráfico
% subplot(2, 1, 1); % Divide la figura en una cuadrícula de 2 filas y 1 columna, y crea el primer gráfico en la primera fila
% plot(t, Zt(1,:));
% title('Zt1'); % Opcional: añade un título al gráfico

% % Segundo gráfico
% subplot(2, 1, 2); % Divide la figura en una cuadrícula de 2 filas y 1 columna, y crea el segundo gráfico en la segunda fila
% plot(t, Zt(2,:));
% title('Zt2'); 

% plot de yaw
% figure(10)
% plot(t, yaw);

% plot de s



