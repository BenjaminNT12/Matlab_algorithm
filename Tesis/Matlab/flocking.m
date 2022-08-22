% calculo de la matriz de Rigidez

clc
close all
clear


T = 0.001;
t = T: T :3;

screenshot = [1.5; 2.61] ;
kv = 1;
delt = 1;
ud = zeros(18,1);
uh = zeros(15,1);
uhp = zeros(15,1);
V0 = [2];
alpha = 1.5;
j = 1;
u0 = [ones(length(t),1), 2*ones(length(t),1), zeros(length(t),1)];


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

qd = [qd1, qd2, qd3, qd4, qd5];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 2];
E2 = [1 3];
E3 = [1 4];
E4 = [1 5];
E5 = [2 3];
E6 = [3 4];
E7 = [4 5];
 
E = [E1; E2; E3; E4; E5; E6; E7];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = [qd1(1:2) + delt*(rand(1,2)-0.5) 0];
q2 = [qd2(1:2) + delt*(rand(1,2)-0.5) 0];
q3 = [qd3(1:2) + delt*(rand(1,2)-0.5) 0];
q4 = [qd4(1:2) + delt*(rand(1,2)-0.5) 0];
q5 = [qd5(1:2) + delt*(rand(1,2)-0.5) 0];

q = [q1, q2, q3, q4, q5];

qt = zeros(length(E),3);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);


for i = 1:length(q)/3
    plot(q(i*3-2), q(i*3-1),"x");
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*3-2:E(i,1)*3) - qd(E(i,2)*3-2:E(i,2)*3));
end


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
    R1 = [ (q(k, 1*3-2:1*3) - q(k, 2*3-2:2*3)), -(q(k, 1*3-2:1*3) - q(k, 2*3-2:2*3)),                            zeros(1,3),                            zeros(1,3),                            zeros(1,3)];
    R2 = [ (q(k, 1*3-2:1*3) - q(k, 3*3-2:3*3)),                           zeros(1,3),  -(q(k, 1*3-2:1*3) - q(k, 3*3-2:3*3)),                            zeros(1,3),                            zeros(1,3)];
    R3 = [ (q(k, 1*3-2:1*3) - q(k, 4*3-2:4*3)),                           zeros(1,3),                            zeros(1,3),  -(q(k, 1*3-2:1*3) - q(k, 4*3-2:4*3)),                            zeros(1,3)];
    R4 = [ (q(k, 1*3-2:1*3) - q(k, 5*3-2:5*3)),                           zeros(1,3),                            zeros(1,3),                            zeros(1,3),  -(q(k, 1*3-2:1*3) - q(k, 5*3-2:5*3))];
    R5 = [                          zeros(1,3),  (q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)),  -(q(k, 2*3-2:2*3) - q(k, 3*3-2:3*3)),                            zeros(1,3),                            zeros(1,3)];
    R6 = [                          zeros(1,3),                           zeros(1,3),   (q(k, 3*3-2:3*3) - q(k, 4*3-2:4*3)),  -(q(k, 3*3-2:3*3) - q(k, 4*3-2:4*3)),                            zeros(1,3)];
    R7 = [                          zeros(1,3),                           zeros(1,3),                            zeros(1,3),   (q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3)),  -(q(k, 4*3-2:4*3) - q(k, 5*3-2:5*3))];

    R = [R1; R2; R3; R4; R5; R6; R7];
    
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

    u = ua + uh;

% INTEGRAL qP = u
    for i = 1: length(u)
        q(k+1,i) = q(k,i) + u(i)*T;
    end

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
% GRAFICA LA FORMACION EN DETERMINADO TIEMPO
    
    eval = [t(k) screenshot(j) k j]
    if t(k) == screenshot(j)
%         screenshot(j)
        
        if j < length(screenshot)
            j = j+1;
        end

        figure(1)
        framework3D(q(end,:),E);
        
        hold on
    end
%     screenshot(j)
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


figure(2)

for i = 1:length(E)
    plot(t,e(:,i));
    hold on
end
