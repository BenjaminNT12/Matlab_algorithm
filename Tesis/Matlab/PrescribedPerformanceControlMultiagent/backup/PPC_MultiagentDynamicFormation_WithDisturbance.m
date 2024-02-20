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

KT = 50.2;
KV = 0.3;
KS = 0.5;
MAX_ERROR_INICIAL = 1;

DELTA_LIMITE_SUPERIOR = 1.2;
DELTA_LIMITE_INFERIOR = 0.7;

PPF_INICIO = 1;
PPF_FIN = 0.17;

T = 0.01;
m = 3;
n = 9;
l = 21;
c = 2.1;
fin = 10;
t = 0: T :fin;


qd1 = [-1, -1, -1];
qd2 = [ 1, -1, -1];
qd3 = [ 1,  1, -1];
qd4 = [-1,  1, -1];
qd5 = [-1, -1,  1];
qd6 = [ 1, -1,  1];
qd7 = [ 1,  1,  1];
qd8 = [-1,  1,  1];
qd9 = [ 0,  0,  0];

qd = [qd1'; qd2'; qd3'; qd4'; qd5'; qd6'; qd7'; qd8'; qd9'];

E1   = [1 4]; E2   = [1 5]; E3   = [1 9];
E4   = [2 3]; E5   = [2 6]; E6   = [2 9];
E7   = [3 4]; E8   = [3 7]; E9   = [3 9];
E10  = [4 5]; E11  = [4 8]; E12  = [4 9];
E13  = [5 6]; E14  = [5 8]; E15  = [5 9];
E16  = [6 7]; E17  = [6 8]; E18  = [6 9];
E19  = [7 8]; E20  = [7 9]; E21  = [8 9];

E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18; E19; E20; E21];

% q1 = qd1 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q2 = qd2 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q3 = qd3 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q4 = qd4 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q5 = qd5 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q6 = qd6 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q7 = qd7 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q8 = qd8 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);
% q9 = qd9 + MAX_ERROR_INICIAL*(rand(1,m) - 1.05);

