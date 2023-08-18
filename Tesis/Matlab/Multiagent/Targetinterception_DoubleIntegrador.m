% % calculo de la matriz de Rigidez
tic
clc
close all
clear

kv   = 0.7;
ka   = 0.1;
kT   = 0.5;
ks   = 3;
delt = 1;
n    = 9;
m    = 3;
l    = 21;
T    = 0.02;
t    = T: T :10;
j    = 1;

screenshot = 5;

%% PUNTOS DESEADOS DE LA FORMACION
qd1 = [-1,       -1,     -1];
qd2 = [ 1,       -1,     -1];
qd3 = [ 1,        1,     -1];
qd4 = [-1,        1,     -1];
qd5 = [-1,       -1,      1];
qd6 = [ 1,       -1,      1];
qd7 = [ 1,        1,      1];
qd8 = [-1,        1,      1];
qd9 = [ 0,        0,      0];

qd = [qd1, qd2, qd3, qd4, qd5, qd6, qd7, qd8, qd9];

%% "EDGE" DE LA FORMACION (UNIONES)
E1   = [1 4];
E2   = [1 5];
E3   = [1 9];
E4   = [2 3];
E5   = [2 6];
E6   = [2 9];
E7   = [3 4];
E8   = [3 7];
E9   = [3 9];
E10  = [4 5];
E11  = [4 8];
E12  = [4 9];
E13  = [5 6];
E14  = [5 8];
E15  = [5 9];
E16  = [6 7];
E17  = [6 8];
E18  = [6 9];
E19  = [7 8];
E20  = [7 9];
E21  = [8 9];

E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18; E19; E20; E21];

%% CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
q1 = qd1 + delt*(rand(1,m) - 0.5);
q2 = qd2 + delt*(rand(1,m) - 0.5);
q3 = qd3 + delt*(rand(1,m) - 0.5);
q4 = qd4 + delt*(rand(1,m) - 0.5);
q5 = qd5 + delt*(rand(1,m) - 0.5);
q6 = qd6 + delt*(rand(1,m) - 0.5);
q7 = qd7 + delt*(rand(1,m) - 0.5);
q8 = qd8 + delt*(rand(1,m) - 0.5);
q9 = qd9 + delt*(rand(1,m) - 0.5);

q = [q1, q2, q3, q4, q5, q6, q7, q8, q9];

%% CONDICIONES INICIALES PARA LA VELOCIDAD DE LOS AGENTES
v   = 2*(rand(1,m*n))+2;
rho = 1;%+0.5*sin(0.15*t);


qt  = zeros(length(E),3);
e   = zeros(length(t),length(E));
z   = zeros(length(E),1);
d   = zeros(length(t),1);

vT  = [t'*0.0125,   zeros(length(t),1),  (cos(t))'];
qT  = zeros(length(t),3);
eT  = zeros(length(t),3);
%% PLOTEAR LA PRIMERA IMPRESION DE LA FORMACION CON CONDICIONES INICIALES
figure(1)
for i = 1:length(q)/m
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

%% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(:,i) = (rho*norm(qd(E(i,1)*3-2:E(i,1)*3) - qd(E(i,2)*3-2:E(i,2)*3)))';
end

%% GRAFICA LA PRIMERA FORMACION QUE AUN EL ERROR NO CONVERGE A CERO
% figure(1)
% Framework3Dplot2(q(end,:),E);
% hold on

u   = zeros(length(t), length(qd));
ua  = zeros(length(t), length(qd));
vd  = zeros(n*m, 1);
vf  = zeros(length(t), length(qd));
P   = zeros(length(t), length(qd)/m, m);
kronecker1 = zeros(length(t), n*m);
kronecker2 = zeros(length(t), n*m);

for k = 1:length(t)
    for i = 1:length(E)
%% CALCULO DE q TILDE
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
%% CALCULO DEL ERROR e
        e(k,i) = norm(qt(i,:)) - d(k,i);
%% CALCULO DEL ERROR z
        z(i) = e(k,i)*(e(k,i) + 2*d(k,i));
    end

%% MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
    R1  = [(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                          zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R2  = [(q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R3  = [(q(k, 1*m-2:1*m) - q(k, 9*m-2:9*m)),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 1*m-2:1*m) - q(k, 9*m-2:9*m))];
    R4  = [                         zeros(1,m), (q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)), -(q(k, 2*m-2:2*m) - q(k, 3*m-2:3*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R5  = [                         zeros(1,m), (q(k, 2*m-2:2*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 2*m-2:2*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R6  = [                         zeros(1,m), (q(k, 2*m-2:2*m) - q(k, 9*m-2:9*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 2*m-2:2*m) - q(k, 9*m-2:9*m))];
    R7  = [                         zeros(1,m),                          zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)), -(q(k, 3*m-2:3*m) - q(k, 4*m-2:4*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R8  = [                         zeros(1,m),                          zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 7*m-2:7*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 3*m-2:3*m) - q(k, 7*m-2:7*m)),                           zeros(1,m),                           zeros(1,m)];
    R9  = [                         zeros(1,m),                          zeros(1,m),  (q(k, 3*m-2:3*m) - q(k, 9*m-2:9*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 3*m-2:3*m) - q(k, 9*m-2:9*m))];
    R10 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),  (q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m)), -(q(k, 4*m-2:4*m) - q(k, 5*m-2:5*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R11 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),  (q(k, 4*m-2:4*m) - q(k, 8*m-2:8*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 4*m-2:4*m) - q(k, 8*m-2:8*m)),                           zeros(1,m)];
    R12 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),  (q(k, 4*m-2:4*m) - q(k, 9*m-2:9*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 4*m-2:4*m) - q(k, 9*m-2:9*m))];
    R13 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 5*m-2:5*m) - q(k, 6*m-2:6*m)), -(q(k, 5*m-2:5*m) - q(k, 6*m-2:6*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m)];
    R14 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 5*m-2:5*m) - q(k, 8*m-2:8*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 5*m-2:5*m) - q(k, 8*m-2:8*m)),                           zeros(1,m)];
    R15 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 5*m-2:5*m) - q(k, 9*m-2:9*m)),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m), -(q(k, 5*m-2:5*m) - q(k, 9*m-2:9*m))];
    R16 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 6*m-2:6*m) - q(k, 7*m-2:7*m)), -(q(k, 6*m-2:6*m) - q(k, 7*m-2:7*m)),                           zeros(1,m),                           zeros(1,m)];
    R17 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 6*m-2:6*m) - q(k, 8*m-2:8*m)),                           zeros(1,m), -(q(k, 6*m-2:6*m) - q(k, 8*m-2:8*m)),                           zeros(1,m)];
    R18 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 6*m-2:6*m) - q(k, 9*m-2:9*m)),                           zeros(1,m),                           zeros(1,m), -(q(k, 6*m-2:6*m) - q(k, 9*m-2:9*m))];
    R19 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 7*m-2:7*m) - q(k, 8*m-2:8*m)), -(q(k, 7*m-2:7*m) - q(k, 8*m-2:8*m)),                           zeros(1,m)];
    R20 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 7*m-2:7*m) - q(k, 9*m-2:9*m)),                           zeros(1,m), -(q(k, 7*m-2:7*m) - q(k, 9*m-2:9*m))];
    R21 = [                         zeros(1,m),                          zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),                           zeros(1,m),  (q(k, 8*m-2:8*m) - q(k, 9*m-2:9*m)), -(q(k, 8*m-2:8*m) - q(k, 9*m-2:9*m))];
    
    R = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14; R15; R16; R17; R18; R19; R20; R21];

%% CALCULO DE ua    
    ua(k,:) = -kv*R'*z;
%% INTEGRAL vT = qT
    qT(k+1, :) = qT(k, :)+vT(k,:)*T;
%% CALCULO DE eT    
    eT(k+1, :) = qT(k+1, :) - q(k,E(21,2)*3-2:E(21,2)*3);
%% CALCULO DE h
    h = kT*eT(k+1, :) + vT(k,:);
%% CALCULO DE PRODUCTO KRONECKER    
    for i = 1:n
        kronecker1(k,i*m-2: i*m,1) = h;
    end

    vf(k,:) = ua(k,:) + kronecker1(k, :);

%% ERROR DE VELOCIDAD    
    s = v(k,:) - vf(k,:);
    
%% CALCULO DE VF PUNTO DERIVADA DE VF    
    if k == 1
        uap = ua(k,:)/T;
    else
        uap = (ua(k,:) - ua(k-1,:))/T;
    end
%% CALCULO DE PRODUCTO KRONECKER 2
    for i = 1:n
        kronecker2(k,i*m-2: i*m,1) = kT*(vT(k,:)-v(k, 9*m-2:9*m));
    end
