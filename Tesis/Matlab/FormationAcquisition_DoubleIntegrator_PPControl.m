% calculo de la matriz de Rigidez

clc
close all
clear
tic
kv = 0.1;
ka = 1;
delt = 1;

T = 0.02;
m = 3;
n = 8;
l = 18;
fin = 4.5;
t = 0: T :fin;

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

%CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION a + (b-a).*rand(N,1).
q1 = qd1 + delt*(rand(1,m) - 0.1);
q2 = qd2 + delt*(rand(1,m) - 0.1);
q3 = qd3 + delt*(rand(1,m) - 0.1);
q4 = qd4 + delt*(rand(1,m) - 0.1);
q5 = qd5 + delt*(rand(1,m) - 0.1);
q6 = qd6 + delt*(rand(1,m) - 0.1);
q7 = qd7 + delt*(rand(1,m) - 0.1);
q8 = qd8 + delt*(rand(1,m) - 0.1);

q = [q1, q2, q3, q4, q5, q6, q7, q8];

v = 2*(rand(1,m*n))-5.5;

qt = zeros(length(E),m);
e = zeros(length(t),length(E));
z = zeros(length(E),1);
d = zeros(length(E),1);

figure(1)
for i = 1:length(q)/m
    plot3(q(i*m-2), q(i*m-1), q(i*m),"x",'LineWidth',2,'MarkerSize',15);
    hold on;
end

% DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
for i = 1:length(E)
    d(i) = norm(qd(E(i,1)*m-2:E(i,1)*m) - qd(E(i,2)*m-2:E(i,2)*m));
end