% q = [q1'; q2'; q3'; q4'; q5'; q6'; q7'; q8'; q9'];

q = [   1.0579+1; 1.2313+1; 0.0123;
        1.5815+1; 1.3371+1; 0.1681;
        2.0201+1; 3.3460+1; 0.2113;
        0.1792+1; 2.7710+1; 0.5225;
        0.8085+1; 0.8848+1; 2.2038;
        2.7998+1; 1.3196+1; 2.0627;
        2.4380+1; 3.1536+1; 2.3853;
        0.3991+1; 3.1141+1; 2.1780;
        1.4800;   2.3256;  1.2323];

figure(1)

for i = 1:n
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

for i = 1:l
    d(i,1) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end

ppf  = (PPF_INICIO-PPF_FIN)*exp(-c*t)+PPF_FIN;
ppfp = -c*(PPF_INICIO-PPF_FIN)*exp(-c*t);

V = (3.2*(rand(1,m*n)))'; % velocidad inicial

v0 = [2*sin(t)',         2*(cos(t))', ones(length(t),1)]'; % trayectoria
w0 = [zeros(length(t),1), zeros(length(t),1),  zeros(length(t),1)]';

X = [q; V];

% ruido = noise(length(t))+pi*sin(t);
% ruidoVector(:,1) = ones(n*m,1)*ruido;

for i = 1:length(t)-1
    for k = 1:l
        qt(k*m-(m-1):m*k, i) = q(E(k,1)*m-2:E(k,1)*m, i) - q(E(k,2)*m-2:E(k,2)*m, i);
        e(k,i) = norm(qt(k*m-(m-1):m*k, i)) - d(k);
        Z(k,1) = e(k,i)*(e(k,i)+2*d(k));
        varphi(k,i) = e(k,i)/ppf(i);
        Ez(k,i) = 1/2 * log((DELTA_LIMITE_SUPERIOR*varphi(k,i) + DELTA_LIMITE_INFERIOR*DELTA_LIMITE_SUPERIOR)/(DELTA_LIMITE_SUPERIOR*DELTA_LIMITE_INFERIOR-DELTA_LIMITE_INFERIOR*varphi(k,i)));
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
    S = V(:,i) - Vf(:,i);

    tanH = -KT*tanh(S);
    
    Ezp(:,i) = rho*(Zp-ppfp(i)*varphi(:,i));
    Vfp2(:,i) = -KV*(Rp'*rho*Ez(:,i) + R'*rhop*Ez(:,i) + R'*rho*Ezp(:,i)); 
    
    if i == 1
        Vfp(:,i) = Vf(:,i)/T;
    else
        Vfp(:,i) = (Vf(:,i) - Vf(:,i-1))/T;
    end
    
    u = -KS*S - R'*rho*Ez + Vfp(:,i) + tanH; %%%%%%%%%%%%% control con PPC agregando tanh
    % u = -KS*S - R'*rho*Ez + Vfp(:,i); %%%%%%%%%%%%% control con PPC
    % u = -KS*S + Vfp(:,i) - R'*e; %%%%%%%%%%%%% control sin PPC

    [tt, xx] = ode45(@systemDoubleIntegratorWithDisturbance, [t(i) t(i+1)], X(:,i), [], u(:,i), m, n);
    X(:, i+1) = xx(end, :)';
    q(:, i+1) = xx(end, 1:m*n)';
    V(:, i+1) = xx(end, m*n+1:2*m*n)';
    
    for j = 1:n
        P(i,j,:) = [q(j*3-2, end), q(j*3-1, end) , q(j*3, end)];
    end
end



% f = figure(1);
% view([-45,-90,45]);
% f.Position = [500 500 1000 1250];
% axis([1 10 1 10 0 26])
% % vid = VideoWriter("DynamicAdquisitionPPC_Control.avi", 'Motion JPEG AVI'); %% Comentar para guardar video
% % open(vid) %% Comentar para guardar video
% grid on

% h9 = animatedline('LineStyle',"-.",'Color','#072a16','LineWidth',1.5);
% trajectory = animatedline('LineStyle',"-",'Color','#d95319','LineWidth',1.5);

% leader = 9
% for i = 1: length(P(:,1,1))

%     addpoints(h9, P(i,9,1), P(i,9,2), P(i,9,3));
%     % addpoints(trajectory, q(leader*3-2, 1)+v0(1,i),q(leader*3-1, 1)+ v0(2,i), t(i));
%     addpoints(trajectory,4.28-v0(2,i), 3.05 + v0(1,i), 1.23+t(i));
    
%     [grf, points] = Framework3Dplot(q(:,i), E);
%     drawnow limitrate;
%     frames(i) = getframe();
%     % writeVideo(vid, frames(i))  %% Comentar para guardar video
%     if i < length(P(:,1,1))
%         delete(grf);
%         delete(points);
%     end
% end

% plotea todos los agentes en 3D

figure(1)
plot3(4.28-v0(2,:)', 3.05 + v0(1,:)', 1.23+t(:),'LineStyle',"-",'Color','#d95319','LineWidth',1.5);
hold on
plot3(q(9*m-2,:), q(9*m-1,:), q(9*m,:),'LineStyle',"-.",'Color','#072a16','LineWidth',1.5);

% [grf, points] = Framework3Dplot(q(:,i), E); %% Comentar para guardar video

% close(vid) %% Comentar para guardar video

title('Adquisición de la formación','FontSize',20)
xlabel('Eje-X','FontSize',14)
ylabel('Eje-Y','FontSize',14)
zlabel('Eje-Z','FontSize',14)


figure(2)

for i = 1:l
    plot(t(1:end-1),e(i,:),"Linewidth",2)
    hold on
end
plot(t(1:end-1),DELTA_LIMITE_SUPERIOR*ppf(1:end-1),'Color','r','LineWidth',2,'LineStyle','--')
hold on
plot(t(1:end-1),-DELTA_LIMITE_INFERIOR*ppf(1:end-1),'Color','r','LineWidth',2,'LineStyle','--')
hold on
grid on
title('Errores de distancia entre agentes')
xlabel('Segundos')
ylabel('Distancia')


figure(3)

for i = 1:l
    plot(t(1:end-1),e(i,:),"Linewidth",2)
    hold on
end
plot(t(1:end-1),DELTA_LIMITE_SUPERIOR*ppf(1:end-1),'Color','r','LineWidth',2,'LineStyle','--')
hold on
plot(t(1:end-1),-DELTA_LIMITE_INFERIOR*ppf(1:end-1),'Color','r','LineWidth',2,'LineStyle','--')
hold on
grid on
title('Errores de distancia entre agentes')
xlabel('Segundos')
ylabel('Distancia')

% figure(3)

% ax = 2;
% for i = 1:n
%     plot(t(1:end-1),u(m*i-ax, :),"Linewidth",2)
%     hold on
% end
% grid on
% title('Entrada de control eje X')
% xlabel('Segundos')
% ylabel('Control')
% % legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','northeast')
% figure(4)
% ay = 1;
% for i = 1:n
%     plot(t(1:end-1),u(m*i-ay, :),"Linewidth",2)
% %     legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','southwest')
%     hold on
% end
% grid on
% title('Entrada de control eje Y')
% xlabel('Segundos')
% ylabel('Control')
% % legend({'$u1_{Y}$','$u2_{Y}$','$u3_{Y}$','$u4_{Y}$'},'Interpreter','latex','Location','northeast')
% figure(5)

% for i = 1:n
%     plot(t(1:end-1),u(m*i, :),"Linewidth",2)
%     hold on
% end
% grid on
% title('Entrada de control eje Z')
% xlabel('Segundos')
% ylabel('Control')


























