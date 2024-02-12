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


KT = 35.01;
KV = 2.5;
KS = 1.1;

DELTA_LIMITE_SUPERIOR = 3*1.3;
DELTA_LIMITE_INFERIOR = 3*1;

PPF_INICIO = 1;
PPF_FIN = 0.06;

T = 0.01;
m = 3;
n = 9;
l = 21;
c = 0.5;
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

q = 3*[ 1.0579+1;       1.2313+1;       -0.0123;
        0.5815+1;       1.3371+1;        0.1681;
        2.0201+1;       3.3460+1;        0.2113;
       -0.1792+1;       1.7710+1;        0.5225;
        0.8085+1;       0.8848+1;        2.2038;
        1.7998+1;       1.3196+1;        2.0627;
        2.4380+1;       3.1536+1;        2.3853;
        1.1991+1;       3.3141+1;        2.1780;
        1.2300;     3.5256; 0.6323+0.5];

figure(1)

for i = 1:n
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

d = zeros(l,1);

for i = 1:l
    d(i,1) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end

ppf  = (PPF_INICIO-PPF_FIN)*exp(-c*t)+PPF_FIN;
ppfp = -c*(PPF_INICIO-PPF_FIN)*exp(-c*t);

eijMas = DELTA_LIMITE_SUPERIOR*ppf(1);
eijMenos = DELTA_LIMITE_INFERIOR*ppf(1);

bmas = zeros(l,1);
bmenos = zeros(l,1);


for i = 1:l
    bmas(i) = (eijMas^2 + 2*d(i,1)*eijMas)/ppf(1);
    bmenos(i) = (2*d(i,1)*eijMenos - eijMenos^2 )/ppf(1);
end

vectorB = [bmenos, bmas] 

V = (1.1*(ones(1,m*n)))'; % velocidad inicial

v0 = [2*sin(0.35*t)',       2*(cos(0.35*t))',   ones(length(t),1)]'; % trayectoria
w0 = [zeros(length(t),1), zeros(length(t),1),  zeros(length(t),1)]';

X = [q; V];

Vfp = zeros(m*n, length(t)-1);
qt = zeros(m*n, length(t)-1);
e = zeros(l, length(t)-1);
eMas = zeros(l, length(t)-1);
eMenos = zeros(l, length(t)-1);
etaMas = zeros(l, length(t)-1);
etaMenos = zeros(l, length(t)-1);
eta = zeros(l, length(t)-1);
varphi = zeros(l, length(t)-1);
Ez = zeros(l, length(t)-1);
Ezp = zeros(l, length(t)-1);
Vf = zeros(m*n, length(t)-1);
S = zeros(m*n, length(t)-1);
tanH = zeros(m*n, length(t)-1);
Vfp2 = zeros(m*n, length(t)-1);
P = zeros(length(t)-1, n, 3);
eq = zeros(l, length(t)-1);



