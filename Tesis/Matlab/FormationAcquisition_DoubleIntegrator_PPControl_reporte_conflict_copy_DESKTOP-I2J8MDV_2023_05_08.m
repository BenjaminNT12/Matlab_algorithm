% % calculo de la matriz de Rigidez
% 
% clc
% close all
% clear
% 
% kv = 1;
% delt = 1;
% 
% T = 0.001;
% 
% t = T: T :3;
% 
% s1 = sin(2*pi/5);
% s2 = sin(4*pi/5);
% c1 = cos(2*pi/5);
% c2 = cos(pi/5);
% 
% % PUNTOS DESEADOS DE LA FORMACION
% qd1 = [0,     1];
% qd2 = [-s1,  c1];
% qd3 = [-s2, -c2];
% qd4 = [s2,  -c2];
% qd5 = [s1,   c1];
% 
% qd = [qd1, qd2, qd3, qd4, qd5];
% 
% % "EDGE" DE LA FORMACION (UNIONES)
% E1  = [1 2];
% E2  = [1 3];
% E3  = [1 4];
% E4  = [1 5];
% E5  = [2 3];
% E6  = [3 4];
% E7 = [4 5];
% 
%  
% E = [E1; E2; E3; E4; E5; E6; E7];
% 
% %CONDICIONES INICIALES DE LOS PUNTOS DE INICIO DE LA FORMACION
% q1 = qd1 + delt*(rand(1,2)-0.01);
% q2 = qd2 + delt*(rand(1,2)-0.01);
% q3 = qd3 + delt*(rand(1,2)-0.01);
% q4 = qd4 + delt*(rand(1,2)-0.01);
% q5 = qd5 + delt*(rand(1,2)-0.01) ;
% 
% q = [q1, q2, q3, q4, q5];
% 
% figure(1)
% xlim([-2 2])
% ylim([-2 2])
% framework(q(end,:),E);
% hold on
% 
% qt = zeros(length(E),2);
% e = zeros(length(t),length(E));
% z = zeros(length(E),1);
% d = zeros(length(E),1);
% 
% 
% for i = 1:length(q)/2
%     plot(q(i*2-1), q(i*2),"x");
%     hold on;
% end
% 
% % DISTANCIA DESEADA DISTANCIA ENTRE LOS PUNTOS OBJETIVOS
% for i = 1:length(E)
%     d(i) = norm(qd(E(i,1)*2-1:E(i,1)*2) - qd(E(i,2)*2-1:E(i,2)*2));
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% deltaSuperiorInf = 1;
% deltaInferiorInf = 1;
% aij = 1.8;
% x0 = 1;
% xinf = 0.03;
% chi  = (x0-xinf)*exp(-aij*t)+xinf;
% 
% 
% % gama = 1.5;
% % v1 = 0.5;
% 
% % chi  = coth(gama*t + v1) - 1 + xinf;
% 
% % ALGORITMO CONTROL U = -KV*R*Z
% 
% for k = 1:length(t)
%     for i = 1:length(E)
%         qt(i,:) = q(k,E(i,1)*2-1:E(i,1)*2) - q(k,E(i,2)*2-1:E(i,2)*2);
%         e(k,i) = norm(qt(i,:)) - d(i);
%         z(i,:) = e(k,i)*(e(k,i) + 2*d(i));
% 
%         eta(k,i) = e(k,i)*(norm(qt(i,:)) + d(i));
%         varphi(k,i) = e(k,i)/chi(k);
%         z1(k,i) = (1/2)*log((varphi(k,i)+deltaInferiorInf)./(deltaSuperiorInf-varphi(k,i)));
%     end
% % MATRIZ DE RIGIDEZ DEBE CAMBIARSE DEPENDIENDO DE LA FORMACION DESEADA    
%     R1 = [ (q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)), -(q(k, 1*2-1:1*2) - q(k, 2*2-1:2*2)),                            zeros(1,2),                            zeros(1,2),                            zeros(1,2)];
%     R2 = [ (q(k, 1*2-1:1*2) - q(k, 3*2-1:3*2)),                           zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 3*2-1:3*2)),                            zeros(1,2),                            zeros(1,2)];
%     R3 = [ (q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2)),                           zeros(1,2),                            zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 4*2-1:4*2)),                            zeros(1,2)];
%     R4 = [ (q(k, 1*2-1:1*2) - q(k, 5*2-1:5*2)),                           zeros(1,2),                            zeros(1,2),                            zeros(1,2),  -(q(k, 1*2-1:1*2) - q(k, 5*2-1:5*2))];
%     R5 = [                          zeros(1,2),  (q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),  -(q(k, 2*2-1:2*2) - q(k, 3*2-1:3*2)),                            zeros(1,2),                            zeros(1,2)];
%     R6 = [                          zeros(1,2),                           zeros(1,2),   (q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2)),  -(q(k, 3*2-1:3*2) - q(k, 4*2-1:4*2)),                            zeros(1,2)];
%     R7 = [                          zeros(1,2),                           zeros(1,2),                            zeros(1,2),   (q(k, 4*2-1:4*2) - q(k, 5*2-1:5*2)),  -(q(k, 4*2-1:4*2) - q(k, 5*2-1:5*2))];
%    
%     rho = eye(7,7).*(1/chi(k)).*( (1./(varphi(k,:)+deltaInferiorInf)) - (1./(varphi(k,:)-deltaSuperiorInf))  );
% 
%     R = [R1; R2; R3; R4; R5; R6; R7];
% 
%     u(k,:) = -R'*rho'*kv*z1(k,:)';
% %     u(k,:) = -kv*R'*z;
%     
% % INTEGRAL qP = u
%     for i = 1: 10
%         q(k+1,i) = q(k,i)+u(k,i)*T;
%     end
% 
%     for i = 1:length(q(end,:))/2
%         P(k,i,:) = [q(end, i*2-1), q(end, i*2)];
%     end
%     
% end
% 
% rangoR = rank(R)
% gaussJR = rref(R)
% %%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 
% 
% figure(2)
% 
% framework(q(end,:),E);
% xlim([-2 2])
% ylim([-2 2])
% hold on
% 
% for i = 1: length(P(1,:,1))
%     plot(P(:,i,1),P(:,i,2));
%     hold on
% end
% 
% figure(3)
% 
% for i = 1:length(E)
%     plot(t,e(:,i))
%     hold on
%     plot(t,chi);
%     hold on
%     plot(t,-chi);
%     hold on        
% end
% 
% z1






