% FILEPATH: /home/nicolas/Github/Matlab_algorithm/Tesis/Matlab/PrescribedPerformanceControlMultiagent/PrescribedPerformanceControl_Multiagent_test.m
% This script implements a multi-agent system with prescribed performance control.
% The agents are modeled as double integrators and the control objective is to make
% them track a desired trajectory while maintaining a certain formation. The control
% law is based on a prescribed performance function and a Lyapunov function. The
% script generates random initial positions for the agents and plots their
% trajectories in 3D.
%
% Inputs:
%   - None
%
% Outputs:
%   - None
%
% Author: Benjamin Nicolas Trinidad
% Date: August 2023
clear;
close all;
clc;

if ~exist('parpool', 'file')
    error('Parallel Computing Toolbox no está disponible.');
end
% Ktang = 3;
% Ksigma = 0.1;
% Kv = 0.15;
% TAU_sigma = 3.7;
Ktang = 16;
Ksigma = 5;
Kv = 0.3;
TAU_sigma = 1.9723;

DELTA_LIMITE_SUPERIOR = 3*1.3;
DELTA_LIMITE_INFERIOR = 3*1;

PPF_INICIO = 1;
PPF_FIN = 0.07;

T = 0.01;
m = 3;
n = 9;
l = 21;
c = 0.9;
fin = 30;
t = 0: T :fin;


qd1 = 3*[-1, -1, -1];
qd2 = 3*[ 1, -1, -1];
qd3 = 3*[ 1,  1, -1];
qd4 = 3*[-1,  1, -1];
qd5 = 3*[-1, -1,  1];
qd6 = 3*[ 1, -1,  1];
qd7 = 3*[ 1,  1,  1];
qd8 = 3*[-1,  1,  1];
qd9 = 3*[ 0,  0,  0];

qd = [qd1'; qd2'; qd3'; qd4'; qd5'; qd6'; qd7'; qd8'; qd9'];

E1   = [1 4]; E2   = [1 5]; E3   = [1 9];
E4   = [2 3]; E5   = [2 6]; E6   = [2 9];
E7   = [3 4]; E8   = [3 7]; E9   = [3 9];
E10  = [4 5]; E11  = [4 8]; E12  = [4 9];
E13  = [5 6]; E14  = [5 8]; E15  = [5 9];
E16  = [6 7]; E17  = [6 8]; E18  = [6 9];
E19  = [7 8]; E20  = [7 9]; E21  = [8 9];

E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18; E19; E20; E21];

p = 3*[ 1.0579+1;       1.2313+1;       -0.0123;
        0.5815+1;       1.3371+1;        0.1681;
        2.0201+1;       3.3460+1;        0.2113;
       -0.1792+1;       1.7710+1;        0.5225;
        0.8085+1;       0.8848+1;        2.2038;
        1.7998+1;       1.3196+1;        2.0627;
        2.4380+1;       3.1536+1;        2.3853;
        1.1991+1;       3.3141+1;        2.1780;
        1.2300;         3.5256;     0.6323+0.5];

figure(1)

