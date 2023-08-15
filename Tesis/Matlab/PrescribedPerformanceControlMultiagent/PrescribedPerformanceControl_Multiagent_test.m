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

kv = 0.2;
ks = 0.02;
delt = 1;

T = 0.01;
m = 3;
n = 8;
l = 18;
c = 2.1;
fin = 1.5;
t = 0: T :fin;

DELTA_UP = 1;
DELTA_DOWN = 1;

CHI_ZERO = 1;
CHI_INF = 0.03;

qd1 = [-1, -1, -1];
qd2 = [ 1, -1, -1];
qd3 = [ 1,  1, -1];
qd4 = [-1,  1, -1];
qd5 = [-1, -1,  1];
qd6 = [ 1, -1,  1];
qd7 = [ 1,  1,  1];
qd8 = [-1,  1,  1];

qd = [qd1';
      qd2'; 
      qd3'; 
      qd4'; 
      qd5'; 
      qd6'; 
      qd7'; 
      qd8'];

E1   = [1 2];
E2   = [1 3];
E3   = [1 4];
E4   = [1 5];
E5   = [1 8];
E6   = [2 3];
E7   = [2 5];
E8   = [2 6];
E9   = [3 4];
E10  = [3 6];
E11  = [3 7];
E12  = [4 7];
E13  = [4 8];
E14  = [5 6];
E15  = [5 8];
E16  = [6 7];
E17  = [6 8];
E18  = [7 8];

E = [E1; 
     E2;
     E3; 
     E4; 
     E5; 
     E6; 
     E7; 
     E8; 
     E9; 
     E10; 
     E11; 
     E12; 
     E13; 
     E14; 
     E15; 
     E16; 
     E17; 
     E18];

q1 = qd1 + delt*(rand(1,m) - 0.85);
q2 = qd2 + delt*(rand(1,m) - 0.85);
q3 = qd3 + delt*(rand(1,m) - 0.85);
q4 = qd4 + delt*(rand(1,m) - 0.85);
q5 = qd5 + delt*(rand(1,m) - 0.85);
q6 = qd6 + delt*(rand(1,m) - 0.85);
q7 = qd7 + delt*(rand(1,m) - 0.85);
q8 = qd8 + delt*(rand(1,m) - 0.85);

q = [q1';
     q2'; 
     q3'; 
     q4'; 
     q5'; 
     q6'; 
     q7'; 
     q8'];

figure(1)
for i = 1:n
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

for i = 1:l
    d(i,1) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end

chi  = (CHI_ZERO-CHI_INF)*exp(-c*t)+CHI_INF;
chip = -c*(CHI_ZERO-CHI_INF)*exp(-c*t);
V = (0*(rand(1,m*n)))';

X = [q; V];

for i = 1:length(t)-1
    for k = 1:l
        qt(k*m-(m-1):m*k, i) = q(E(k,1)*m-2:E(k,1)*m, i) - q(E(k,2)*m-2:E(k,2)*m, i);
        e(k,i) = norm(qt(k*m-(m-1):m*k, i)) - d(k);
        Z(k,1) = e(k,i)*(e(k,i)+2*d(k));
        varphi(k,i) = e(k,i)/chi(i);
        Ez(k,i) = 1/2 * log((DELTA_UP*varphi(k,i) + DELTA_DOWN*DELTA_UP)/(DELTA_UP*DELTA_DOWN-DELTA_DOWN*varphi(k,i)));
    end
    
    R = matrizR(q(:,i),m);

    rho = eye(l).*((1/(2*chi(i)))*(1./(varphi(:,i)+DELTA_DOWN) - 1./(varphi(:,i)-DELTA_UP)));
    
    if i == 1
        rhop = rho/T;
        temp = rho;
    else
        rhop = (rho - temp)/T;
        temp = rho;
    end
    
    Vf(:,i) = -kv*R'*rho*Ez(:,i);
    Zp = 2*R*V(:,i);
    Rp = matrizR(V(:,i),m);
    S = V(:,i) - Vf(:,i);
    
    Ezp(:,i) = rho*(Zp-chip(i)*varphi(:,i));
    Vfp2(:,i) = -kv*(Rp'*rho*Ez(:,i) + R'*rhop*Ez(:,i) + R'*rho*Ezp(:,i));
    % CALCULO DE VF PUNTO DERIVADA DE VF    
    
    if i == 1
        Vfp(:,i) = Vf(:,i)/T;
    else
        Vfp(:,i) = (Vf(:,i) - Vf(:,i-1))/T;
    end
    
    u = -ks*S + Vfp(:,i) - R'*rho*Ez;
    
    [tt, xx] = ode45(@systemDoubleIntegrator, [t(i) t(i+1)], X(:,i), [], u(:,i), m, n);
    X(:, i+1) = xx(end, :)';
    q(:, i+1) = xx(end, 1:m*n)';
    V(:, i+1) = xx(end, m*n+1:2*m*n)';
    
    for j = 1:n
        P(i,j,:) = [q(j*3-2, end), q(j*3-1, end) , q(j*3, end)];
    end
end



figure(1)

grid on
axis([-2 2 -2 2 -2 2])

h1 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',1.5);
h2 = animatedline('LineStyle',"-.",'Color','#D95319','LineWidth',1.5);
h3 = animatedline('LineStyle',"-.",'Color','#EDB120','LineWidth',1.5);
h4 = animatedline('LineStyle',"-.",'Color','#7E2F8E','LineWidth',1.5);
h5 = animatedline('LineStyle',"-.",'Color','#77AC30','LineWidth',1.5);
h6 = animatedline('LineStyle',"-.",'Color','#4DBEEE','LineWidth',1.5);
h7 = animatedline('LineStyle',"-.",'Color','#A2142F','LineWidth',1.5);
h8 = animatedline('LineStyle',"-.",'Color','#FF0000','LineWidth',1.5);

for i = 1: length(P(:,1,1))
    addpoints(h1, P(i,1,1), P(i,1,2), P(i,1,3));
    addpoints(h2, P(i,2,1), P(i,2,2), P(i,2,3));
    addpoints(h3, P(i,3,1), P(i,3,2), P(i,3,3));
    addpoints(h4, P(i,4,1), P(i,4,2), P(i,4,3));
    addpoints(h5, P(i,5,1), P(i,5,2), P(i,5,3));
    addpoints(h6, P(i,6,1), P(i,6,2), P(i,6,3));
    addpoints(h7, P(i,7,1), P(i,7,2), P(i,7,3));
    addpoints(h8, P(i,8,1), P(i,8,2), P(i,8,3));
    
    [grf] = Framework3Dplot(q(:,i), E);
    drawnow;
    
    if i < length(P(:,1,1))
        delete(grf);
    end
end


title('Adquisición de la formación','FontSize',28)
xlabel('Eje-X','FontSize',14)
ylabel('Eje-Y','FontSize',14)
zlabel('Eje-Z','FontSize',14)

grid on



figure(2)
grid on
axis([0 fin min(-chi(:)) max(chi(:))]);

title('Error de distancia de agentes, acotado por la función de rendimiento','FontSize',14)
xlabel('Tiempo','FontSize',14)
ylabel('Error','FontSize',14)

h1 = animatedline('Color','#0072BD',"Linewidth",2);
h2 = animatedline('Color','#D95319','LineWidth',2);
h3 = animatedline('Color','#EDB120','LineWidth',2);
h4 = animatedline('Color','#7E2F8E','LineWidth',2);
h5 = animatedline('Color','#77AC30','LineWidth',2);
h6 = animatedline('Color','#4DBEEE','LineWidth',2);
h7 = animatedline('Color','#A2142F','LineWidth',2);
h8 = animatedline('Color','#FF0000','LineWidth',2);

h9 = animatedline('Color','#0072BD',"Linewidth",2);
h10 = animatedline('Color','#D95319','LineWidth',2);
h11 = animatedline('Color','#EDB120','LineWidth',2);
h12 = animatedline('Color','#7E2F8E','LineWidth',2);
h13 = animatedline('Color','#77AC30','LineWidth',2);
h14 = animatedline('Color','#4DBEEE','LineWidth',2);
h15 = animatedline('Color','#A2142F','LineWidth',2);
h16 = animatedline('Color','#FF0000','LineWidth',2);

h17 = animatedline('Color','#7E2F8E','LineWidth',2);
h18 = animatedline('Color','#77AC30','LineWidth',2);

h19 = animatedline('Color','r','LineWidth',2,'LineStyle','--');
h20 = animatedline('Color','r','LineWidth',2,'LineStyle','--');

for i = 1: length(P(:,1,1))
    addpoints(h1, t(i),e(1,i));
    addpoints(h2, t(i),e(2,i));
    addpoints(h3, t(i),e(3,i));
    addpoints(h4, t(i),e(4,i));
    addpoints(h5, t(i),e(5,i));
    addpoints(h6, t(i),e(6,i));
    addpoints(h7, t(i),e(7,i));
    addpoints(h8, t(i),e(8,i));
    
    addpoints(h9,  t(i),e(9, i));
    addpoints(h10, t(i),e(10, i));
    addpoints(h11, t(i),e(11, i));
    addpoints(h12, t(i),e(12, i));
    addpoints(h13, t(i),e(13, i));
    addpoints(h14, t(i),e(14, i));
    addpoints(h15, t(i),e(15, i));
    addpoints(h16, t(i),e(16, i));
    
    addpoints(h17, t(i),e(17, i));
    addpoints(h18, t(i),e(18, i));
    
    addpoints(h19, t(i),chi(i));
    addpoints(h20, t(i),-chi(i));
    
    [grf1] = line(t(i),e(:,1));
    drawnow;
    frames(i) = getframe();
    if i < length(P(:,1,1))
        delete(grf1);
    end
end

figure(3)
% for i = 1:n*m
%     plot(Vfp(i,:))                                                                                                             
%     hold on
%     plot(Vfp2(i,:))
% end
plot(Vfp(2,:))                                                                                                             
hold on
plot(Vfp2(2,:))