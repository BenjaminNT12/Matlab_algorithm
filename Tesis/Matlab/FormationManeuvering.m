% calculo de la matriz de Rigidez

clc
close all
clear

kv = 1;
delt = 1;

T = 0.01;

t = T: T :10;

screenshot = [2; 4; 6; 8];
j = 1;

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION
qd1 = [0,     1, 0];
qd2 = [-s1,  c1, 0];
qd3 = [-s2, -c2, 0];
qd4 = [s2,  -c2, 0];
qd5 = [s1,   c1, 0];
qd6 = [0,     0, 0];

qd = [qd1, qd2, qd3, qd4, qd5, qd6];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 2];
E2 = [1 6];
E3 = [2 3];
E4 = [2 6];
E5 = [3 4];
E6 = [3 6];
E7 = [4 5];
E8 = [4 6];
E9 = [5 6];
 
E = [E1; E2; E3; E4; E5; E6; E7; E8; E9];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = [qd1(1:2) + delt*(rand(1,2)-0.5) 0];
q2 = [qd2(1:2) + delt*(rand(1,2)-0.5) 0];
q3 = [qd3(1:2) + delt*(rand(1,2)-0.5) 0];
q4 = [qd4(1:2) + delt*(rand(1,2)-0.5) 0];
q5 = [qd5(1:2) + delt*(rand(1,2)-0.5) 0];
q6 = [qd6(1:2) + delt*(rand(1,2)-0.5) 0];

q = [q1, q2, q3, q4, q5, q6];

qt = zeros(length(E),3);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);

v0 = [ones(length(t),1)  ,             cos(t)', zeros(length(t),1)];
w0 = [zeros(length(t),1) , zeros(length(t),1) , ones(length(t),1)];

ud = zeros(18,1);

for i = 1:length(q)/3
    plot(q(i*3-2), q(i*3-1),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*3-2:E(i,1)*3) - qd(E(i,2)*3-2:E(i,2)*3));
end

d12 = sqrt(2*(1-c1));
d23 = sqrt(2*(1-c1));
d34 = sqrt(2*(1-c1));
d45 = sqrt(2*(1-c1));

d16 = 1;
d26 = 1;
d36 = 1;
d46 = 1;
d56 = 1;

% ALGORITMO CONTROL U = -KV*R*Z

d = [d12, d23, d34, d45, d16, d26, d36, d46, d56];



% GRAFICA LA PRIMERA FORMACION QUE AUN EL ERROR NO CONVERGE A CERO
figure(1)
framework3D(q(end,:),E);
hold on

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
        e(k,i) = norm(qt(i,:)) - d(i);
        z(i) = e(k,i)*(e(k,i) + 2*d(i));
    end
% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1 = [ (q(k, 1*3-2:1*3) - q(k, 2*3-2:2*3)), -(q(k, 1*3-2:1*3) - q(k, 2*3-2:2*3)),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3)];
    R2 = [ (q(k, 1*3-2:1*3) - q(k, 6*3-2:6*3)),                           zeros(1,3),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3),  -(q(k, 1*3-2:1*3) - q(k, 6*3-2:6*3))];
    R3 = [                          zeros(1,3),  (q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)),  -(q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3)];
    R4 = [                          zeros(1,3),  (q(k, 2*3-2:2*3) - q(k, 6*3-2:6*3)),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3),  -(q(k, 2*3-2:2*3) - q(k, 6*3-2:6*3))];
    R5 = [                          zeros(1,3),                           zeros(1,3),   (q(k, 3*3-2:3*3) - q(k, 4*3-2:4*3)),  -(q(k, 3*3-2:3*3) - q(k, 4*3-2:4*3)),                            zeros(1,3),                            zeros(1,3)];
    R6 = [                          zeros(1,3),                           zeros(1,3),   (q(k, 3*3-2:3*3) - q(k, 6*3-2:6*3)),                            zeros(1,3),                            zeros(1,3),  -(q(k, 3*3-2:3*3) - q(k, 6*3-2:6*3))];
    R7 = [                          zeros(1,3),                           zeros(1,3),                            zeros(1,3),   (q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3)),  -(q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3)),                            zeros(1,3)];
    R8 = [                          zeros(1,3),                           zeros(1,3),                            zeros(1,3),   (q(k, 4*3-2:4*3) - q(k, 6*3-2:6*3)),                            zeros(1,3),  -(q(k, 4*3-2:4*3) - q(k, 6*3-2:6*3))];
    R9 = [                          zeros(1,3),                           zeros(1,3),                             zeros(1,3),                            zeros(1,3),  (q(k, 5*3-2:5*3) - q(k, 6*3-2:6*3)),  -(q(k, 5*3-2:5*3) - q(k, 6*3-2:6*3))];

    R = [R1; R2; R3; R4; R5; R6; R7; R8; R9];
    
    ua = -kv*R'*z;

    % CADA AGENTE UNIDO AL EJE PRINCIPAL [1,6] , [2,6] , [3,6] , [4,6] , [5,6] , [6,6]
    qtin = [qt(2,:); qt(4,:); qt(6,:); qt(8,:); qt(9,:); 0 0 0];


    %CALCULA EL CONTROL QUE NECESITA PARA CADA AGENTE UNIDO AL EJE
    for i = 1: (length(ud)/3)
        ud(i*3-2: i*3,1) = (v0(k, :) + cross(w0(k, :), qtin(i,:)))';
    end
    
    u(k,:) = ua + ud;

% INTEGRAL qP = u
    for i = 1: length(u)
        q(k+1,i) = q(k,i) + u(i)*T;
    end

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
% GRAFICA LA FORMACION EN DETERMINADO TIEMPO
    if t(k) == screenshot(j)
        if j < length(screenshot)
            j = j+1
        end
        figure(1)
        framework3D(q(end,:),E);
        hold on
    end
    
end


%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

framework3D(q(end,:),E);
hold on

% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot(P(:,i,1),P(:,i,2));
    hold on
end

% GRAFICA LA LINEA PUNTEADA DE LA TRAYECTORIA
plot(P(:,6,1),P(:,6,2),'-.r',"Linewidth",2);

figure(2)

for i = 1:length(E)
    plot(t,e(:,i));
    hold on
end

















