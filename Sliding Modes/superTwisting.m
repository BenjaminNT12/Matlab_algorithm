%Sliding Mode Control- CICLO

clc       
clear           % You can clear all variables
close all          % Is used to close all open figure windows

m = 1.4;           %masa del UAS
g = 9.81;          %fuerza gravitatoria (9.81 m/s^2) 
k1 = 3.5;          % Ganancia 1
k2 = 6;            % Ganancia 2 
beta_1 = 0.25; 

T = 0.01;          % Paso de integración 
t = [0:T:120];     % Vector de similitud

x = [0;
     0];
y = [0;
     0];
z = [0;
     0];    % Condiciones Iniciales


psi = [0;
       0];
theta = [0;
         0];
phi = [0;
       0];

X(1:2,1) = x;
X(3:4,1) = y;
X(5:6,1) = z;
X(7:8,1) = psi;
X(9:10,1) = theta;
X(11:12,1) = phi;

z1d = (0.5 * square(pi*0.0333*t, 50)) + 1.5; % Control de entrada
z1dp = zeros(1,length(t));  % Derivada de z1 deseado
z1dpp = zeros(1,length(t)); 


for i = 1:length(t)-1
    e(i) = z(1,i) - z1d(i);         
    ep(i) = z(2,i) - z1dp(i);
    s(i) = ep(i) + beta_1*e(i);

    ust(i) = (m/(cos(theta(1,i))*cos(phi(1,i))))*(g + z1dpp(i)- beta_1*ep(i) - k1*(sqrt(abs(s(i)))*sign(s(i))) - k2*trapz(sign(s(i))));

    [tt,zz] = ode45(@quadCopterModel2Order, [t(i) t(i+1)], X(:,i), [], ust(i));
    X(:, i+1) = zz(end, :)';
    x(1:2,i+1) = X(1:2,i+1);
    y(1:2,i+1) = X(3:4,i+1);
    z(1:2,i+1) = X(5:6,i+1);
    psi(1:2,i+1) = X(7:8,i+1);
    theta(1:2,i+1) = X(9:10,i+1);
    phi(1:2,i+1) = X(11:12,i+1);
end

plot(t,z(1,:),'b',t,z1d,'r','LineWidth',2)
ylim([0 2])
% plot(t,z1d,'LineWidth',2)