% ALGORITMO CONTROL -ka*s + vfp - (R'*z)';

u = zeros(length(t), length(qd));
ua = zeros(length(t), length(qd));
vf = zeros(length(t), length(qd));
P = zeros(length(t), length(qd)/m, m);

% FUNCION PPF 
xinf = 0.05;
gama = 1.5;
deltaInferiorInf = 1;
deltaSuperiorInf = 1;
v1 = 0.34;

chi  = coth(gama*t + v1) - 1 + xinf;
chip = -gama*csch(gama*t + v1).^2;
chi2p = 2*gama^2*(csch(gama*t + v1).^2).*coth(gama*t + v1);


for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
        e(k,i) = norm(qt(i,:)) - d(i);
%%%%%%%%%%%%%%%%%% PPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if k == 1
            ep(k,i) = e(k,i)/T;
        else
            ep(k,i) = (e(k,i) - e(k-1,i))/T;
        end

        varphi(k,i) = e(k,i)/chi(i);
        
        z1(k,i) = (1/2)*log( (varphi(k,i) + deltaInferiorInf) / (deltaSuperiorInf - varphi(k,i)) );

        rho(k,i) = (1/(2*chi(i)))*( (1/(varphi(k,i) + deltaInferiorInf)) - (1/(varphi(k,i) - deltaSuperiorInf))); % se puede obtener    

        z1p(k,i) = rho(k,i)*( ep(k,i) - ( e(k,i)*chip(i) )/chi(i) );

%%%%%%%%%%%%%%%%%% PPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         z(i) = z1(k,i)*(z1(k,i) + 2*d(i));
%%%%%%%%%%%%%%%%%% PPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
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
% CALCULO DE ua    
    ua(k,:) = -kv*R'*z; % AQUI DEBE CONTENER z1

    vf(k,:) = ua(k,:);

% ERROR DE VELOCIDAD    
    s = v(k,:) - vf(k,:);

% CALCULO DE VF PUNTO DERIVADA DE VF    
    if k == 1
        vfp = vf(k,:)/T;
    else
        vfp = (vf(k,:) - vf(k-1,:))/T;
    end

% CALCULO DEL CONTROL    
    u(k,:) = -ka*s + vfp - (R'*z)'; % Y AQUI DEBE TENER z1p

% INTEGRAL vP = u
    v(k+1,:) = v(k,:) + u(k,:)*T;
% INTEGRAL qP = v
    q(k+1,:) = q(k,:) + v(k,:)*T;

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
end

figure(7)
plot(t,varphi)
hold on
plot(t,chi)

figure(8)
plot(t,ep)
axis([0 fin -5 5])

figure(9)
plot(t,z1p)
axis([0 fin -5 5])


%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 

figure(1)

grid on
axis([-6 2 -6 2 -6 2])
h1 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',1.5);
h2 = animatedline('LineStyle',"-.",'Color','#D95319','LineWidth',1.5);
h3 = animatedline('LineStyle',"-.",'Color','#EDB120','LineWidth',1.5);
h4 = animatedline('LineStyle',"-.",'Color','#7E2F8E','LineWidth',1.5);
h5 = animatedline('LineStyle',"-.",'Color','#77AC30','LineWidth',1.5);
h6 = animatedline('LineStyle',"-.",'Color','#4DBEEE','LineWidth',1.5);
h7 = animatedline('LineStyle',"-.",'Color','#A2142F','LineWidth',1.5);
h8 = animatedline('LineStyle',"-.",'Color','#FF0000','LineWidth',1.5);

vid = VideoWriter('FormationAcquisition');

for i = 1: length(P(:,1,1))
    addpoints(h1, P(i,1,1), P(i,1,2), P(i,1,3));
    addpoints(h2, P(i,2,1), P(i,2,2), P(i,2,3));
    addpoints(h3, P(i,3,1), P(i,3,2), P(i,3,3));
    addpoints(h4, P(i,4,1), P(i,4,2), P(i,4,3));
    addpoints(h5, P(i,5,1), P(i,5,2), P(i,5,3));
    addpoints(h6, P(i,6,1), P(i,6,2), P(i,6,3));
    addpoints(h7, P(i,7,1), P(i,7,2), P(i,7,3));
    addpoints(h8, P(i,8,1), P(i,8,2), P(i,8,3));
    
    [grf] = Framework3Dplot(q(i,:), E);
    drawnow;
    frames(i) = getframe();
    if i < length(P(:,1,1))
        delete(grf);
    end
end
open(vid)
writeVideo(vid,frames)
close(vid)

title('Adquisición de la formación','FontSize',28)
xlabel('Eje-X')
ylabel('Eje-Y')
zlabel('Eje-Z')

lgd = legend({'$P-Inicial-q_{1}$','$P-Inicial-q_{2}$','$P-Inicial-q_{3}$','$P-Inicial-q_{4}$', ...
    '$P-Inicial-q_{5}$','$P-Inicial-q_{6}$','$P-Inicial-q_{7}$','$P-Inicial-q_{8}$', ...
    '$Trayectoria-q_{1}$','$Trayectoria-q_{2}$','$Trayectoria-q_{3}$','$Trayectoria-q_{4}$', ...
    '$Trayectoria-q_{5}$','$Trayectoria-q_{6}$','$Trayectoria-q_{7}$','$Trayectoria-q_{8}$', ...
    '','','','','','','','','','','','','','','','','','', ...
    '$P-Final-q_{1}$','$P-Final-q_{2}$','$P-Final-q_{3}$','$P-Final-q_{4}$', ...
    '$P-Final-q_{5}$','$P-Final-q_{6}$','$P-Final-q_{7}$','$P-Final-q_{8}$'}, ...
    'FontSize',12,'Interpreter','latex','Location','northeast');
lgd.FontSize = 16;
title(lgd,'Agentes');
grid on

% 
% 
% %%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR
% 
% figure(2)
% grid on
% axis([0 fin min(e(1,:)) max(e(1,:))]);
% 
% h1 = animatedline('Color','#0072BD',"Linewidth",2);
% h2 = animatedline('Color','#D95319','LineWidth',2);
% h3 = animatedline('Color','#EDB120','LineWidth',2);
% h4 = animatedline('Color','#7E2F8E','LineWidth',2);
% h5 = animatedline('Color','#77AC30','LineWidth',2);
% h6 = animatedline('Color','#4DBEEE','LineWidth',2);
% h7 = animatedline('Color','#A2142F','LineWidth',2);
% h8 = animatedline('Color','#FF0000','LineWidth',2);
% 
% h9 = animatedline('Color','#0072BD',"Linewidth",2);
% h10 = animatedline('Color','#D95319','LineWidth',2);
% h11 = animatedline('Color','#EDB120','LineWidth',2);
% h12 = animatedline('Color','#7E2F8E','LineWidth',2);
% h13 = animatedline('Color','#77AC30','LineWidth',2);
% h14 = animatedline('Color','#4DBEEE','LineWidth',2);
% h15 = animatedline('Color','#A2142F','LineWidth',2);
% h16 = animatedline('Color','#FF0000','LineWidth',2);
% 
% h17 = animatedline('Color','#7E2F8E','LineWidth',2);
% h18 = animatedline('Color','#77AC30','LineWidth',2);
% 
% h19 = animatedline('Color','#FF0000','LineWidth',2);
% 
% for i = 1: length(P(:,1,1))
%     addpoints(h1, t(i),e(i,1));
%     addpoints(h2, t(i),e(i,2));
%     addpoints(h3, t(i),e(i,3));
%     addpoints(h4, t(i),e(i,4));
%     addpoints(h5, t(i),e(i,5));
%     addpoints(h6, t(i),e(i,6));
%     addpoints(h7, t(i),e(i,7));
%     addpoints(h8, t(i),e(i,8));
% 
%     addpoints(h9,  t(i),e(i,9));
%     addpoints(h10, t(i),e(i,10));
%     addpoints(h11, t(i),e(i,11));
%     addpoints(h12, t(i),e(i,12));
%     addpoints(h13, t(i),e(i,13));
%     addpoints(h14, t(i),e(i,14));
%     addpoints(h15, t(i),e(i,15));
%     addpoints(h16, t(i),e(i,16));    
% 
%     addpoints(h17, t(i),e(i,17));
%     addpoints(h18, t(i),e(i,18));       
% 
%     addpoints(h19, t(i),chi(i));       
%     
%     [grf1] = line(t(i),e(:,1));
%     drawnow;
%     frames(i) = getframe();
%     if i < length(P(:,1,1))
%         delete(grf1);
%     end
% end
% 
% 
% %%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR
% 
% figure(3)
% grid on
% axis([0 fin -60 60])
% 
% h1 = animatedline('Color','#0072BD',"Linewidth",2);
% h2 = animatedline('Color','#D95319','LineWidth',2);
% h3 = animatedline('Color','#EDB120','LineWidth',2);
% h4 = animatedline('Color','#7E2F8E','LineWidth',2);
% h5 = animatedline('Color','#77AC30','LineWidth',2);
% h6 = animatedline('Color','#4DBEEE','LineWidth',2);
% h7 = animatedline('Color','#A2142F','LineWidth',2);
% h8 = animatedline('Color','#FF0000','LineWidth',2);
% 
% ax = 2;
% for i = 1: length(t)
%     addpoints(h1, t(i),u(i,m*1-ax));
%     addpoints(h2, t(i),u(i,m*2-ax));
%     addpoints(h3, t(i),u(i,m*3-ax));
%     addpoints(h4, t(i),u(i,m*4-ax));
%     addpoints(h5, t(i),u(i,m*5-ax));
%     addpoints(h6, t(i),u(i,m*6-ax));
%     addpoints(h7, t(i),u(i,m*7-ax));
%     addpoints(h8, t(i),u(i,m*8-ax));    
%     
%     [grf1] = line(t(i),u(:,1));
%     drawnow;
%     frames(i) = getframe();
%     if i < length(t)
%         delete(grf1);
%     end
% end
% 
% 
% 
% figure(4)
% 
% grid on
% axis([0 fin -60 60])
% 
% h1 = animatedline('Color','#0072BD',"Linewidth",2);
% h2 = animatedline('Color','#D95319','LineWidth',2);
% h3 = animatedline('Color','#EDB120','LineWidth',2);
% h4 = animatedline('Color','#7E2F8E','LineWidth',2);
% h5 = animatedline('Color','#77AC30','LineWidth',2);
% h6 = animatedline('Color','#4DBEEE','LineWidth',2);
% h7 = animatedline('Color','#A2142F','LineWidth',2);
% h8 = animatedline('Color','#FF0000','LineWidth',2);
% 
% ax = 1;
% for i = 1: length(t)
%     addpoints(h1, t(i),u(i,m*1-ax));
%     addpoints(h2, t(i),u(i,m*2-ax));
%     addpoints(h3, t(i),u(i,m*3-ax));
%     addpoints(h4, t(i),u(i,m*4-ax));
%     addpoints(h5, t(i),u(i,m*5-ax));
%     addpoints(h6, t(i),u(i,m*6-ax));
%     addpoints(h7, t(i),u(i,m*7-ax));
%     addpoints(h8, t(i),u(i,m*8-ax));    
%     
%     [grf1] = line(t(i),u(:,1));
%     drawnow;
%     frames(i) = getframe();
%     if i < length(t)
%         delete(grf1);
%     end
% end
% 
% 
% 
% figure(5)
% 
% 
% grid on
% axis([0 fin -60 60])
% 
% h1 = animatedline('Color','#0072BD',"Linewidth",2);
% h2 = animatedline('Color','#D95319','LineWidth',2);
% h3 = animatedline('Color','#EDB120','LineWidth',2);
% h4 = animatedline('Color','#7E2F8E','LineWidth',2);
% h5 = animatedline('Color','#77AC30','LineWidth',2);
% h6 = animatedline('Color','#4DBEEE','LineWidth',2);
% h7 = animatedline('Color','#A2142F','LineWidth',2);
% h8 = animatedline('Color','#FF0000','LineWidth',2);
% 
% ax = 0;
% for i = 1: length(t)
%     addpoints(h1, t(i),u(i,m*1-ax));
%     addpoints(h2, t(i),u(i,m*2-ax));
%     addpoints(h3, t(i),u(i,m*3-ax));
%     addpoints(h4, t(i),u(i,m*4-ax));
%     addpoints(h5, t(i),u(i,m*5-ax));
%     addpoints(h6, t(i),u(i,m*6-ax));
%     addpoints(h7, t(i),u(i,m*7-ax));
%     addpoints(h8, t(i),u(i,m*8-ax));    
%     
%     [grf1] = line(t(i),u(:,1));
%     drawnow;
%     frames(i) = getframe();
%     if i < length(t)
%         delete(grf1);
%     end
% end
% 
% 






    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