% calculo de la matriz de Rigidez

clc
close all
clear
tic
kv = 0.1;
ka = 1;
delt = 1;

T = 0.01;
m = 3;
n = 8;
l = 18;
fin = 1.4
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
q1 = qd1 + delt*(rand(1,m) - 0.5);
q2 = qd2 + delt*(rand(1,m) - 0.5);
q3 = qd3 + delt*(rand(1,m) - 0.5);
q4 = qd4 + delt*(rand(1,m) - 0.5);
q5 = qd5 + delt*(rand(1,m) - 0.5);
q6 = qd6 + delt*(rand(1,m) - 0.5);
q7 = qd7 + delt*(rand(1,m) - 0.5);
q8 = qd8 + delt*(rand(1,m) - 0.5);

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
%%%%%%%%%%%%%% PPC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
deltaSuperiorInf = 1;
deltaInferiorInf = 1;
aij = 1.9;
x0 = 1;
xinf = 0.03;
chi  = (x0-xinf)*exp(-aij*t)+xinf;

% ALGORITMO CONTROL -ka*s + vfp - (R'*z)';

u = zeros(length(t), length(qd));
ua = zeros(length(t), length(qd));
vf = zeros(length(t), length(qd));
P = zeros(length(t),length(qd)/m, m);

for k = 1:length(t)
    for i = 1:length(E)
        qt(i,:) = q(k ,E(i,1)*3-2:E(i,1)*3) - q(k,E(i,2)*3-2:E(i,2)*3);
        e(k,i) = norm(qt(i,:)) - d(i);
        z(i) = e(k,i)*(e(k,i) + 2*d(i));
        
        eta(k,i) = e(k,i)*(norm(qt(i,:)) + d(i));
        varphi(k,i) = e(k,i)/chi(k);
        z1(k,i) = (1/2)*log((varphi(k,i)+deltaInferiorInf)./(deltaSuperiorInf-varphi(k,i)));

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
     
    rho = eye(length(E),length(E)).*(1/chi(k)).*( (1./(varphi(k,:)+deltaInferiorInf)) - (1./(varphi(k,:)-deltaSuperiorInf))  );

    R = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14; R15; R16 ;R17; R18];
