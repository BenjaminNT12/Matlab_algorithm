% calculo de la matriz de Rigidez

clc
close all
clear

tic
kv = 10;
delt = 1;

T = 0.001;
t = T: T :15;

screenshot = [4; 8; 10; 12; 15];
j = 1;
m = 3;
n = 5;
l = 7;

u  = [zeros(m*n)];
P  = [zeros(length(t)-1, n , m)];

ud = [ones(length(t),1), zeros(length(t),1), zeros(length(t),1)];

s1 = sin(2*pi/5);
s2 = sin(4*pi/5);
c1 = cos(2*pi/5);
c2 = cos(pi/5);

% PUNTOS DESEADOS DE LA FORMACION

rho = 1+0.5*cos(0.4*t);

qd1 = [0, 0,     1];
qd2 = [0, -s1,  c1];
qd3 = [0, -s2, -c2];
qd4 = [0, s2,  -c2];
qd5 = [0, s1,   c1];   

% qd = q*
qd = [qd1, qd2, qd3, qd4, qd5];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 2];
E2 = [1 3];
E3 = [1 4];
E4 = [1 5];
E5 = [2 3];
E6 = [3 4];
E7 = [4 5];
E8 = [2 5];
 
E = [E1; E2; E3; E4; E5; E6; E7; E8];

qt = zeros(length(E), m);
z  = zeros(length(E), 1);
e  = zeros(length(t), length(E));
dp = [zeros(length(t), length(E))];
dv = [zeros(length(t), length(E))];

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = [qd1(1:m) + delt*(rand(1,m)-0.5)];
q2 = [qd2(1:m) + delt*(rand(1,m)-0.5)];
q3 = [qd3(1:m) + delt*(rand(1,m)-0.5)];
q4 = [qd4(1:m) + delt*(rand(1,m)-0.5)];
q5 = [qd5(1:m) + delt*(rand(1,m)-0.5)];

q = [q1, q2, q3, q4, q5];

for i = 1:length(q)/3
    plot(q(i*3-2), q(i*3-1),"x");
    hold on;
end

d12 = rho*sqrt(2*(1-c1));
d15 = rho*sqrt(2*(1-c1));
d23 = rho*sqrt(2*(1-c1));
d34 = rho*sqrt(2*(1-c1));
d45 = rho*sqrt(2*(1-c1));
d13 = rho*sqrt(2*(1+c2));
d14 = rho*sqrt(2*(1+c2));
d25 = rho*sqrt(2*(1+c2));

% ALGORITMO CONTROL U = -KV*R*Z

d = [d12', d13', d14', d15', d23', d34', d45', d25'];


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
    R1 = [ (q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)), -(q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)),                            zeros(1,m),                            zeros(1,m),                            zeros(1,m)];
    R2 = [ (q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                            zeros(1,m),                            zeros(1,m)];
    R3 = [ (q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                            zeros(1,m)];
    R4 = [ (q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                            zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m))];
    R5 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),  -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                            zeros(1,m),                            zeros(1,m)];
    R6 = [                          zeros(1,m),                           zeros(1,m),   (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),  -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),                            zeros(1,m)];
    R7 = [                          zeros(1,m),                           zeros(1,m),                            zeros(1,m),   (q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m)),  -(q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m))];
    R8 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m)),                            zeros(1,m),                            zeros(1,m),  -(q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m))];

    R = [R1; R2; R3; R4; R5; R6; R7; R8];
    
% CALCULO DE R+

    R_plus = R'/(R*R');

% DERIVADA DE P Y CALCULO DE DV
    for i = 1 : length(E)
        dp(k, i) = (d(k+1, i) - d(k, i))/T;
        dv(k, i) = d(k,i)*dp(k, i);
    end

% CALCULO DE U
    
    u = R_plus*(-kv*z+dv(k,:)');

    for i = 1: length(u)/3
        u(i*3-2: i*3) = u(i*3-2: i*3) + ud(k,:)';
    end

    u_plot(k,:) = u';
% INTEGRAL qP = u --->> q
    for i = 1: length(u)
        q(k+1,i) = q(k,i) + u(i)*T;
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


% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

Framework3Dplot(q(end,:),E);
hold on

% GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
for i = 1: length(P(1,:,1))
    plot3(P(:,i,1),P(:,i,2),P(:,i,3),'--');
    hold on
end

figure(2)

for i = 1:length(E)
    plot(t,e(:,i));
    hold on
end
% 
% figure(3)
% 
% for i = 1: n
%     plot(t(1:end-1), u_plot(:,i*3-2));
%     hold on
% end
% 
% figure(4)
% 
% for i = 1: n
%     plot(t(1:end-1), u_plot(:,i*3-1));
%     hold on
% end
% 
% toc




%     R1 = [ (q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)), -(q(k, 1*m-2:1*m) - q(k, 2*m-2:2*m)),                            zeros(1,m),                            zeros(1,m),                            zeros(1,m)];
%     R2 = [ (q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 3*m-2:3*m)),                            zeros(1,m),                            zeros(1,m)];
%     R3 = [ (q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                            zeros(1,m)];
%     R4 = [ (q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                            zeros(1,m),                            zeros(1,m),  -(q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m))];
%     R5 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),  -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                            zeros(1,m),                            zeros(1,m)];
%     R6 = [                          zeros(1,m),                           zeros(1,m),   (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),  -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),                            zeros(1,m)];
%     R7 = [                          zeros(1,m),                           zeros(1,m),                            zeros(1,m),   (q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m)),  -(q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m))];
%     R8 = [                          zeros(1,m),  (q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m)),                            zeros(1,m),                            zeros(1,m),  -(q(k, 2*m-2:2*m) - q(k, 5*m-2:5*m))];
% 
%     R = [R1; R2; R3; R4; R5; R6; R7; R8];


