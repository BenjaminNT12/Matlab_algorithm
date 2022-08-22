% calculo de la matriz de Rigidez
tic
clc
close all
clear

kv = 1;
delt = 1;

T = 0.001;

t = T: T :5;

screenshot = [1; 2; 3; 4];
% screenshot = [0];

j = 1;

n = 9;
m = 3;
l = 19;

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION
qd1 = [-1,  -1, -1];
qd2 = [ 1,  -1, -1];
qd3 = [ 1,   1, -1];
qd4 = [-1,   1, -1];
qd5 = [-1,  -1,  1];
qd6 = [ 1,  -1,  1];
qd7 = [ 1,   1,  1];
qd8 = [-1,   1,  1];
qd9 = [ 0.1,   0.4,  0.3];

qd = [qd1, qd2, qd3, qd4, qd5, qd6, qd7, qd8, qd9];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 4];
E2 = [1 5];
E3 = [1 9];
E4 = [2 3];
E5 = [2 6];
E6 = [2 9];
E7 = [3 4];
E8 = [3 7];
E9 = [3 9];
E10 = [4 5];
E11 = [4 8];
E12 = [4 9];
E13 = [5 6];
E14 = [5 8];
E15 = [5 9];
E16 = [6 7];
E17 = [6 8];
E18 = [6 9];
E19 = [7 8];
E20 = [7 9];
E21 = [8 9];

E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18; E19; E20; E21];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = [qd1(1:3) + delt*(rand(1,3)-0.5)];
q2 = [qd2(1:3) + delt*(rand(1,3)-0.5)];
q3 = [qd3(1:3) + delt*(rand(1,3)-0.5)];
q4 = [qd4(1:3) + delt*(rand(1,3)-0.5)];
q5 = [qd5(1:3) + delt*(rand(1,3)-0.5)];
q6 = [qd6(1:3) + delt*(rand(1,3)-0.5)];
q7 = [qd7(1:3) + delt*(rand(1,3)-0.5)];
q8 = [qd8(1:3) + delt*(rand(1,3)-0.5)];
q9 = [qd9(1:3) + delt*(rand(1,3)-0.5)];

q = [q1, q2, q3, q4, q5, q6, q7, q8, q9];

qt = zeros(length(E),3);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);

v0 = [(15*cos(pi*t/3))', (15*sin(pi*t/3))', zeros(length(t),1)];
w0 = [zeros(length(t),1) , zeros(length(t),1) , ones(length(t),1)*pi/3];

ud = zeros(n*m,1);

for i = 1:length(q)/3
    plot3(q(i*3-2), q(i*3-1), q(i*3),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*3-2:E(i,1)*3) - qd(E(i,2)*3-2:E(i,2)*3));
end

% GRAFICA LA PRIMERA FORMACION QUE AUN EL ERROR NO CONVERGE A CERO
figure(1)
Framework3Dplot(q(end,:),E);
hold on

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
        e(k,i) = norm(qt(i,:)) - d(i);
        z(i) = e(k,i)*(e(k,i) + 2*d(i));
    end
% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    
    R1  = [(q(k, 1*3-2:1*3) - q(k, 4*3-2:4*3)),                          zeros(1,3),                           zeros(1,3), -(q(k, 1*3-2:1*3) - q(k, 4*3-2:4*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R2  = [(q(k, 1*3-2:1*3) - q(k, 5*3-2:5*3)),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 1*3-2:1*3) - q(k, 5*3-2:5*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R3  = [(q(k, 1*3-2:1*3) - q(k, 9*3-2:9*3)),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 1*3-2:1*3) - q(k, 9*3-2:9*3))];
    R4  = [                         zeros(1,3), (q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)), -(q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R5  = [                         zeros(1,3), (q(k, 2*3-2:2*3) - q(k, 6*3-2:6*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 2*3-2:2*3) - q(k, 6*3-2:6*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R6  = [                         zeros(1,3), (q(k, 2*3-2:2*3) - q(k, 9*3-2:9*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 2*3-2:2*3) - q(k, 9*3-2:9*3))];
    R7  = [                         zeros(1,3),                          zeros(1,3),  (q(k, 3*3-2:3*3) - q(k, 4*3-2:4*3)), -(q(k, 1*3-2:1*3) - q(k, 4*3-2:4*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R8  = [                         zeros(1,3),                          zeros(1,3),  (q(k, 3*3-2:3*3) - q(k, 7*3-2:7*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 3*3-2:3*3) - q(k, 7*3-2:7*3)),                           zeros(1,3),                           zeros(1,3)];
    R9  = [                         zeros(1,3),                          zeros(1,3),  (q(k, 3*3-2:3*3) - q(k, 9*3-2:9*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 3*3-2:3*3) - q(k, 9*3-2:9*3))];
    R10 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),  (q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3)), -(q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R11 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),  (q(k, 4*3-2:4*3) - q(k, 8*3-2:8*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 4*3-2:4*3) - q(k, 8*3-2:8*3)),                           zeros(1,3)];
    R12 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),  (q(k, 4*3-2:4*3) - q(k, 9*3-2:9*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 4*3-2:4*3) - q(k, 9*3-2:9*3))];
    R13 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 5*3-2:5*3) - q(k, 6*3-2:6*3)), -(q(k, 5*3-2:5*3) - q(k, 6*3-2:6*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3)];
    R14 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 5*3-2:5*3) - q(k, 8*3-2:8*3)),                           zeros(1,3),                           zeros(1,3), -(q(k, 5*3-2:5*3) - q(k, 8*3-2:8*3)),                           zeros(1,3)];
    R15 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 5*3-2:5*3) - q(k, 9*3-2:9*3)),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3), -(q(k, 5*3-2:5*3) - q(k, 9*3-2:9*3))];
    R16 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 6*3-2:6*3) - q(k, 7*3-2:7*3)), -(q(k, 6*3-2:6*3) - q(k, 7*3-2:7*3)),                           zeros(1,3),                           zeros(1,3)];
    R17 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 6*3-2:6*3) - q(k, 8*3-2:8*3)),                           zeros(1,3), -(q(k, 6*3-2:6*3) - q(k, 8*3-2:8*3)),                           zeros(1,3)];
    R18 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 6*3-2:6*3) - q(k, 9*3-2:9*3)),                           zeros(1,3),                           zeros(1,3), -(q(k, 6*3-2:6*3) - q(k, 9*3-2:9*3))];
    R19 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 7*3-2:7*3) - q(k, 8*3-2:8*3)), -(q(k, 7*3-2:7*3) - q(k, 8*3-2:8*3)),                           zeros(1,3)];
    R20 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 7*3-2:7*3) - q(k, 9*3-2:9*3)),                           zeros(1,3), -(q(k, 7*3-2:7*3) - q(k, 9*3-2:9*3))];
    R21 = [                         zeros(1,3),                          zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),                           zeros(1,3),  (q(k, 8*3-2:8*3) - q(k, 9*3-2:9*3)), -(q(k, 8*3-2:8*3) - q(k, 9*3-2:9*3))];

    R = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14; R15; R16; R17; R18; R19; R20; R21];
    
    ua = -kv*R'*z;

    % CADA AGENTE UNIDO AL EJE PRINCIPAL [1,6] , [2,6] , [3,6] , [4,6] , [5,6] , [6,6]

    qtin = [qt(3,:); qt(6,:); qt(9,:); qt(12,:); qt(15,:); qt(18,:); qt(20,:); qt(21,:); 0 0 0];


    %CALCULA EL CONTROL QUE NECESITA PARA CADA AGENTE UNIDO AL EJE
    for i = 1: (length(ud)/3)
        ud(i*3-2: i*3,1) = (v0(k, :) + cross(w0(k, :), qtin(i,:)))';
    end
    
    u = ua + ud;

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
        Framework3Dplot(q(end,:),E);
        hold on
    end
    
end


%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

Framework3Dplot(q(end,:),E);
xlim([-20 20])
ylim([-20 20])
zlim([-20 20])
hold on

% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot3(P(:,i,1),P(:,i,2),P(:,i,3));
    hold on
end

% GRAFICA LA LINEA PUNTEADA DE LA TRAYECTORIA
plot3(P(:,9,1),P(:,9,2),P(:,9,3),'-.r',"Linewidth",2);

figure(2)

for i = 1:length(E)
    plot(t,e(:,i));
    hold on
end
toc













