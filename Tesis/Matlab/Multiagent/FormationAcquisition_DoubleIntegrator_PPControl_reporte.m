% calculo de la matriz de Rigidez

clc
close all
clear

kv = 1;
delt = 0.9;

T = 0.001;

t = 0: T :0.5;

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION
qd1 = [0,     1];
qd2 = [-s1,  c1];
qd3 = [-s2, -c2];
qd4 = [s2,  -c2];
qd5 = [s1,   c1];
% 
% qd = [qd1, qd2, qd3, qd4, qd5];
q1 = qd1 + delt*(rand(1,2)-0.1);
q2 = qd2 + delt*(rand(1,2)-0.1);
q3 = qd3 + delt*(rand(1,2)-0.1);
q4 = qd4 + delt*(rand(1,2)-0.1);
q5 = qd5 + delt*(rand(1,2)-0.1);

% "EDGE" DE LA FORMACION (UNIONES)
E1  = [1 2];
E2  = [2 3];
E3  = [3 4];
E4  = [4 5];
E5  = [1 5];
E6  = [1 3];
E7  = [1 4];

 
E = [E1; E2; E3; E4; E5; E6; E7];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
% q1 = [-0.8049 0.6951]; % qd1 + delt*(rand(1,2)-0.51);
% q2 = [-1.3941 -0.1340];% qd2 + delt*(rand(1,2)-0.51);
% q3 = [-0.4940 -0.7153];% qd3 + delt*(rand(1,2)-0.51);
% q4 = [1.5028 0.1060]% qd4 + delt*(rand(1,2)-0.51);
% q5 = [1.8808 1.2388]% qd5 + delt*(rand(1,2)-0.51) ;

q = [q1, q2, q3, q4, q5];



% q = q+0.2
figure(1)
% xlim([-2 2])
% ylim([-2 2])
framework(q(end,:),E);
hold on

qt = zeros(length(E),2);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
eta = zeros(length(E),1);
varphi = zeros(length(E),1);
d = zeros(length(E),1);


for i = 1:length(q)/2
    plot(q(i*2-1), q(i*2),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
% for i = 1:length(E)
%     d(i) = norm(qd(E(i,1)*2-1:E(i,1)*2) - qd(E(i,2)*2-1:E(i,2)*2));
% end

d(1) = sqrt(2*(1-cos(2*pi/5)));
d(2) = sqrt(2*(1-cos(2*pi/5)));
d(3) = sqrt(2*(1-cos(2*pi/5)));
d(4) = sqrt(2*(1-cos(2*pi/5)));
d(5) = sqrt(2*(1-cos(2*pi/5)));

d(6) = sqrt(2*(1+cos(pi/5)));
d(7) = sqrt(2*(1+cos(pi/5)));

% FUNCION PPF 
xinf = 0.03;
gama = 1.5;
deltaInferiorInf = 1;
deltaSuperiorInf = 1;
v1 = 0.5;

% chi  = coth(gama*t + v1) - 1 + xinf;
aij = 1;
x0 = 1;
chi  = (x0-xinf)*exp(-aij*t)+xinf;
% chip = -gama*csch(gama*t + v1).^2;
% chi2p = 2*gama^2*(csch(gama*t + v1).^2).*coth(gama*t + v1);

% ALGORITMO CONTROL U = -KV*R*Z

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k,E(i,1)*2-1:E(i,1)*2) - q(k,E(i,2)*2-1:E(i,2)*2);
        e(k,i) = norm(qt(i,:)) - d(i);
        % z(i,:) = e(k,i)*(e(k,i) + 2*d(i));
        eta(k,i) = e(k,i)*(norm(qt(i,:)) + d(i));
        varphi(k,i) = eta(k,i)/chi(k);
    end
% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1 = [ (q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)), -(q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)),                            zeros(1,2),                            zeros(1,2),                            zeros(1,2)];
    R2 = [ (q(k, 1*2-1:1*2) - q(k, 3*2-1:3*2)),                           zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 3*2-1:3*2)),                            zeros(1,2),                            zeros(1,2)];
    R3 = [ (q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2)),                           zeros(1,2),                            zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2)),                            zeros(1,2)];
    R4 = [ (q(k, 1*2-1:1*2) - q(k, 5*2-1:5*2)),                           zeros(1,2),                            zeros(1,2),                            zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 5*2-1:5*2))];
    R5 = [                          zeros(1,2),  (q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),  -(q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),                            zeros(1,2),                            zeros(1,2)];
    R6 = [                          zeros(1,2),                           zeros(1,2),   (q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2)),  -(q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2)),                            zeros(1,2)];
    R7 = [                          zeros(1,2),                           zeros(1,2),                            zeros(1,2),   (q(k, 4*2-1:4*2) - q(k, 5*2-1:5*2)),  -(q(k, 4*2-1:4*2) - q(k, 5*2-1:5*2))];
   


    R = [R1; R2; R3; R4; R5; R6; R7];
    % (deltaSuperiorInf*varphi(k,:)+deltaSuperiorInf*deltaInferiorInf)./(deltaSuperiorInf*deltaInferiorInf-deltaInferiorInf*varphi(k,:));
    % log((deltaSuperiorInf*varphi(k,:)+deltaSuperiorInf*deltaInferiorInf)./(deltaSuperiorInf*deltaInferiorInf-deltaInferiorInf*varphi(k,:)))
    z1 = (1/2)*log((deltaSuperiorInf*varphi(k,:)+deltaSuperiorInf*deltaInferiorInf)./(deltaSuperiorInf*deltaInferiorInf-deltaInferiorInf*varphi(k,:)))

    % l x l 
    rho = eye(7,7).*(1./2*chi(k)).*((1./(varphi(k,:)+deltaInferiorInf))-(1./(varphi(k,:)-deltaSuperiorInf)))';
        
    u = -R'*rho*kv*z1'
    % u = -kv*R'*z;
    
% INTEGRAL qP = u
    for i = 1: 10
        q(k+1,i) = q(k,i)+u(i)*T;
    end

    for i = 1:length(q(end,:))/2
        P(k,i,:) = [q(end, i*2-1), q(end, i*2)];
    end
    
end

% rangoR = rank(R)
% gaussJR = rref(R)
%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(2)

framework(q(end,:),E);
% xlim([-2 2])
% ylim([-2 2])
hold on

for i = 1: length(P(1,:,1))
    plot(P(:,i,1),P(:,i,2));
    hold on
end

figure(3)

for i = 1:length(E)
    plot(t,e(:,i))
    hold on
    plot(t,chi)
    hold on
    plot(t,-chi)
    hold on
end






















