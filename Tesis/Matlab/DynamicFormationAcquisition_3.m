% calculo de la matriz de Rigidez
tic
clc
close all
clear

tic
kv = 10;
delt = 1;

T = 0.001;
t = T: T :50;

screenshot = [10; 20; 30; 40];
j = 1;
m = 3;
n = 4;
l = 6;

u  = [zeros(m*n)];
P  = [zeros(length(t)-1, n , m)];

ud = [zeros(length(t),1), 1.5*ones(length(t),1), -(sin(0.23*pi*t/3))'];


% PUNTOS DESEADOS DE LA FORMACION

rho = 1+0.5*sin(0.15*t);

% PUNTOS DESEADOS DE LA FORMACION
qd1 = [0,       0,     0];
qd2 = [5,       0,     0];
qd3 = [2.5, 4.330,     0];
qd4 = [2.5,   2.5, 4.330];

qd = [qd1, qd2, qd3, qd4];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 2];
E2 = [1 3];
E3 = [1 4];
E4 = [2 3];
E5 = [2 4];
E6 = [3 4];

 
E = [E1; E2; E3; E4; E5; E6];

qt = zeros(length(E), m);
z  = zeros(length(E), 1);
e  = zeros(length(t), length(E));
dp = [zeros(length(t), length(E))];
dv = [zeros(length(t), length(E))];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
% q1 = [1, 1, 1];
% q2 = [1.1, 1.4, 1.8];
% q3 = [1.2, 1.6, 1.9];
% q4 = [1.3, 1.7, 2];

q1 = qd1 + delt*(rand(1,m)*(5+5) - 5);
q2 = qd2 + delt*(rand(1,m)*(5+5) - 5);
q3 = qd3 + delt*(rand(1,m)*(5+5) - 5);
q4 = qd4 + delt*(rand(1,m)*(5+5) - 5);

q = [q1, q2, q3, q4];

for i = 1:length(q)/3
    plot3(q(i*3-2), q(i*3-1), q(i*3),"x");
    hold on;
end

for i = 1:length(E)
    d(:,i) = (rho*norm(qd(E(i,1)*3-2:E(i,1)*3) - qd(E(i,2)*3-2:E(i,2)*3)))';
end

% GRAFICA LA PRIMERA FORMACION QUE AUN EL ERROR NO CONVERGE A CERO
figure(1)
Framework3Dplot(q(end,:),E);
hold on


for k = 1:length(t)-1
    for i = 1 : length(E)
        qt(i, :) = q(k, E(i,1)*3-2 : E(i,1)*3) - q(k, E(i,2)*3-2 : E(i,2)*3);
        e(k, i) = norm(qt(i,:)) - d(k, i);
        z(i) = e(k,i)*(e(k,i) + 2*d(k, i));
    end

% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1 = [ (q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)), -(q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)),                            zeros(1,m),                            zeros(1,m)];
    R2 = [ (q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                            zeros(1,m)];
    R3 = [ (q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m))];
    R4 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),  -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                            zeros(1,m)];
    R5 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 4*m-2:4*m)),                            zeros(1,m),  -(q(k, 2*m-2:2*m) - q(k, 4*m-2:4*m))];
    R6 = [                          zeros(1,m),                           zeros(1,m),   (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),  -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m))];

    R = [R1; R2; R3; R4; R5; R6];
    
% CALCULO DE R+

    R_plus = R'/(R*R');

% DERIVADA DE P Y CALCULO DE DV
    for i = 1 : length(E)
        dp(k, i) = (d(k+1, i) - d(k, i))/T;
        dv(k, i) = d(k,i)*dp(k, i);
    end

% CALCULO DE U
    
    u(k + 1,:) = R_plus*(-kv*z+dv(k,:)');

    for i = 1: length(u(1,:))/3
        u(k+1, i*3-2: i*3) = u(k + 1, i*3-2: i*3)' + ud(k,:)';
    end

   
% INTEGRAL qP = u --->> q
    for i = 1: length(u(1,:))
        q(k+1,i) = q(k,i) + u(k + 1,i)*T;
    end
% ALMACENA p PARA GRAFICAR LAS TRAYECTORIAS

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
% GRAFICA LA FORMACION EN DETERMINADO TIEMPO
    if t(k) == screenshot(j)
        if j < length(screenshot)
            j = j+1;
        end
        figure(1)
        Framework3Dplot(q(end,:),E);
        hold on
    end
end


%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)
xlim([-10 50])
ylim([-10 100])
zlim([-15  15])
grid on
Framework3Dplot(q(end,:),E);
hold on

% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot3(P(:,i,1),P(:,i,2),P(:,i,3),"Linewidth",1.3);
    hold on
end


% GRAFICA LA LINEA PUNTEADA DE LA TRAYECTORIA
% plot3(P(:,end,1),P(:,end,2),P(:,end,3),'-.r',"Linewidth",2.5);
% grid on
ax = gca;
ax.FontSize = 18;
title('Pirámide triangular')
xlabel('Eje-X')
ylabel('Eje-Y')
zlabel('Eje-Z')
legend({'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','$q_{1}$','$q_{2}$','$q_{3}$','$q_{4}$','Trayectoria del agente principal'},'Interpreter','latex','Location','northeast')
figure(2)

for i = 1:length(E)
    plot(t,e(:,i),"Linewidth",2)
    hold on
end
grid on
title('Errores de distancia entre agentes')
xlabel('Segundos')
ylabel('Distancia')
legend({'$error_{1}$','$error_{2}$','$error_{3}$','$error_{4}$','$error_{5}$','$error_{6}$'},'Interpreter','latex','Location','northeast')
figure(3)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-2),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje X')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','northeast')
figure(4)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-1),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje Y')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{Y}$','$u2_{Y}$','$u3_{Y}$','$u4_{Y}$'},'Interpreter','latex','Location','northeast')
figure(5)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje Z')
xlabel('Segundos')
ylabel('Control')
legend({'$u1_{Z}$','$u2_{Z}$','$u3_{Z}$','$u4_{Z}$'},'Interpreter','latex','Location','northeast')
toc
