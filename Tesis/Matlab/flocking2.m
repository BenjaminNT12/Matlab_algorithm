% calculo de la matriz de Rigidez

clc
close all
clear

kv = 0.1;
delt = 1;
n = 4;
m = 3;
l = 6;
T = 0.001;
t = T: T :5;

screenshot = [ 3; 4] ;
% ud = zeros(18,1);
uh = zeros(m*n,1);
uhp = zeros(m*n,1);
V0 = [2];
alpha = 1.5;
j = 1;
u0 = [zeros(length(t),1), ones(length(t),1) ,ones(length(t),1)];


s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

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

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = qd1 + delt*(rand(1,m)*(5+5) - 5);
q2 = qd2 + delt*(rand(1,m)*(5+5) - 5);
q3 = qd3 + delt*(rand(1,m)*(5+5) - 5);
q4 = qd4 + delt*(rand(1,m)*(5+5) - 5);

q = [q1, q2, q3, q4];

qt = zeros(length(E),3);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);


for i = 1:length(q)/3
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x");
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
    R1 = [ (q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)), -(q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)),                            zeros(1,m),                            zeros(1,m)];
    R2 = [ (q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                            zeros(1,m)];
    R3 = [ (q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m))];
    R4 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),  -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                            zeros(1,m)];
    R5 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 4*m-2:4*m)),                            zeros(1,m),  -(q(k, 2*m-2:2*m) - q(k, 4*m-2:4*m))];
    R6 = [                          zeros(1,m),                           zeros(1,m),   (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),  -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m))];

    R = [R1; R2; R3; R4; R5; R6];
    
    ua = -kv*R'*z;


    for i = 1: length(ua)/3
        if i == V0
            bi = 1;
        else
            bi = 0;
        end

        uhi = uh(E(i,1)*3-2:E(i,1)*3);
        uhj = uh(E(i,2)*3-2:E(i,2)*3);
        uhp(i*3-2:i*3,1) = -alpha*sign((uhi - uhj) - alpha*bi*(uhi) - u0(k,:)'); %% modificada
%         uhp(i*3-2:i*3,1) = -alpha*sign((uhi - uhj) - alpha*bi*(uhi - u0(k,:)')); %% original
    end

% integral de uh
    for i = 1: length(uhp)
        uh(i,1) = uh(i,1) + uhp(i,1)*T;
    end

    u(k,:) = ua + uh;

% INTEGRAL qP = u
    for i = 1: length(u(k,:))
        q(k+1,i) = q(k,i) + u(k,i)'*T;
    end

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
% GRAFICA LA FORMACION EN DETERMINADO TIEMPO
    
%     eval = [t(k) screenshot(j) k j]
    if t(k) == screenshot(j)
%         screenshot(j)
        
        if j < length(screenshot)
            j = j+1;
        end

        figure(1)
        Framework3Dplot(q(end,:),E);
        
        hold on
    end
%     screenshot(j)
end

%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

Framework3Dplot(q(end,:),E);
% xlim([-5 8])
% ylim([-10 60])
% zlim([-5  15])
hold on

% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot3(P(:,i,1),P(:,i,2),P(:,i,3));
    hold on
end

% GRAFICA LA LINEA PUNTEADA DE LA TRAYECTORIA
% plot3(P(:,end,1),P(:,end,2),P(:,end,3),'-.r');
% grid on
title('Pirámide triangular')
xlabel('Eje-X')
ylabel('Eje-Y')
zlabel('Eje-Z')
legend({'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','$q_{1}$','$q_{2}$','$q_{3}$','$q_{4}$'},'Interpreter','latex','Location','northeast')
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
%     legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','southwest')
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