clc, clear; close all;

T = 0.01;
fin = 100;
t = 0:T:fin;

condicionesInicialesError = [0;
                             0;
                             0;
                             0;
                             0;
                             0];

[trayectoria1, trayectoria2, trayectoria3 , trayectoria4] = calcular_trayectorias(T, fin);

amplitudPsi = 0.2;

trayectoria4 = amplitudPsi*trayectoria4

%% Derivadas de la trayectoria 1
trayectoria1P = diff(trayectoria1)/T;
trayectoria1P = [trayectoria1P  trayectoria1P(end)];

trayectoria1PP = diff(trayectoria1P)/T;
trayectoria1PP = [trayectoria1PP  trayectoria1PP(end)];

%% Derivadas de la trayectoria 2
trayectoria2P = diff(trayectoria2)/T;
trayectoria2P = [trayectoria2P  trayectoria2P(end)];

trayectoria2PP = diff(trayectoria2P)/T;
trayectoria2PP = [trayectoria2PP  trayectoria2PP(end)];

%% Derivadas de la trayectoria 3
trayectoria3P = diff(trayectoria3)/T;
trayectoria3P = [trayectoria3P  trayectoria3P(end)];

trayectoria3PP = diff(trayectoria3P)/T;
trayectoria3PP = [trayectoria3PP  trayectoria3PP(end)];

%% Derivadas de la trayectoria 4
trayectoria4P = diff(trayectoria4)/T;
trayectoria4P = [trayectoria4P  trayectoria4P(end)];

trayectoria4PP = diff(trayectoria4P)/T;
trayectoria4PP = [trayectoria4PP  trayectoria4PP(end)];


zd = trayectoria3;
zdP = trayectoria3P;
zdPP = trayectoria3PP;

yd = trayectoria2;
ydP = trayectoria2P;
ydPP = trayectoria2PP;

xd = trayectoria4;
xdP = trayectoria4P;
xdPP = trayectoria4PP;

% % phi deseada
phid = zeros(1,length(t));
phidP = zeros(1,length(t));

% % theta deseada
thetad = zeros(1,length(t));
thetadP = zeros(1,length(t));

% % psi deseada
psid   = trayectoria4;
psidP  = trayectoria4P;


%% referencias actor crítico


%posicion y velocida3
x1d = T_4;
x2d = p_T4;

    %derivadas
x1d_p = p_T4 ;
x2d_p = pp_T4; 

    %vectores
xd_ = [ x1d ;x2d ] ;
xd_p = [ x1d_p; x2d_p ] ;
























































































% figure(1)
% plot(t, psid)
% hold on
% plot(t, psidP)


% figure(2)
% plot(t, phid)
% hold on
% plot(t, phidP)

% figure(3)
% plot(t, thetad)
% hold on
% plot(t, thetadP)



% figure(1)
% plot(t, xd)
% hold on
% plot(t, xdP)
% hold on
% plot(t, xdPP)

% figure(2)
% plot(t, xd)
% hold on
% plot(t, xdP)
% hold on
% plot(t, xdPP)

% figure(3)
% plot(t, xd)
% hold on
% plot(t, xdP)
% hold on
% plot(t, xdPP)