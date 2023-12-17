clc;
clear;
close all;

files = dir('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/*.txt');

k1 = 0.05;
alpha1 = 1.5; % 1-2
alpha2 = 1.01; % >1 
beta1  = 1.3;
beta2  = 0.05;
gamma1 = 0.1;
sigma1 = 0.1;
sigma2 = 0.3;

T = 0.05;

yaw =  [];
yawVel = [];
yawAcc =  [];
yawDeseada = [];
control = [];
error = [];
t = [];

for file = files'
    archivo = fopen(fullfile(file.folder, file.name), 'r');
    data = textscan(archivo, 'yaw: %f Yaw vel: %f Yaw acc: %f yaw Deseada: %f Control: %f Error: %f');
    fclose(archivo);
   
    yaw = [yaw; data{1}];
    yawVel = [yawVel; data{2}];
    yawAcc = [yawAcc; data{3}];
    yawDeseada = [yawDeseada; data{4}];
    control = [control; data{5}];
    error = [control; data{6}];
    
end

t = 0:0.05:length(yaw)*0.05-0.05;
u = 0;


Z = [yaw'; 
     yawVel'];

Zg = zeros(2,1);

Zt = Z(:,1) - Zg;

phi =  [tanh(Zg(1,1));
        tanh(Zg(2,1))]


Wgp = zeros(2,1);        
Wg = zeros(2,1);
Wt = zeros(2,1);

W0 = [1; 
      0.5]; 

z1g = 0;
z2g = 0;    

u = 0;

for i = 1:length(t)-1
    s(i) = Zt(1,i) + k1*sign(Zt(2,i))*abs(Zt(2,i))^alpha1;
    
    z1gp = Zg(2,i)+ beta1*Zt(1,i);
    z2gp = Wg(:,i)'*phi(:,i) + u + beta2*sign(s(i)) + 1/(alpha1*k1)*sign(Zt(2,i))*abs(Zt(2,i))^(2-alpha2) + beta1/alpha1*Zt(2,i);
    
    z1g = z1g + T*z1gp;
    z2g = z2g + T*z2gp;
    
    Zg(:, i+1) = [z1g; 
                  z2g];

    phi(:, i+1) =  [tanh(Zg(:,i+1))];
    Zt(:, i+1) = Z(:, i+1) - Zg(:, i+1);

    Wgp(:,i+1) = gamma1*(alpha1*k1*abs(Zt(2, i+1))^(alpha1-1)*s(i)*phi(:,i+1)+sigma1*Wt(:,i) + sigma2*sign(Wt(:,i))); % W punt, derivada de los pesos estimados de la red escalar    
    Wg(:,i+1) = Wg(:,i) + T*Wgp(:,i+1); % W, pesos estimados de la red escalar
    Wt(:, i+1) = W0 - Wg(:,i+1);
end

% figura 1 ploteo de yaw vs yaw deseada
figure(1)
plot(t, yaw, 'b', t, Zg(1,:), 'r')

% grafico de los pesos Wg
figure(2)
plot(t, Wg(1,:), 'b', t, Wg(2,:), 'r')