for i = 1:n
    plot3(p(i*m-2), p(i*m-1), p(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

d = zeros(l,1);

for i = 1:l
    d(i,1) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end

chi  = (PPF_INICIO-PPF_FIN)*exp(-c*t)+PPF_FIN;
ppfp = -c*(PPF_INICIO-PPF_FIN)*exp(-c*t);

eijMas = DELTA_LIMITE_SUPERIOR*chi(1);
eijMenos = DELTA_LIMITE_INFERIOR*chi(1);

bmas = zeros(l,1);
bmenos = zeros(l,1);


for i = 1:l
    bmas(i) = (eijMas^2 + 2*d(i,1)*eijMas)/chi(1);
    bmenos(i) = (2*d(i,1)*eijMenos - eijMenos^2 )/chi(1);
end

V = (1.1*(ones(1,m*n)))'; % velocidad inicial
% V = [
%     0.2786; 0.7190; 0.8849; 
%     0.7418; 1.0539; 1.0164; 
%     0.5796; 0.7611; 0.2201; 
%     1.4793; 0.4173; 0.3381;
%     0.6841; 0.4576; 0.8366;
%     0.6413; 1.4371; 1.3964;
%     0.2685; 1.1592; 0.5499;
%     0.7497; 0.9122; 1.4256;
%     0.7431; 1.4780; 0.5919
% ];
% V = 1.09 + 0.01*rand(m*n, 1);

v0 = [2*sin(0.35*t)',       2*(cos(0.35*t))',   ones(length(t),1)]'; % trayectoria
w0 = [zeros(length(t),1), zeros(length(t),1),  zeros(length(t),1)]';

X = [p; V];

Vvp = zeros(m*n, length(t)-1);
qt = zeros(m*n, length(t)-1);
e = zeros(l, length(t)-1);
eMas = zeros(l, length(t)-1);
eMenos = zeros(l, length(t)-1);
etaMas = zeros(l, length(t)-1);
etaMenos = zeros(l, length(t)-1);
zeta = zeros(l, length(t)-1);
gammaV = zeros(l, length(t)-1);
Ezp = zeros(l, length(t)-1);
Vv = zeros(m*n, length(t)-1);
sigma = zeros(m*n, length(t)-1);
tanH = zeros(m*n, length(t)-1);
Vfp2 = zeros(m*n, length(t)-1);
P = zeros(length(t)-1, n, 3);
epsilon = zeros(l, length(t)-1);
etaij = zeros(l, length(t)-1);


for i = 1:length(t)-1
    for j = 1:l
        qt(j*m-(m-1):m*j, i) = p(E(j,2)*m-2:E(j,2)*m, i) - p(E(j,1)*m-2:E(j,1)*m, i);
        e(j,i) = (norm(qt(j*m-(m-1):m*j, i)) - d(j));
        epsilon(j,i) = e(j,i)*(e(j,i)+2*d(j));
        
        eMas(j,i) = - d(j) + (d(j)^2 + bmas(j)*chi(i))^0.5;
        eMenos(j,i) = d(j) - (d(j)^2 - bmenos(j)*chi(i))^0.5;

        etaMas(j,i) = eMas(j,i)^2 + 2*d(j)*eMas(j,i);
        etaMenos(j,i) = eMenos(j,i)^2 - 2*d(j)*eMenos(j,i);

        zeta(j,i) = epsilon(j,i)/chi(i);
        gammaV(j,i) = 1/2 * log((bmas(j)*zeta(j,i) + bmenos(j)*bmas(j))/(bmas(j)*bmenos(j)-bmenos(j)*zeta(j,i)));
    end
    
    qtin = qtinVector(E, qt(:,i), 9, l, m);
    
    for k = 1: n
        vd(k*m-2: k*m,1) = v0(:, i) + cross(w0(:, i), qtin(k*m-2:k*m,1));
    end
    % errorV() = 
    R = matrizRCubo9AgentWithLeader(p(:,i),m);
    % rango = rank(R)
    for j = 1:l
        etaij(j,i) = (1/(chi(i)))*(1/(zeta(j,i)+bmenos(j)) - 1/(zeta(j,i)-bmas(j)));
    end
    eta = eye(l).*etaij(:,i);

    if i == 1
        rhop = eta/T;
        temp = eta;
    else
        rhop = (eta - temp)/T;
        temp = eta;
    end
    
    Vv(:,i) = -Kv*R'*eta'*gammaV(:,i) + vd(:,1); %%%%%%%%%%%%% control con PPC %%% SE USA
    sigma(:,i) = V(:,i) - Vv(:,i);
    
    if i == 1
        Vvp(:,i) = Vv(:,i)/T;
    else
        Vvp(:,i) = (Vv(:,i) - Vv(:,i-1))/T;
    end
    
    u = Vvp(:,i) - R'*eta'*gammaV - ((TAU_sigma^2)/2 + Ksigma )*sigma(:,i) - Ktang*tanh(sigma(:,i)); %%%%%%%%%%%%% control con PPC agregando tanh
    
    [tt, xx] = ode45(@systemDoubleIntegratorWithDisturbance, [t(i) t(i+1)], X(:,i), [], u(:,i), m, n);
    X(:, i+1) = xx(end, :)';
    p(:, i+1) = xx(end, 1:m*n)';
    V(:, i+1) = xx(end, m*n+1:2*m*n)';
    
    for j = 1:n
        P(i,j,:) = [p(j*3-2, end), p(j*3-1, end) , p(j*3, end)];
    end
end


% % plotea todos los agentes en 3D
% f = figure(1);
% plotAnimation(P, v0, t, p, E, f)


figure(1)
plot3(12.08-(1/0.35)*v0(2,:)', 9.4 + (1/0.35)*v0(1,:)', 3.5*1.0+t(:),'LineStyle',"-.",'Color','red','LineWidth',2);
hold on
plot3(p(9*m-2,:), p(9*m-1,:), p(9*m,:),'LineStyle',"-",'Color','blue','LineWidth',2);


[grf, points] = Framework3Dplot(p(:,i), E); 

set(gca,'FontSize',14)
grid on
% view([-80,-90,45]);
xlabel('X-Axis [m]','FontSize',14)
ylabel('Y-Axis [m]','FontSize',14)
zlabel('Z-Axis [m]','FontSize',14)



% plotea la variable bmas
temp = 0;
for i = 1:l
    if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
        figure(32)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 18)
        ylabel('Error $e_{ij}$', 'Interpreter', 'latex', 'FontSize', 18)
        for j = 1:length(etaMenos(i,:))
            if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
                temp = i
            end
        end
    end
    if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
        figure(33)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 18)
        ylabel('Error $e_{ij}$', 'Interpreter', 'latex', 'FontSize', 18)
        for j = 1:length(etaMenos(i,:))
            if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
                temp = i
            end
        end
        axis([0.8 5 -1.5 0.1])
    end
    if i == 10 || i == 17
        figure(34)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 18)
        ylabel('Error $e_{ij}$', 'Interpreter', 'latex', 'FontSize', 18)
        for j = 1:length(etaMenos(i,:))
            if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
                temp = i
            end
        end
        % val_E1 = E(i,:)
    end
    if i == 1 || i == 2 || i == 4 || i == 5 || i == 7 || i == 8 || i == 11 || i == 13 || i == 14 || i == 16 || i == 19
        figure(35)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 18)
        ylabel('Error $e_{ij}$', 'Interpreter', 'latex', 'FontSize', 18)
        for j = 1:length(etaMenos(i,:))
            if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
                temp = i
            end
        end
    end