% CALCULO DE ua    
    ua(k,:) = -R'*rho'*kv*z1(k,:)';
%     ua(k,:) = -kv*R'*z;
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
    u(k,:) = -ka*s + vfp - (R'*z)';

% INTEGRAL vP = u
    v(k+1,:) = v(k,:)+u(k,:)*T;

% INTEGRAL qP = v
    q(k+1,:) = q(k,:)+v(k,:)*T;

    for i = 1:length(q(end,:))/3
        P(k,i,:) = [q(end, i*3-2), q(end, i*3-1) , q(end, i*3)];
    end
    k
end
% 
% %%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR Y LA TRAYECTORIA DE FORMACION 
% 
% figure(1)
% grid on
% axis([-6 2 -6 2 -6 2])
% h1 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',1.5);
% h2 = animatedline('LineStyle',"-.",'Color','#D95319','LineWidth',1.5);
% h3 = animatedline('LineStyle',"-.",'Color','#EDB120','LineWidth',1.5);
% h4 = animatedline('LineStyle',"-.",'Color','#7E2F8E','LineWidth',1.5);
% h5 = animatedline('LineStyle',"-.",'Color','#77AC30','LineWidth',1.5);
% h6 = animatedline('LineStyle',"-.",'Color','#4DBEEE','LineWidth',1.5);
% h7 = animatedline('LineStyle',"-.",'Color','#A2142F','LineWidth',1.5);
% h8 = animatedline('LineStyle',"-.",'Color','#FF0000','LineWidth',1.5);
% 
% vid = VideoWriter('FormationAcquisition')
% 
% for i = 1: length(P(:,1,1))
%     addpoints(h1, P(i,1,1), P(i,1,2), P(i,1,3));
%     addpoints(h2, P(i,2,1), P(i,2,2), P(i,2,3));
%     addpoints(h3, P(i,3,1), P(i,3,2), P(i,3,3));
%     addpoints(h4, P(i,4,1), P(i,4,2), P(i,4,3));
%     addpoints(h5, P(i,5,1), P(i,5,2), P(i,5,3));
%     addpoints(h6, P(i,6,1), P(i,6,2), P(i,6,3));
%     addpoints(h7, P(i,7,1), P(i,7,2), P(i,7,3));
%     addpoints(h8, P(i,8,1), P(i,8,2), P(i,8,3));
%     
%     [grf] = Framework3Dplot(q(i,:), E);
%     drawnow
%     frames(i) = getframe();
%     if i < length(P(:,1,1))
%         delete(grf);
% %         delete(mark)
%     end
% end
% open(vid)
% writeVideo(vid,frames)
% close(vid)
% 
% 
% 
% % Framework3Dplot(q(end,:),E);
% 
% title('Adquisición de la formación','FontSize',28)
% xlabel('Eje-X')
% ylabel('Eje-Y')
% zlabel('Eje-Z')
% 
% lgd = legend({'$P-Inicial-q_{1}$','$P-Inicial-q_{2}$','$P-Inicial-q_{3}$','$P-Inicial-q_{4}$', ...
%     '$P-Inicial-q_{5}$','$P-Inicial-q_{6}$','$P-Inicial-q_{7}$','$P-Inicial-q_{8}$', ...
%     '$Trayectoria-q_{1}$','$Trayectoria-q_{2}$','$Trayectoria-q_{3}$','$Trayectoria-q_{4}$', ...
%     '$Trayectoria-q_{5}$','$Trayectoria-q_{6}$','$Trayectoria-q_{7}$','$Trayectoria-q_{8}$', ...
%     '','','','','','','','','','','','','','','','','','', ...
%     '$P-Final-q_{1}$','$P-Final-q_{2}$','$P-Final-q_{3}$','$P-Final-q_{4}$', ...
%     '$P-Final-q_{5}$','$P-Final-q_{6}$','$P-Final-q_{7}$','$P-Final-q_{8}$'}, ...
%     'FontSize',12,'Interpreter','latex','Location','northeast')
% lgd.FontSize = 16
% title(lgd,'Agentes')
% grid on
% 
% 
% 
% 
% 
% 
% 
% 
% 
% figure(2)
% 
% for i = 1:length(E)
%     plot(t,e(:,i),"Linewidth",2)
%     hold on
% end
% title('Errores de distancia entre agentes')
% xlabel('Segundos')
% ylabel('Distancia')
% % legend({'$error_{1}$','$error_{2}$','$error_{3}$','$error_{4}$','$error_{5}$','$error_{6}$'},'Interpreter','latex','Location','northeast')
% grid on
% 
%  
% 
% 
% 
% 
% 
% 
% 
% figure(3)
% 
% for i = 1:length(u(1,:))/m
%     plot(t,u(:,i*m-2),"Linewidth",2)
%     hold on
% end
% title('Entrada de control eje X')
% xlabel('Segundos')
% ylabel('Control')
% % legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','northeast')
% grid on
% 
% 
% 
% 
% 
% 
% figure(4)
% 
% for i = 1:length(u(1,:))/m
%     plot(t,u(:,i*m-1),"Linewidth",2)
% %     legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','southwest')
%     hold on
% end
% title('Entrada de control eje Y')
% xlabel('Segundos')
% ylabel('Control')
% % legend({'$u1_{Y}$','$u2_{Y}$','$u3_{Y}$','$u4_{Y}$'},'Interpreter','latex','Location','northeast')
% grid on
% 
% 
% 
% 
% 
% 
% 
% 
% figure(5)
% 
% for i = 1:length(u(1,:))/m
%     plot(t,u(:,i*m),"Linewidth",2)
%     hold on
% end
% title('Entrada de control eje Z')
% xlabel('Segundos')
% ylabel('Control')
% % legend({'$u1_{Z}$','$u2_{Z}$','$u3_{Z}$','$u4_{Z}$'},'Interpreter','latex','Location','northeast')
% grid on
% toc
% 
% 
% 
% 
% 
% 
% 
% 

% % 
% % figure(1)
% % grid on
% % Framework3Dplot(q(end,:),E);
% % 
% % hold on
% % 
% % figure(1)
% % % GRAFICA LA TRAYECTORIA DE TODOS LOS AGENTES
% % for i = 1: length(P(1,:,1))
% %     plot3(P(:,i,1),P(:,i,2),P(:,i,3),'-.',"Linewidth",2);
% %     hold on
% % end
% % title('Pirámide triangular')
% % xlabel('Eje-X')
% % ylabel('Eje-Y')
% % zlabel('Eje-Z')
% % legend({'','','','','','','','','','','','','','','$q_{1}$','$q_{2}$','$q_{3}$','$q_{4}$'},'Interpreter','latex','Location','northeast')
% % grid on
% % figure(2)
% % 
% % for i = 1:length(E)
% %     plot(t,e(:,i),"Linewidth",2)
% %     hold on
% %     plot(t,chi,"--r","Linewidth",2)
% %     hold on
% %     plot(t,-chi,"--r","Linewidth",2)
% % end
% % title('Errores de distancia entre agentes')
% % xlabel('Segundos')
% % ylabel('Distancia')
% % legend({'$error_{1}$','$error_{2}$','$error_{3}$','$error_{4}$','$error_{5}$','$error_{6}$'},'Interpreter','latex','Location','northeast')
% % grid on
% % figure(3)
% % 
% % for i = 1:length(u(1,:))/m
% %     plot(t,u(:,i*m-2),"Linewidth",2)
% %     hold on
% % end
% % title('Entrada de control eje X')
% % xlabel('Segundos')
% % ylabel('Control')
% % legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','northeast')
% % grid on
% % figure(4)
% % 
% % for i = 1:length(u(1,:))/m
% %     plot(t,u(:,i*m-1),"Linewidth",2)
% % %     legend({'$u1_{X}$','$u2_{X}$','$u3_{X}$','$u4_{X}$'},'Interpreter','latex','Location','southwest')
% %     hold on
% % end
% % title('Entrada de control eje Y')
% % xlabel('Segundos')
% % ylabel('Control')
% % legend({'$u1_{Y}$','$u2_{Y}$','$u3_{Y}$','$u4_{Y}$'},'Interpreter','latex','Location','northeast')
% % grid on
% % 
% % figure(5)
% % 
% % for i = 1:length(u(1,:))/m
% %     plot(t,u(:,i*m),"Linewidth",2)
% %     hold on
% % end
% % title('Entrada de control eje Z')
% % xlabel('Segundos')
% % ylabel('Control')
% % legend({'$u1_{Z}$','$u2_{Z}$','$u3_{Z}$','$u4_{Z}$'},'Interpreter','latex','Location','northeast')
% % grid on
% % toc
% % 
% % 
% % 
% % 
% % 


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



%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR

figure(2)
grid on
axis([0 fin min(e(1,:)) max(e(1,:))]);

h1 = animatedline('Color','#0072BD',"Linewidth",2);
h2 = animatedline('Color','#D95319','LineWidth',2);
h3 = animatedline('Color','#EDB120','LineWidth',2);
h4 = animatedline('Color','#7E2F8E','LineWidth',2);
h5 = animatedline('Color','#77AC30','LineWidth',2);
h6 = animatedline('Color','#4DBEEE','LineWidth',2);
h7 = animatedline('Color','#A2142F','LineWidth',2);
h8 = animatedline('Color','#FF0000','LineWidth',2);

h9 = animatedline('Color','#0072BD',"Linewidth",2);
h10 = animatedline('Color','#D95319','LineWidth',2);
h11 = animatedline('Color','#EDB120','LineWidth',2);
h12 = animatedline('Color','#7E2F8E','LineWidth',2);
h13 = animatedline('Color','#77AC30','LineWidth',2);
h14 = animatedline('Color','#4DBEEE','LineWidth',2);
h15 = animatedline('Color','#A2142F','LineWidth',2);
h16 = animatedline('Color','#FF0000','LineWidth',2);

h17 = animatedline('Color','#7E2F8E','LineWidth',2);
h18 = animatedline('Color','#77AC30','LineWidth',2);

h19 = animatedline('Color','#FF0000','LineWidth',2);

for i = 1: length(P(:,1,1))
    addpoints(h1, t(i),e(i,1));
    addpoints(h2, t(i),e(i,2));
    addpoints(h3, t(i),e(i,3));
    addpoints(h4, t(i),e(i,4));
    addpoints(h5, t(i),e(i,5));
    addpoints(h6, t(i),e(i,6));
    addpoints(h7, t(i),e(i,7));
    addpoints(h8, t(i),e(i,8));

    addpoints(h9,  t(i),e(i,9));
    addpoints(h10, t(i),e(i,10));
    addpoints(h11, t(i),e(i,11));
    addpoints(h12, t(i),e(i,12));
    addpoints(h13, t(i),e(i,13));
    addpoints(h14, t(i),e(i,14));
    addpoints(h15, t(i),e(i,15));
    addpoints(h16, t(i),e(i,16));    

    addpoints(h17, t(i),e(i,17));
    addpoints(h18, t(i),e(i,18));       

    addpoints(h19, t(i),chi(i));       
    
    [grf1] = line(t(i),e(:,1));
    drawnow;
    frames(i) = getframe();
    if i < length(P(:,1,1))
        delete(grf1);
    end
end


%%% PLOTEA Y GRAFICA TODAS LAS GRAFICAS DE ERROR

figure(3)
grid on
axis([0 fin -60 60])

h1 = animatedline('Color','#0072BD',"Linewidth",2);
h2 = animatedline('Color','#D95319','LineWidth',2);
h3 = animatedline('Color','#EDB120','LineWidth',2);
h4 = animatedline('Color','#7E2F8E','LineWidth',2);
h5 = animatedline('Color','#77AC30','LineWidth',2);
h6 = animatedline('Color','#4DBEEE','LineWidth',2);
h7 = animatedline('Color','#A2142F','LineWidth',2);
h8 = animatedline('Color','#FF0000','LineWidth',2);

ax = 2;
for i = 1: length(t)
    addpoints(h1, t(i),u(i,m*1-ax));
    addpoints(h2, t(i),u(i,m*2-ax));
    addpoints(h3, t(i),u(i,m*3-ax));
    addpoints(h4, t(i),u(i,m*4-ax));
    addpoints(h5, t(i),u(i,m*5-ax));
    addpoints(h6, t(i),u(i,m*6-ax));
    addpoints(h7, t(i),u(i,m*7-ax));
    addpoints(h8, t(i),u(i,m*8-ax));    
    
    [grf1] = line(t(i),u(:,1));
    drawnow;
    frames(i) = getframe();
    if i < length(t)
        delete(grf1);
    end
end



figure(4)

grid on
axis([0 fin -60 60])

h1 = animatedline('Color','#0072BD',"Linewidth",2);
h2 = animatedline('Color','#D95319','LineWidth',2);
h3 = animatedline('Color','#EDB120','LineWidth',2);
h4 = animatedline('Color','#7E2F8E','LineWidth',2);
h5 = animatedline('Color','#77AC30','LineWidth',2);
h6 = animatedline('Color','#4DBEEE','LineWidth',2);
h7 = animatedline('Color','#A2142F','LineWidth',2);
h8 = animatedline('Color','#FF0000','LineWidth',2);

ax = 1;
for i = 1: length(t)
    addpoints(h1, t(i),u(i,m*1-ax));
    addpoints(h2, t(i),u(i,m*2-ax));
    addpoints(h3, t(i),u(i,m*3-ax));
    addpoints(h4, t(i),u(i,m*4-ax));
    addpoints(h5, t(i),u(i,m*5-ax));
    addpoints(h6, t(i),u(i,m*6-ax));
    addpoints(h7, t(i),u(i,m*7-ax));
    addpoints(h8, t(i),u(i,m*8-ax));    
    
    [grf1] = line(t(i),u(:,1));
    drawnow;
    frames(i) = getframe();
    if i < length(t)
        delete(grf1);
    end
end



figure(5)


grid on
axis([0 fin -60 60])

h1 = animatedline('Color','#0072BD',"Linewidth",2);
h2 = animatedline('Color','#D95319','LineWidth',2);
h3 = animatedline('Color','#EDB120','LineWidth',2);
h4 = animatedline('Color','#7E2F8E','LineWidth',2);
h5 = animatedline('Color','#77AC30','LineWidth',2);
h6 = animatedline('Color','#4DBEEE','LineWidth',2);
h7 = animatedline('Color','#A2142F','LineWidth',2);
h8 = animatedline('Color','#FF0000','LineWidth',2);

ax = 0;
for i = 1: length(t)
    addpoints(h1, t(i),u(i,m*1-ax));
    addpoints(h2, t(i),u(i,m*2-ax));
    addpoints(h3, t(i),u(i,m*3-ax));
    addpoints(h4, t(i),u(i,m*4-ax));
    addpoints(h5, t(i),u(i,m*5-ax));
    addpoints(h6, t(i),u(i,m*6-ax));
    addpoints(h7, t(i),u(i,m*7-ax));
    addpoints(h8, t(i),u(i,m*8-ax));    
    
    [grf1] = line(t(i),u(:,1));
    drawnow;
    frames(i) = getframe();
    if i < length(t)
        delete(grf1);
    end
end








