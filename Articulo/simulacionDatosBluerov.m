%Sliding Mode Control- CICLO

clc       
clear           % You can clear all variables
close all          % Is used to close all open figure windows

% Abre el archivo "datos.txt" para lectura ('r')
fid = fopen('control_2023-12-08_14-47.txt', 'r');

% Lee los datos del archivo. La cadena de formato especifica que cada línea debe tener
% la forma 'yaw: %f yaw Deseada: %f Control: %f Error: %f', donde %f es un número en punto flotante.
% textscan devuelve un cell array donde cada elemento es un array de los números leídos para cada %f.
data = textscan(fid, 'yaw: %f yaw Deseada: %f Control: %f Error: %f');

% Cierra el archivo
fclose(fid);

% Extrae los datos del cell array. data{1} contiene todos los números que se leyeron para el primer %f,
% data{2} para el segundo %f, y así sucesivamente.
yaw = data{1};
yawDeseada = data{2};
control = data{3};
error = data{4};



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



fin = 100;
T = 0.05;        % Paso de integración 
t = 0:T:length(yaw)*T-T;     % Vector de similitud

length(t)

u = 0; 

W0 = [1; 0.5]
% 0.5*ones(2,1);
Wg = zeros(2,1);
Wt = W0-Wg;
Z = yaw(1)*ones(2,1);
Zg = yaw(1)*ones(2,1);
phi(:, 1) = [ tanh(Zg(1, 1)); 
              tanh(Zg(2, 1))]; % funcion de activacion de la red vector

Zt = Z - Zg;

for i = 1:length(t)-1
    % [tt,xx] = ode45(@system, [t(i) t(i+1)], Z(:,i), [], u);

    [ttt,zz] = ode45(@identifier, [t(i) t(i+1)], Zg(:,i), [], u, Wg(:,i), phi(:,i), Zt(:, i),P(:));
    Zg(:, i+1) = zz(end, :)';
    % derivada de yaw
    yawp = (yaw(i+1)-yaw(i))/T;
    Z(:, i+1) = [yaw(i+1);
                yawp];

    Zt(:,i+1) = Z(:, i+1) - Zg(:, i+1);
    
    s(i+1) = Zt(1,i+1) + k1*sign(Zt(2, i+1))*abs(Zt(2, i+1))^alpha1; % sliding surface escalar
    phi(:, i+1) = tanh(Zg(:, i+1)); % funcion de activacion de la red vector

    Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i+1)*phi(:,i+1)+sigma1*Wt(:,i) + sigma2*sign(Wt(:,i))); % W punt, derivada de los pesos estimados de la red escalar
    Wg(:,i+1) = Wg(:,i) + Wgp(:,i+1)*T; % Wg, pesos estimados de la red escalar
    Wt(:,i+1) = W0 - Wg(:,i+1); % W tilde, error de pesos de la red
end

% figure(1)
% plot(t,Z(2,:))
% hold on
% plot(t,Zg(2,:))

% figure(2)
% plot(t(1:1000),Z(2,1:1000))
% hold on
% plot(t(1:1000),Zg(2,1:1000))

% figure(3)
% plot(t(end-1000:end),Z(2,end-1000:end))
% hold on
% plot(t(end-1000:end),Zg(2,end-1000:end))

figure(4)
plot(t,Z(1,:))
hold on
plot(t,Zg(1,:))

figure(7)
plot(t, Wg(1,:));
hold on
plot(t, Wg(2,:));

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
figure(10)
plot(t, yaw);

% plot de s


































% %Sliding Mode Control- CICLO

% clc       
% clear           % You can clear all variables
% close all          % Is used to close all open figure windows

% % % Abre el archivo "datos.txt" para lectura ('r')
% % fid = fopen('control_2023-12-08_14-47.txt', 'r');

% % % Lee los datos del archivo. La cadena de formato especifica que cada línea debe tener
% % % la forma 'yaw: %f yaw Deseada: %f Control: %f Error: %f', donde %f es un número en punto flotante.
% % % textscan devuelve un cell array donde cada elemento es un array de los números leídos para cada %f.
% % data = textscan(fid, 'yaw: %f yaw Deseada: %f Control: %f Error: %f');

% % % Cierra el archivo
% % fclose(fid);

% % % Extrae los datos del cell array. data{1} contiene todos los números que se leyeron para el primer %f,
% % % data{2} para el segundo %f, y así sucesivamente.
% % yaw = data{1};
% % yawDeseada = data{2};
% % control = data{3};
% % error = data{4};



% k1 = 0.01;
% alpha1 = 1.1; % 1-2
% alpha2 = 1.1; % >1 
% beta1  = 0.5;
% beta2  = 0.1;
% gamma1 = 0.6;
% sigma1 = 0.2;
% sigma2 = 0.001;

% P = [k1;
%      alpha1;
%      alpha2;
%      beta1;
%      beta2;
%      gamma1;
%      sigma1];

% fin = 100;
% T = 0.01;        % Paso de integración 
% t = 0:T:fin;     % Vector de similitud

% u = 0; 

% W0 = 0.5*ones(2,1);
% Wg = zeros(2,1);
% Wt = W0-Wg;
% Z = 0.5*ones(2,1);
% Zg = 0.2*ones(2,1);
% phi(:, 1) = [ tanh(Zg(1, 1)); 
%               tanh(Zg(2, 1))]; % funcion de activacion de la red vector

% Zt = Z - Zg;

% for i = 1:length(t)-1
%     [tt,xx] = ode45(@system, [t(i) t(i+1)], Z(:,i), [], u);

%     s = Zt(1,i) + k1*sign(Zt(2,i))*abs(Zt(2,i))^alpha1;

%     z1gp = Zg(2,i) + beta1*Zt(1,i);
%     z2gp = Wg(:,i)'*phi(:,i) + u + beta2*sign(s) + 1/(alpha1*k1)*sign(Zt(2,i))*abs(Zt(2,i))^(2-alpha1) + (beta1/alpha1)*Zt(2,i);

%     Zgp = [z1gp;
%            z2gp];

%     Z(:, i+1) = xx(end, :)';

%     % integracion de Zg
%     Zg(:, i+1) = Zg(:, i) + Zgp(:, 1)*T;
%     Zt(:,i+1) = Z(:, i+1) - Zg(:, i+1);
    
%     s = Zt(1,i+1) + k1*sign(Zt(2, i+1))*abs(Zt(2, i+1))^alpha1; % sliding surface escalar
%     phi(:, i+1) = tanh(Zg(:, i+1)); % funcion de activacion de la red vector

%     Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s*phi(:,i+1)+sigma1*Wt(:,i) + sigma2*Wg(:,i)*norm(Wg(:,i))); % W punt, derivada de los pesos estimados de la red escalar
%     Wg(:,i+1) = Wg(:,i) + Wgp(:,i+1)*T; % Wg, pesos estimados de la red escalar
%     Wt(:,i+1) = W0 - Wg(:,i+1); % W tilde, error de pesos de la red
% end

% figure(1)
% plot(t,Z(2,:))
% hold on
% plot(t,Zg(2,:))

% figure(2)
% plot(t(1:1000),Z(2,1:1000))
% hold on
% plot(t(1:1000),Zg(2,1:1000))

% figure(3)
% plot(t(end-1000:end),Z(2,end-1000:end))
% hold on
% plot(t(end-1000:end),Zg(2,end-1000:end))

% figure(4)
% plot(t,Z(1,:))
% hold on
% plot(t,Zg(1,:))

% figure(7)
% plot(t, Wg(1,:));
% hold on
% plot(t, Wg(2,:));

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