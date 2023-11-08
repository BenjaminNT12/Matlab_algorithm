%Sliding Mode Control- CICLO

clc       
clear           % You can clear all variables
close all          % Is used to close all open figure windows


k1 = 0.01;
alpha1 = 2.2; % >1
alpha2 = 0.9;  % <2
beta1  = 0.2;
beta2  = 0.2;
gamma1 = 0.2;
sigma1 = 0.9;

P = [k1;
     alpha1;
     alpha2;
     beta1;
     beta2;
     gamma1;
     sigma1];

fin = 1000;
T = 0.01;        % Paso de integración 
t = 0:T:fin;     % Vector de similitud

u = 0; 

W0 = 0.5*ones(2,1);
Wg = zeros(2,1);
Wt = W0-Wg;
Z = 0.5*ones(2,1);
phi(:, 1) = [ tanh(Z(1, 1)); 
              tanh(Z(2, 1))]; % funcion de activacion de la red vector

Zg = 0.2*ones(2,1);

Zt = Z - Zg;

for i = 1:length(t)-1
    % i
    [tt,xx] = ode45(@system, [t(i) t(i+1)], Z(:,i), [], u);
    [ttt,zz] = ode45(@identifier, [t(i) t(i+1)], Zg(:,i), [], u, Wg(:,i), phi(:,i), Zt(:, i),P(:));
    Z(:, i+1) = xx(end, :)';
    Zg(:, i+1) = zz(end, :)';

    Zt(:,i+1) = Z(:, i+1) - Zg(:, i+1);
    s = Zt(1) + k1*sign(Zt(2))*abs(Zt(2))^alpha1; % sliding surface escalar
    phi(:, i+1) = [ tanh(Z(1,i+1)); 
                    tanh(Z(2,i+1))]; % funcion de activacion de la red vector

    Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2))^(alpha1-1)*s*phi(:,i+1)+sigma1*Wt(:,i)); % W punt, derivada de los pesos estimados de la red escalar
    Wg(:,i+1) = Wg(:,i) + Wgp(:,i+1)*T; % Wg, pesos estimados de la red escalar
    Wt(:,i+1) = Wg(:,i+1) - Wg(:,i); % W tilde, error de pesos de la red
end

figure(1)
plot(t,Z(2,:))
hold on
plot(t,Zg(2,:))

figure(2)
plot(t(1:1000),Z(2,1:1000))
hold on
plot(t(1:1000),Zg(2,1:1000))

figure(3)
plot(t(end-1000:end),Z(2,end-1000:end))
hold on
plot(t(end-1000:end),Zg(2,end-1000:end))

