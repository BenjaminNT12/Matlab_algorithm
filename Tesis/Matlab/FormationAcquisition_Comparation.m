% calculo de la matriz de Rigidez

clc
close all
clear
tic
kv = 0.01;
delt = 1;

T = 0.01;
m = 3;
n = 8;
l = 18;
t = T: T :10;

% s1 = sin(2*pi/5);
% s2 = sin(4*pi/5);
% c1 = cos(2*pi/5);
% c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION
qd1 = [-1,       -1,     -1];
qd2 = [ 1,       -1,     -1];
qd3 = [ 1,        1,     -1];
qd4 = [-1,        1,     -1];
qd5 = [-1,       -1,      1];
qd6 = [ 1,       -1,      1];
qd7 = [ 1,        1,      1];
qd8 = [-1,        1,      1];



qd = [qd1, qd2, qd3, qd4, qd5, qd6, qd7, qd8];

% "EDGE" DE LA FORMACION (UNIONES)
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

 
E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18];
% Framework3Dplot(qd(end,:),E);
%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION a + (b-a).*rand(N,1).
q1 = qd1 + delt*(rand(1,m) - 0.5);
q2 = qd2 + delt*(rand(1,m) - 0.5);
q3 = qd3 + delt*(rand(1,m) - 0.5);
q4 = qd4 + delt*(rand(1,m) - 0.5);
q5 = qd5 + delt*(rand(1,m) - 0.5);
q6 = qd6 + delt*(rand(1,m) - 0.5);
q7 = qd7 + delt*(rand(1,m) - 0.5);
q8 = qd8 + delt*(rand(1,m) - 0.5);

q = [q1, q2, q3, q4, q5, q6, q7, q8];

qt = zeros(length(E),m);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);


for i = 1:length(q)/m
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end


% ALGORITMO CONTROL U = -KV*R*Z

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
        e(k,i) = norm(qt(i,:)) - d(i);
        z(i) = e(k,i)*(e(k,i) + 2*d(i));
    end

% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1  = [ (q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)), -(q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R2  = [ (q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R3  = [ (q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R4  = [ (q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R5  = [ (q(k, 1*m-2:1*m) - q(k, 8*m-2:8*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 8*m-2:8*m))];
    R6  = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)), -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R7  = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R8  = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 2*m-2:2*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m)];
    R9  = [                          zeros(1,m),                           zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)), -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R10 = [                          zeros(1,m),                           zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 3*m-2:3*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m)];
    R11 = [                          zeros(1,m),                           zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 7*m-2:7*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 3*m-2:3*m) - q(k, 7*m-2:7*m)),                           zeros(1,m)];
    R12 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 4*m-2:4*m) - q(k, 7*m-2:7*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 4*m-2:4*m) - q(k, 7*m-2:7*m)),                           zeros(1,m)];
    R13 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 4*m-2:4*m) - q(k, 8*m-2:8*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 4*m-2:4*m) - q(k, 8*m-2:8*m))];
    R14 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 5*m-2:5*m) - q(k, 6*m-2:6*m)), -(q(k, 5*m-2:5*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m)];
    R15 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 5*m-2:5*m) - q(k, 8*m-2:8*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 5*m-2:5*m) - q(k, 8*m-2:8*m))];
    R16 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 6*m-2:6*m) - q(k, 7*m-2:7*m)), -(q(k, 6*m-2:6*m) - q(k, 7*m-2:7*m)),                           zeros(1,m)];
    R17 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 6*m-2:6*m) - q(k, 8*m-2:8*m)),                           zeros(1,m), -(q(k, 6*m-2:6*m) - q(k, 8*m-2:8*m))];
    R18 = [                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 7*m-2:7*m) - q(k, 8*m-2:8*m)), -(q(k, 7*m-2:7*m) - q(k, 8*m-2:8*m))];
     

    R = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14; R15; R16 ;R17; R18];
    
    u(k,:) = -kv*R'*z;
    
% INTEGRAL qP = u
%     for i = 1: n*m
    q(k+1,:) = q(k,:)+u(k,:)*T;
%     end

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
    Wp(k) = z'*R*u(k,:)';
    W(k) = (1/4)*z'*z;  
end

%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)
grid on
Framework3Dplot(q(end,:),E);

hold on

figure(1)
% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot3(P(:,i,1),P(:,i,2),P(:,i,3),'-.',"Linewidth",2);
    hold on
end
title('Pirámide triangular')
xlabel('Eje-X')
ylabel('Eje-Y')
zlabel('Eje-Z')
legend({'','','','','','','','','','','','','','','$q_{1}$','$q_{2}$','$q_{3}$','$q_{4}$'},'Interpreter','latex','Location','northeast')
grid on
figure(2)

for i = 1:length(E)
    plot(t,e(:,i),"Linewidth",2)
    hold on
end
title('Errores de distancia entre agentes')
xlabel('Segundos')
ylabel('Distancia')
legend({'$error_{1}$','$error_{2}$','$error_{3}$','$error_{4}$','$error_{5}$','$error_{6}$'},'Interpreter','latex','Location','northeast')
grid on
figure(3)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-2),"Linewidth",2)
    hold on
end
title('Entrada de control eje X')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','northeast')
grid on
figure(4)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-1),"Linewidth",2)
%     legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','southwest')
    hold on
end
title('Entrada de control eje Y')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{Y}$','$u2_{Y}$','$u3_{Y}$','$u4_{Y}$'},'Interpreter','latex','Location','northeast')
grid on

figure(5)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m),"Linewidth",2)
    hold on
end
title('Entrada de control eje Z')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{Z}$','$u2_{Z}$','$u3_{Z}$','$u4_{Z}$'},'Interpreter','latex','Location','northeast')
grid on
toc

