for i = 1:length(t)-1
    for k = 1:l
        qt(k*m-(m-1):m*k, i) = q(E(k,2)*m-2:E(k,2)*m, i) - q(E(k,1)*m-2:E(k,1)*m, i);
        e(k,i) = (norm(qt(k*m-(m-1):m*k, i)) - d(k));
        eq(k,i) = (norm(qt(k*m-(m-1):m*k, i)))^2 - d(k)^2;
        
        eMas(k,i) = - d(k) + (d(k)^2 + bmas(k)*ppf(i))^0.5;
        eMenos(k,i) = d(k) - (d(k)^2 - bmenos(k)*ppf(i))^0.5;

        etaMas(k,i) = eMas(k,i)^2 + 2*d(k)*eMas(k,i);
        etaMenos(k,i) = eMenos(k,i)^2 - 2*d(k)*eMenos(k,i);
        eta(k,i) = e(k,i)*(norm(qt(k*m-(m-1):m*k, i)) + d(k));

        varphi(k,i) = e(k,i)/ppf(i);
        varphi2(k,i) = eta(k,i)/ppf(i);
        Ez(k,i) = 1/2 * log((bmas(k)*varphi(k,i) + bmenos(k)*bmas(k))/(bmas(k)*bmenos(k)-bmenos(k)*varphi(k,i)));
        Ez2(k,i) = 1/2 * log((bmas(k)*varphi2(k,i) + bmenos(k)*bmas(k))/(bmas(k)*bmenos(k)-bmenos(k)*varphi2(k,i)));
    end
    
    qdin = qdinVector(E, qt(:,i), 9, l, m);
    
    for k = 1: n
        vd(k*m-2: k*m,1) = v0(:, i) + cross(w0(:, i), qdin(k*m-2:k*m,1));
    end
    
    R = matrizRCubo9AgentWithLeader(q(:,i),m);
    
    rho = eye(l).*((1/(2*ppf(i)))*(1./(varphi(:,i)+DELTA_LIMITE_INFERIOR) - 1./(varphi(:,i)-DELTA_LIMITE_SUPERIOR)));
    
    if i == 1
        rhop = rho/T;
        temp = rho;
    else
        rhop = (rho - temp)/T;
        temp = rho;
    end
    
    Vf(:,i) = -KV*R'*rho*Ez(:,i) + vd(:,1); %%%%%%%%%%%%% control con PPC
    % Vf(:,i) = -KV*R'*e(:,i) + vd(:,1);  %%%%%%%%%%%%% control sin PPC
    Zp = 2*R*V(:,i);
    Rp = matrizRCubo9AgentWithLeader(V(:,i),m);
    S(:,i) = V(:,i) - Vf(:,i);
    
    tanH = -KT*tanh(S(:,i));
    
    Ezp(:,i) = rho*(Zp-ppfp(i)*varphi(:,i));
    Vfp2(:,i) = -KV*(Rp'*rho*Ez(:,i) + R'*rhop*Ez(:,i) + R'*rho*Ezp(:,i));
    
    if i == 1
        Vfp(:,i) = Vf(:,i)/T;
    else
        Vfp(:,i) = (Vf(:,i) - Vf(:,i-1))/T;
    end
    
    u = -KS*S(:,i) - R'*rho*Ez + Vfp(:,i)+ tanH; %%%%%%%%%%%%% control con PPC agregando tanh
    % u = -KS*S(:,i) - R'*rho*Ez + Vfp(:,i); %%%%%%%%%%%%% control con PPC
    % u = -KS*S(:,i) + Vfp(:,i) - R'*e; %%%%%%%%%%%%% control sin PPC
    
    [tt, xx] = ode45(@systemDoubleIntegratorWithDisturbance, [t(i) t(i+1)], X(:,i), [], u(:,i), m, n);
    X(:, i+1) = xx(end, :)';
    q(:, i+1) = xx(end, 1:m*n)';
    V(:, i+1) = xx(end, m*n+1:2*m*n)';
    
    for j = 1:n
        P(i,j,:) = [q(j*3-2, end), q(j*3-1, end) , q(j*3, end)];
    end
end


% % plotea todos los agentes en 3D

figure(1)
plot3(12.28-(1/0.35)*v0(2,:)', 9.25 + (1/0.35)*v0(1,:)', 3*1.0+t(:),'LineStyle',"-.",'Color','red','LineWidth',2);
hold on
plot3(q(9*m-2,:), q(9*m-1,:), q(9*m,:),'LineStyle',"-",'Color','blue','LineWidth',2);


[grf, points] = Framework3Dplot(q(:,i), E); 

set(gca,'FontSize',14)
grid on
% view([-80,-90,45]);
xlabel('X-Axis [m]','FontSize',14)
ylabel('Y-Axis [m]','FontSize',14)
zlabel('Z-Axis [m]','FontSize',14)


figure(3)

for i = 1:l
    plot(t(1:end-1),e(i,:),"Linewidth",2) %
    hold on
end
plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
grid on
% title('Errores de distancia entre agentes')
set(gca,'FontSize',14)
xlabel('Time [sec]')
ylabel('Distance errors e_{ij} [m]')


figure(4)

for i = 1:l
    plot(t(1:end-1),e(i,:),"Linewidth",2) % 
    hold on
end
plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
grid on
axis([0 5 0 4])
set(gca,'FontSize',14)

figure(5)

for i = 1:l
    plot(t(1:end-1),e(i,:),"Linewidth",2) %
    hold on
end
plot(t(1:end-1),eMas(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
plot(t(1:end-1),-eMenos(1,1:end),'Color','r','LineWidth',2,'LineStyle','--')
hold on
grid on
axis([0 5 -3 0])
set(gca,'FontSize',14)


FFM = [0 0 1 1;
       0.55 0.58 0.35 0.35;
       0.55 0.11 0.35 0.35;];
fhv = [3:5];
newFig = 102;
hNew = lafig3(newFig, fhv, FFM);
close(3:5)


% plotea la variable bmas
for i = 1:l
    if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
        figure(29)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),e(i,:),"Linewidth",2) %% 9, 20
        hold on
        % val_E1 = E(i,:)
    end
    if i == 10 || i == 17
        figure(30)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),e(i,:),"Linewidth",2) %% 9, 20
        hold on
        % val_E1 = E(i,:)
    end
    if i == 1 || i == 2 || i == 4 || i == 5 || i == 7 || i == 8 || i == 11 || i == 13 || i == 14 || i == 16 || i == 19
        figure(31)
        plot(t(1:end-1),eMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),-eMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),e(i,:),"Linewidth",2) %% 9, 20
        hold on
        % val_E2 = E(i,:)
    end