%% CALCULO DEL CONTROL 
    u(k,:) = -ka*s + uap + kronecker2(k,:)- ks*sign(s)-(R'*z)';

%% INTEGRAL vP = u
    v(k+1,:) = v(k,:)+u(k,:)*T;

%% INTEGRAL qP = v
    q(k+1,:) = q(k,:)+v(k,:)*T;

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
%% GRAFICA LA FORMACION EN DETERMINADO TIEMPO
%     if t(k) == screenshot(j)
%         if j < length(screenshot)
%             j = j+1;
%         end
%         figure(1);
%         Framework3Dplot2(q(end,:),E);
%         hold on
%     end
    
end


%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 
% figure(1)
% 
% Framework3Dplot(q(end,:),E);
% hold on
% plot3(qT(:,1),qT(:,2),qT(:,3),'.-c',"Linewidth",2.5)
% hold on
% % GRAFICA LA LINEA PUNTEADA DE LA TRAYECTORIA
% plot3(P(:,end,1),P(:,end,2),P(:,end,3),'-.r',"Linewidth",2.5);
% grid on
% ax = gca;
% ax.FontSize = 28;
% title('Intersección de objetivo')
% xlabel('Eje-X')
% ylabel('Eje-Y')
% zlabel('Eje-Z')
% 
% lgd = legend({'$P-Inicial-q_{1}$','$P-Inicial-q_{2}$','$P-Inicial-q_{3}$','$P-Inicial-q_{4}$', ...
%     '$P-Inicial-q_{5}$','$P-Inicial-q_{6}$','$P-Inicial-q_{7}$','$P-Inicial-q_{8}$','$P-Inicial-q_{9}$', ...
%     '','','','','','','','','','','','','','','','','','','','', ...
%     '','','','','','','','','','','','','','','','','','','','', ...
%     '','','','','','','','','','','','','','','','','','','','', ...
%     '','','','$P-Final-q_{1}$','$P-Final-q_{2}$','$P-Final-q_{3}$','$P-Final-q_{4}$','$P-Final-q_{5}$','$P-Final-q_{6}$','$P-Final-q_{7}$','$P-Final-q_{8}$','$P-Final-q_{9}$','$Objetivo$','$Trayectoria de Lider$'}, ...
%     'FontSize',12,'Interpreter','latex','Location','northeast')
% lgd.FontSize = 16
% title(lgd,'Agentes')
% grid on
%% PLOTEO DE ANIMACION
figure(1)
plot3(qT(:,1),qT(:,2),qT(:,3),'.-c',"Linewidth",2.5)
hold on
grid on
h1 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',1.5);
h2 = animatedline('LineStyle',"-.",'Color','#D95319','LineWidth',1.5);
h3 = animatedline('LineStyle',"-.",'Color','#EDB120','LineWidth',1.5);
h4 = animatedline('LineStyle',"-.",'Color','#7E2F8E','LineWidth',1.5);
h5 = animatedline('LineStyle',"-.",'Color','#77AC30','LineWidth',1.5);
h6 = animatedline('LineStyle',"-.",'Color','#4DBEEE','LineWidth',1.5);
h7 = animatedline('LineStyle',"-.",'Color','#A2142F','LineWidth',1.5);
h8 = animatedline('LineStyle',"-.",'Color','#FF0000','LineWidth',1.5);
h9 = animatedline('LineStyle',"-.",'Color','#E5E20D','LineWidth',1.5);

for i = 1: length(P(:,1,1))
    addpoints(h1, P(i,1,1), P(i,1,2), P(i,1,3));
    addpoints(h2, P(i,2,1), P(i,2,2), P(i,2,3));
    addpoints(h3, P(i,3,1), P(i,3,2), P(i,3,3));
    addpoints(h4, P(i,4,1), P(i,4,2), P(i,4,3));
    addpoints(h5, P(i,5,1), P(i,5,2), P(i,5,3));
    addpoints(h6, P(i,6,1), P(i,6,2), P(i,6,3));
    addpoints(h7, P(i,7,1), P(i,7,2), P(i,7,3));
    addpoints(h8, P(i,8,1), P(i,8,2), P(i,8,3));
    addpoints(h9, P(i,9,1), P(i,9,2), P(i,9,3));    
    
    grf = Framework3Dplot2(q(i,:), E);
    drawnow
    if i < length(P(:,1,1))
        delete(grf)
    end
end

% Framework3Dplot(q(end,:),E);

title('Adquisicion de la formacion','FontSize',28)
xlabel('Eje-X')
ylabel('Eje-Y')
zlabel('Eje-Z')

lgd = legend({'$P-Inicial-q_{1}$','$P-Inicial-q_{2}$','$P-Inicial-q_{3}$','$P-Inicial-q_{4}$', ...
    '$P-Inicial-q_{5}$','$P-Inicial-q_{6}$','$P-Inicial-q_{7}$','$P-Inicial-q_{8}$','$P-Inicial-q_{9}$', ...
    '$Objetivo$','$P-Final-q_{1}$','$P-Final-q_{2}$','$P-Final-q_{3}$','$P-Final-q_{4}$','$P-Final-q_{5}$','$P-Final-q_{6}$','$P-Final-q_{7}$','$P-Final-q_{8}$','$P-Final-q_{9}$'}, ...
    'FontSize',12,'Interpreter','latex','Location','northeast');
lgd.FontSize = 16;
title(lgd,'Agentes')
grid on

figure(2)

for i = 1:length(E)
    plot(t,e(:,i),"Linewidth",2)
    hold on
end
grid on
title('Errores de distancia entre agentes')
xlabel('Segundos')
ylabel('Distancia')
figure(3)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-2),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje X')
xlabel('Segundos')
ylabel('Control')
figure(4)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m-1),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje Y')
xlabel('Segundos')
ylabel('Control')
figure(5)

for i = 1:length(u(1,:))/m
    plot(t,u(:,i*m),"Linewidth",2)
    hold on
end
grid on
title('Entrada de control eje Z')
xlabel('Segundos')
ylabel('Control')
toc



