clear;
close all;
clc;

% t = 0:0.01:100;
% vertex number
% n = 8;
% l = 18;
% m = 3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


kv = 0.6;
ks = 1;
delt = 1;

T = 0.01;
m = 3;
n = 5;
l = 7;
fin = 0.8
t = 0: T :fin;

% PUNTOS DESEADOS DE LA FORMACION

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

qd1 = [  0,       1,     0];
qd2 = [-s1,      c1,     0];
qd3 = [-s2,     -c2,     0];
qd4 = [ s2,     -c2,     0];
qd5 = [ s1,      c1,     0];

qd = [qd1'; qd2'; qd3'; qd4'; qd5'];


% "EDGE" DE LA FORMACION (UNIONES)

E1   = [1 2];
E2   = [1 3];
E3   = [1 4];
E4   = [1 5];
E5   = [2 3];
E6   = [3 4];
E7   = [4 5];

E = [E1; E2; E3; E4; E5; E6; E7];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION a + (b-a).*rand(N,1).
q1 = qd1 + delt*(rand(1,m) - 0.05); q1(3) = 0;  
q2 = qd2 + delt*(rand(1,m) - 0.05); q2(3) = 0;
q3 = qd3 + delt*(rand(1,m) - 0.05); q3(3) = 0;
q4 = qd4 + delt*(rand(1,m) - 0.05); q4(3) = 0;
q5 = qd5 + delt*(rand(1,m) - 0.05); q5(3) = 0;

q = [q1'; q2'; q3'; q4'; q5'];

% d = norm(qdi-qdj)
for i = 1:l
    d(i,1) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end

figure(1)
for i = 1:length(q)/m
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
%%%%%%%%%%%%%% PPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DELTA_UP = 1;
DELTA_DOWN = 1;
GAMMA = 1.1;
v = 0.4;
CHI_ZERO = 1;
CHI_INF = 1;
% chi = (CHI_ZERO-CHI_INF)*exp(-GAMMA*t)+CHI_INF;
% chiP = (CHI_ZERO-CHI_INF)*exp(-GAMMA*t)+CHI_INF;

chi  = coth(GAMMA*t + v) - 1 + CHI_INF;
chip = -GAMMA*csch(GAMMA*t + v).^2;

V = (0.5*(rand(1,m*n)))';
% chi2p = 2*GAMMA^2*(csch(GAMMA*t + v).^2).*coth(GAMMA*t + v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = [q; V];


for i = 1:length(t)-1
    % qt = qi-qj
    for k = 1:l
        qt(k*m-(m-1):m*k, i) = q(E(k,1)*m-2:E(k,1)*m, i) - q(E(k,2)*m-2:E(k,2)*m, i);
    end
    
    % eij = ||qi-qj|| - d
    for k = 1:l
        e(k,i) = norm(qt(k*m-(m-1):m*k, i)) - d(k);
    end
    
    % zij = eij(eij+2*dij)
    for k = 1:l
        Z(k,1) = e(k,i)*(e(k,i)+2*d(k));
    end

    for k=1:l
        varphi(k,i) = e(k,i)/chi(i);
    end

    for k=1:l
        Ez(k,i) = 1/2 * log((DELTA_UP*varphi(k,i) + DELTA_DOWN*DELTA_UP)/(DELTA_UP*DELTA_DOWN-DELTA_DOWN*varphi(k,i)));
    end
    
    
    R = matrizR(q(:,i),m);
    
    rho = eye(l).*((1/(2*chi(i)))*(1./(varphi(:,i)+DELTA_DOWN) - 1./(varphi(:,i)-DELTA_UP)));
    % rhop = diff(rho)./T;

    % CALCULO DE VF PUNTO DERIVADA DE VF    
    if i == 1
        rhop = rho/T;
        temp = rho;
    else
        rhop = (rho - temp)/T;
        temp = rho;
    end

    Vf(:,i) = -kv*R'*rho*Ez(:,i);
    Rp = matrizR(Vf(:,i),m);
    Zp = 2*R*Vf(:,i);

    % for k=1:l
    Ezp(:,i) = rho*(Zp-chip(i)*varphi(:,i));
    % end

    Vfp(:,i) = -kv*Rp'*rho*Ez(:,i) - kv*R'*rhop*Ez(:,i) - kv*R'*rho*Ezp(:,i);
    
    S = V(:,i) - Vf(:,i);
    u = -ks*S + Vfp(:,i) - R'*rho*Ez;
    
    [tt, xx] = ode45(@systemDoubleIntegrator, [t(i) t(i+1)], x(:,i), [], u(:,i));
    x(:, i+1) = xx(end,:)';
    q(:, i+1) = xx(end,1:15)';
    V(:,i+1) =  xx(end,16:30)';
end


% e(1, end + 1) = 0;
figure(2);
for i = 1:l
    plot(t(1:length(e(i,:))), e(i,:));
    hold on
end
plot(t(1:length(e(1,:))),chi(1:length(e(1,:))));
hold on
plot(t(1:length(e(1,:))),-chi(1:length(e(1,:))));
figure(1)
Framework3Dplot(q(1:15,end), E);
% figure(2);
% plot(x2);
% plot(t, x(2,:));