end

% plotea la variable bmas
temp = 0;
for i = 1:l
    if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
        figure(32)
        plot(t(1:end-1),etaMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),etaMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),eta(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 14)
        ylabel('Error $\epsilon$', 'Interpreter', 'latex', 'FontSize', 14)
        for j = 1:length(etaMenos(i,:))
            if (eta(i,j) > etaMas(i,j) || eta(i,j) < etaMenos(i,j)) && temp ~= i
                temp = i
            end
        end
    end
    if i == 3 || i == 6 || i == 9 || i == 12 || i == 15 || i == 18 || i == 20 || i == 21
        figure(33)
        plot(t(1:end-1),etaMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),etaMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),eta(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 14)
        ylabel('Error $\epsilon$', 'Interpreter', 'latex', 'FontSize', 14)
        for j = 1:length(etaMenos(i,:))
            if (eta(i,j) > etaMas(i,j) || eta(i,j) < etaMenos(i,j)) && temp ~= i
                temp = i
            end
        end
        axis([1 6 -13.5 -3])
    end
    if i == 10 || i == 17
        figure(34)
        plot(t(1:end-1),etaMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),etaMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),eta(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 14)
        ylabel('Error $\epsilon$', 'Interpreter', 'latex', 'FontSize', 14)
        for j = 1:length(etaMenos(i,:))
            if (eta(i,j) > etaMas(i,j) || eta(i,j) < etaMenos(i,j)) && temp ~= i
                temp = i
            end
        end
        % val_E1 = E(i,:)
    end
    if i == 1 || i == 2 || i == 4 || i == 5 || i == 7 || i == 8 || i == 11 || i == 13 || i == 14 || i == 16 || i == 19
        figure(35)
        plot(t(1:end-1),etaMas(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),etaMenos(i,:),'Color','r','LineWidth',2,'LineStyle','--') %% 9, 20
        hold on
        plot(t(1:end-1),eta(i,:),"Linewidth",2) %% 9, 20
        hold on
        grid on
        xlabel('Time [Sec]', 'FontSize', 14)
        ylabel('Error $\epsilon$', 'Interpreter', 'latex', 'FontSize', 14)
        for j = 1:length(etaMenos(i,:))
            if (eta(i,j) > etaMas(i,j) || eta(i,j) < etaMenos(i,j)) && temp ~= i
                temp = i
            end
        end
    end
end


% %% plotea la variable varphi
% plotVarphi = figure(35);
% % plot(t(1:end-1),varphi(1,:),"Linewidth",2) %
% %% plotea todas las variables varphi
% for i = 1:l
%     plot(t(1:end-1),e(i,:),"Linewidth",2) %
%     hold on
% end

% figure(36);

% for i = 1:l
%     plot(t(1:end-1),Ez(i,:),"Linewidth",2) %
%     hold on
% end

% eq = figure(36);
% %% plotea la variable eq
% for i = 1:l
%     plot(t(1:end-1),eta(i,:),"Linewidth",2) %
%     hold on
% end

% figure(37);
% %% plotea la variable eq
% for i = 1:l
%     plot(t(1:end-1),eq(i,:),"Linewidth",2) %
%     hold on
% end

FFM = [0 0 1 1;
       0.38 0.47 0.55 0.45;];
fhv = [32:33];
newFig = 202;
hNew = lafig3(newFig, fhv, FFM);





