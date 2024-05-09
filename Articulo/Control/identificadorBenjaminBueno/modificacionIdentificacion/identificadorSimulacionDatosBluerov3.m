clc; 
clear;
close all;
% Obtiene una lista de todos los archivos en el directorio
files = dir('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/*.txt');

k1 = 0.09;
alpha1 = 1.7; % 1-2
alpha2 = 1.01; % >1 
beta1  = 1.3;
beta2  = 0.9;
gamma1 = 0.1;
gamma2 = 0.05; % se agrega un gamma2 para el calculo de Wgp
sigma1 = 0.1;
sigma2 = 0.3;
GAMMA = 0.005;



P = [k1;
     alpha1;
     alpha2;
     beta1;
     beta2;
     gamma1;
     gamma2;
     sigma1;
     sigma2;
     GAMMA];

u = 0; 

W10 = [1;
      0.5];

W20 = [1;
      0.5];

alpha = [alpha1;
         alpha2];

gamma = [gamma1;
         gamma2];

sigma = [sigma1;
         sigma2];
 
 
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

W1g = zeros(2,1);
W2g = zeros(2,1);
W1t = W10-W1g;
W2t = W20-W2g;
Z = yaw(1)*ones(2,1);
Zg = yaw(1)*ones(2,1);
phi(:, 1) = 0.5*[ tanh(Zg(1, 1)); 
              tanh(Zg(2, 1))]; % funcion de activacion de la red vector

psi(:, 1) = [ tanh(Zg(1, 1)); 
              tanh(Zg(2, 1))]; % funcion de activacion de la red vector

Zt = Z - Zg;
s = Zt(1) + k1*sign(Zt(2))*abs(Zt(2))^alpha(1);
W1gp = zeros(2,1);
W2gp = zeros(2,1);

for i = 1:length(t)-1
    [ttt,zz] = ode45(@identifier, [t(i) t(i+1)], Zg(:,i), [], u, W1g(:,i), W2g(:,i), phi(:,i), psi(:,i), Zt(:, i),P(:),s(i));
    Zg(:, i+1) = zz(end, :)';

    Z(:, i+1) = [yaw(i);
                 yawVel(i)];

    Zt(:, i+1) = Z(:, i+1) - Zg(:, i+1);
    
    s(i+1) = Zt(1, i+1) + k1*sign(Zt(2, i+1))*abs(Zt(2, i+1))^alpha(1); 
    phi(:, i+1) = 0.5*tanh(Zg(:, i+1)); % funcion de activacion de la red vector
    psi(:, i+1) = tanh(Zg(:, i+1)); % funcion de activacion de la red vector

    % ley de actualizacion de pesos
    % Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i+1)*phi(:,i+1)+sigma1*Wt(:,i) + sigma2*sign(Wt(:,i))); % W punt, 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    W1gp(:,i+1) = gamma(1)*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i+1)*phi(:,i+1)+sigma(1)*W1t(:,i) + sigma(1)*sign(W1t(:,i)));% W punt, 
    W2gp(:,i+1) = gamma(2)*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i+1)*psi(:,i+1)+sigma(2)*W2t(:,i) + sigma(2)*sign(W2t(:,i))); % W punt, 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

    % pesos W1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    W1g(:,i+1) = W1g(:,i) + W1gp(:,i+1)*T; % Wg, pesos estimados de la red escalar
    W1t(:,i+1) = W10 - W1g(:,i+1); % W tilde, error de pesos de la red
    
    % pesos W2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    W2g(:,i+1) = W2g(:,i) + W2gp(:,i+1)*T; % Wg, pesos estimados de la red escalar
    W2t(:,i+1) = W20 - W2g(:,i+1); % W tilde, error de pesos de la red
end


figure(1)

subplot(7, 1, 1);
% plot(t, yawDeseada(:))
% hold on
plot(t, Z(1,:))
hold on
plot(t, Zg(1,:))
title('POSITION, Z 1 and Zg 1');

subplot(7, 1, 2);
% plot(t, yawVel(:))
% hold on
plot(t, Z(2,:))
hold on
plot(t, Zg(2,:))
title('SPEED, Z 2 and Zg 2');

subplot(7, 1, 3);
plot(t, W1g(1,:));
hold on
plot(t, W1g(2,:));
title('WEIGHTS, Wg 1 and Wg 2');

subplot(7, 1, 4);
plot(t, W2g(1,:));
hold on
plot(t, W2g(2,:));
title('WEIGHTS, Wg 1 and Wg 2');

% plot de s
subplot(7, 1, 5);
plot(t, s(:));
title('s(:)');

subplot(7,1,6)
plot(t, Zt(1,:));
title("\textbf{IDENTIFICATION ERROR}, $\tilde{\zeta}_1$",'Interpreter','latex', FontSize=12);
xlabel('Tiempo segundos')
ylabel('Error')
leg1 = legend('$\tilde{\zeta}_1$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
ylim([-1 1])
grid on

subplot(7,1,7)

plot(t, Zt(2,:), Color='#D95319');
title("\textbf{IDENTIFICATION ERROR}, $\tilde{\zeta}_2$",'Interpreter','latex', FontSize=12);
xlabel('Tiempo segundos')
ylabel('Error')
leg1 = legend('$\tilde{\zeta}_2$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
ylim([-1 1])
grid on


% plot de de la entrada de control

% figure(2)
% plot(t, control(:));


% figure(3)
% plot(t, Z(2,:))
% hold on
% plot(t, Zg(2,:))
% title('SPEED, Z 2 and Zg 2');

% figure(4)
% plot(t, Z(1,:))
% hold on
% plot(t, Zg(1,:))
% title('POSITION, Z 1 and Zg 1');

% figure(5)
% plot(t, s(:));
% title('s');
% ymax = 1;
% ymin = -1;
% % Establece los límites del eje x
% ylim([ymin ymax]); 



% figure(6)
% plot(t, W1g(1,:),LineWidth=2.9);
% hold on
% plot(t, W1g(2,:), LineWidth=2.9);
% title('Pesos de la red, $\hat{W}_1$, $\hat{W}_2$','Interpreter','latex');
% xlabel('Tiempo segundos')
% ylabel('Pesos de la red')
% leg1 = legend('$\hat{W}_1$','$\hat{W}_2$');
% set(leg1,'Interpreter','latex');
% set(leg1,'FontSize',17);
% grid on

% figure(7)


% subplot(2,1,1)
% plot(t, Zt(1,:));
% title("Error de identificaci\'on, $\tilde{\zeta}_1$",'Interpreter','latex', FontSize=14);
% xlabel('Tiempo segundos')
% ylabel('Error')
% leg1 = legend('$\tilde{\zeta}_1$');
% set(leg1,'Interpreter','latex');
% set(leg1,'FontSize',17);
% ylim([-1 1])
% grid on

% subplot(2,1,2)

% plot(t, Zt(2,:), Color='#D95319');
% title("Error de identificaci\'on, $\tilde{\zeta}_2$",'Interpreter','latex', FontSize=14);
% xlabel('Tiempo segundos')
% ylabel('Error')
% leg1 = legend('$\tilde{\zeta}_2$');
% set(leg1,'Interpreter','latex');
% set(leg1,'FontSize',17);
% ylim([-1 1])
% grid on

figure(2)
plot(t, Z(1,:))
hold on
plot(t, Zg(1,:))
title('POSITION, Z 1 and Zg 1');

figure(3)
% plot(t, yawVel(:))
% hold on
plot(t, Z(2,:))
hold on
plot(t, Zg(2,:))
title('SPEED, Z 2 and Zg 2');