% calculo de la matriz de Rigidez

clc
close all
clear

kv = 1;
delt = 1;

T = 0.001;

t = T: T :3;

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION
% qd1 = [0,     1];
% qd2 = [-s1,  c1];
% qd3 = [-s2, -c2];
% qd4 = [s2,  -c2];
% qd5 = [s1,   c1];


qd1 = [6,     6];
qd2 = [1,     6];
qd3 = [1,     1];
qd4 = [6,     1];


qd = [qd1, qd2, qd3, qd4];

% "EDGE" DE LA FORMACION (UNIONES)

E1 = [1 2];
E2 = [2 3];
E3 = [3 4];
E4 = [1 4];
E5 = [2 4];

 
E = [E1; E2; E3; E4; E5];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = qd1 + delt*(rand(1,2)-0.5);
q2 = qd2 + delt*(rand(1,2)-0.5);
q3 = qd3 + delt*(rand(1,2)-0.5);
q4 = qd4 + delt*(rand(1,2)-0.5);
% q5 = qd5 + delt*(rand(1,2)-0.5);

q = [q1, q2, q3, q4];

qt = zeros(length(E),2);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);


for i = 1:length(q)/2
    plot(q(i*2-1), q(i*2),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*2-1:E(i,1)*2) - qd(E(i,2)*2-1:E(i,2)*2));
end

% ALGORITMO CONTROL U = -KV*R*Z

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k,E(i,1)*2-1:E(i,1)*2) - q(k,E(i,2)*2-1:E(i,2)*2);
        e(k,i) = norm(qt(i,:)) - d(i);
        z(i,:) = e(k,i)*(e(k,i) + 2*d(i));
    end
% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1 = [ (q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)), -(q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)),                            zeros(1,2),                            zeros(1,2)];
    R2 = [                          zeros(1,2),  (q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),  -(q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),                             zeros(1,2)];
    R3 = [                          zeros(1,2),                           zeros(1,2),   (q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2)),  -(q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2))]; 
    R4 = [ (q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2)),                           zeros(1,2),                            zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2))];
    R5 = [                          zeros(1,2),  (q(k, 2*2-1:2*2) - q(k, 4*2-1:4*2)),                            zeros(1,2),  -(q(k, 2*2-1:2*2) - q(k, 4*2-1:4*2))]; 


    R = [R1; R2; R3; R4; R5];
    
    u = -kv*R'*z;
    
% INTEGRAL qP = u
    for i = 1: length(q(end,:))
        q(k+1,i) = q(k,i)+u(i)*T;
    end

    for i = 1:length(q(end,:))/2
        P(k,i,:) = [q(end, i*2-1), q(end, i*2)];
    end
    
end

rangoR = rank(R)
gaussJR = rref(R)
R
%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

framework(q(end,:),E);
xlim([-1 8])
ylim([-1 8])
hold on

for i = 1: length(P(1,:,1))
    plot(P(:,i,1),P(:,i,2));
    hold on
end

figure(2)

for i = 1:length(E)
    plot(t,e(:,i))
    hold on
end