end

FFM = [0 0 1 1;
0.38 0.57 0.55 0.35;];
fhv = [32:33];
newFig = 202;
hNew = lafig3(newFig, fhv, FFM);




% temp = 0;
% % plotea la variable bmas
% for i = 1:l
%     if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
%         figure(29)
%         plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
%         hold on
%         for j = 1:length(eMas(i,:))
%             if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
%                 temp = i
%             end
%         end
%         grid on
%     end
%     if i == 10 || i == 17
%         figure(30)
%         plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
%         hold on
%         for j = 1:length(eMas(i,:))
%             if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
%                 temp = i
%             end
%         end
%         grid on
%     end
%     if i == 1 || i == 2 || i == 4 || i == 5 || i == 7 || i == 8 || i == 11 || i == 13 || i == 14 || i == 16 || i == 19
%         figure(31)
%         plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
%         hold on
%         plot(t(1:end-1), e(i,:),"Linewidth",2) %% 9, 20
%         hold on
%         grid on
%         for j = 1:length(eMas(i,:))
%             if (e(i,j) > eMas(i,j) || e(i,j) < -eMenos(i,j)) && temp ~= i
%                 temp = i
%             end
%         end
%     end
% end

% figure(3)

% for i = 1:l
%     plot(t(1:end-1),e(i,:),"Linewidth",2) %
%     hold on
% end
% plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% grid on
% % title('Errores de distancia entre agentes')
% set(gca,'FontSize',14)
% xlabel('Time [sec]')
% ylabel('Distance errors e_{ij} [m]')


% figure(4)

% for i = 1:l
%     plot(t(1:end-1),e(i,:),"Linewidth",2) % 
%     hold on
% end
% plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% grid on
% axis([0 5 0 4])
% set(gca,'FontSize',14)

% figure(5)

% for i = 1:l
%     plot(t(1:end-1),e(i,:),"Linewidth",2) %
%     hold on
% end
% plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
% hold on
% grid on
% axis([0 5 -3 0])
% set(gca,'FontSize',14)


% FFM = [0 0 1 1;
%        0.55 0.58 0.35 0.35;
%        0.55 0.11 0.35 0.35;];
% fhv = [3:5];
% newFig = 102;
% hNew = lafig3(newFig, fhv, FFM);
% close(3:5)






% Grafica para calcular la norma de la velocidad v0 - V de cada agente
figure(12)
% Grafica para calcular la norma de la velocidad v0 - V de cada agente
e(:,3001) = 0;
for i = 1:length(t)
    sum = 0;
    for k = 1:l
        sum = norm(e(k,i))+sum;
    end
    ISE(i) = sum^2;
end
semilogy(t, ISE, 'Linewidth',2)

fileID = fopen('ISE_datos.txt','r');
formatSpec = '%f';
ISE2 = fscanf(fileID,formatSpec);
hold on
semilogy(t, ISE2, 'Linewidth',2)


set(gca,'FontSize',14)
xlabel('Time [sec]');
ylabel({'\fontsize{14}{21}$\sum^{N}_{i=1}||e_{ij}||^2$'},'Interpreter','latex');
grid on



% Grafica para calcular la norma de la velocidad v0 - V de cada agente
figure(13)
% Grafica para calcular la norma de la velocidad v0 - V de cada agente
e(:,3001) = 0;
for i = 1:length(t)
    sum = 0;
    for k = 1:l
        sum = norm(e(k,i))+sum;
    end
    ITAE(i) = sum*t(i);
end
semilogy(t, ITAE, 'Linewidth',2)

fileID = fopen('ITAE_datos.txt','r');
formatSpec = '%f';
ITAE2 = fscanf(fileID,formatSpec);
hold on
semilogy(t, ITAE2, 'Linewidth',2)


set(gca,'FontSize',14)
xlabel('Time [sec]');
ylabel({'\fontsize{14}{21}$\sum^{N}_{i=1}||e_{ij}||t(i)$'},'Interpreter','latex');
grid on





figure(14)
view([-45,-90,60]);% Quitar comentario si se quiere una venta adaptable
axis([-4 4 -4 4 -4 4]) % Quitar comentario si se quiere una venta adaptable
grid on
[grf, points] = Framework3Dplot(qd(:,1), E);

set(gca,'FontSize',14)
xlabel('X-Axis [m]','FontSize',14)
ylabel('Y-Axis [m]','FontSize',14)
zlabel('Z-Axis [m]','FontSize',14)


