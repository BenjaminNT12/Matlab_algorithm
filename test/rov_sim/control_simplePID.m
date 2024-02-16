clc, clear; close all;

T = 0.01;
t = 0:T:20;


% condiciones iniciales de los errores
Ie = [0;0;0;0;0;0];
%% Generación de Trayectorias

%Amplitud
A = 0.5:0.5:2.5;
%Periodo
p1 = 1:1:15;
P = zeros(size(p1));
for i = 1:length(p1)
    P(i) = 1 / p1(i); % P(1)= 1/1, P(2)= 1/2, ..., P(15)= 1/15;
end

%Frecuencia
f = 2:2:10;
F = zeros(size(f));
for i = 1:length(f)
    F(i) = pi / f(i); % F(1)= pi/2, F(2)= pi/4, ..., F(6)= pi/10;
end

%trayectorias
T_1 = A(2)*sin(2*pi*P(10)*t + F(2)) + A(3)*cos(2*pi*P(7)*t + F(1)) + A(4)*sin(2*pi*P(5)*t + 2*F(1)) + A(1)*sin(2*pi*P(3)*t + 2*F(3)) + A(5)*cos(2*pi*P(15)*t + F(3));

T_2 = A(2)*sin(2*pi*P(8)*t + 2*F(3)) + A(4)*cos(2*pi*P(12)*t + F(2)) + A(3)*sin(2*pi*P(6)*t + F(1)) + A(5)*cos(2*pi*P(15)*t + F(3)) + A(1)*sin(2*pi*P(5)*t + F(1)) + A(5)*cos(2*pi*P(10)*t + F(2));

T_3 = A(4)*sin(2*pi*P(7)*t + F(2)) + A(3)*cos(2*pi*P(11)*t + 2*F(3)) + A(2)*sin(2*pi*P(9)*t + F(1)) + A(5)*cos(2*pi*P(14)*t + F(3)) + A(1)*sin(2*pi*P(6)*t + F(2)) + A(2)*cos(2*pi*P(12)*t + F(2)) + A(2)*sin(2*pi*P(12)*t + (2/5)*F(1));

T_4 = A(3)*sin(2*pi*P(12)*t + 2*F(3)) + A(2)*cos(2*pi*P(8)*t + F(2)) + A(4)*sin(2*pi*P(10)*t + F(1)) + A(5)*cos(2*pi*P(15)*t + F(3)) + A(1)*sin(2*pi*P(7)*t + F(2)) + A(2)*cos(2*pi*P(9)*t + (2/5)*F(1)) + A(4)*sin(2*pi*P(6)*t + (2)*F(3));

%Derivadas Trayectoria 1
p_T1 = diff(T_1)/T;
p_T1 = [p_T1  p_T1(end)];

pp_T1 = diff(p_T1)/T;
pp_T1 = [pp_T1  pp_T1(end)];


%Derivadas Trayectoria 2
p_T2 = diff(T_2)/T;
p_T2 = [p_T2  p_T2(end)];

pp_T2 = diff(p_T2)/T;
pp_T2 = [pp_T2 pp_T2(end)];


%Derivadas Trayectoria 3
p_T3 = diff(T_3)/T;
p_T3 = [p_T3  p_T3(end)];

pp_T3 = diff(p_T3)/T;
pp_T3 = [pp_T3  pp_T3(end)];

%Derivadas Trayectoria 4
p_T4 = diff(T_4)/T;
p_T4 = [p_T4  p_T4(end)];

pp_T4 = diff(p_T4)/T;
pp_T4 = [pp_T4 pp_T4(end)];

%% referencias

% % x-y deseadas
 A = 4;              % amplitud
 Tp = 20;             % periodo
 f = 1/Tp;            % frecuencia
 omega = 2*pi*f;     % frecuencia de oscilacion

 zd   =  A*cos(omega*t);
 zdp  = -A*omega*sin(omega*t);
 zd = T_3;
 zdp = p_T3;
%xd = 0*t ; 

 yd   =  A*sin(omega*t);
 ydp  =  A*omega*cos(omega*t);

 yd = T_2;
 ydp = p_T2;
%yd = 0*t ;

% % z deseada
 xd   = 2*t;
 xdp  = 2*ones(1,length(t));
 xd = T_4;
 xdp = p_T4;

%zd   = sin(t) ;
%zdp  = cos(t) ;

% % phi deseada
 phid = zeros(1,length(t));
 phidp = zeros(1,length(t));
%phid = 0*t ;

% % theta deseada
 thetad = zeros(1,length(t));
 thetadp = zeros(1,length(t));
%thetad = 0*t ;

% % psi deseada
 psid   = 2*pi*ones(1,length(t));
 psidp  = zeros(1,length(t));

 psid   =  A*sin(omega*t);
 
 psidp  =  A*omega*cos(omega*t);

%psid   = 2*pi*ones(1,length(t));
%psidp  = zeros(1,length(t));


%% Ganancias de control
Kp = 5*diag([50, 50, 50, 80, 50, 80]);
Ki = 4*diag([0.5, 0.5, 0.5, 0.3, 0.1, 1]);
Kd = 40*diag([0.9, 0.9, 0.9, 0.5, 0.4, 1]);


%% condiciones iniciales
X   = [xd(1), yd(1), zd(1), phid(1), thetad(1), psid(1), 0, 0, 0, 0, 0, 0];
tau = [0; 0; 0; 0; 0; 0];


for i=1:length(t)-1
    
    [tt,xx] = ode45(@mod_submaDOF6, [t(i), t(i+1)], X(i,:), [], tau(:,i));
    X(i+1,:) = xx(end,:);
    
    % variables de estado 
    x = X(i+1,1) ; 
    y = X(i+1,2) ;
    z = X(i+1,3) ; %Estimar x1
    phi = X(i+1,4) ;
    theta = X(i+1,5) ;
    psi = X(i+1,6) ; %Estimar en x2
    u = X(i+1,7) ;
    v = X(i+1,8) ;
    w = X(i+1,9) ;
    p = X(i+1,10) ;
    q = X(i+1,11) ;
    r = X(i+1,12) ;


    %% Modelo cinematico
    J1 = [cos(psi)*cos(theta), cos(psi)*sin(theta)*sin(phi) - sin(psi)*cos(phi), cos(psi)*sin(theta)*cos(phi) + sin(psi)*sin(phi);
          sin(psi)*cos(theta), sin(psi)*sin(theta)*sin(phi) + cos(psi)*cos(phi), sin(psi)*sin(theta)*cos(phi) - cos(psi)*sin(phi);
          -sin(theta),         cos(theta)*sin(phi),                              cos(theta)*cos(phi)];
      
    J2 = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);
          0, cos(phi),            -sin(phi);
          0, sin(phi)*sec(theta), cos(phi)*sec(theta)];
      
    J = [J1, zeros(3,3);
         zeros(3,3), J2]; 

    nu = [u; v; w; p; q; r]; 
    etap = J*nu;

    xp = etap(1); yp = etap(2); zp = etap(3); phip = etap(4); thetap = etap(5); psip = etap(6);



    %% Control PID
    
    % errores
    eta = [x; y; z; phi; theta; psi]; 
    etad = [xd(i+1); yd(i+1); zd(i+1); phid(i+1); thetad(i+1); psid(i+1)];
   
    % error
    e(:,i+1) =  etad - eta;
    
    % derivada del error
    ed(:,i+1) =  (e(:,i+1) -  e(:,i))/T;
    
    % integral del error
    ei(:,i+1) = Ie;
    Ie = Ie + T*e(:,i+1);
    
    % Control PID
    tau_PID = Kp*e(:,i+1) + Ki*ei(:,i+1) + Kd*ed(:,i+1);
        
     
   % convercion de la senal de control al plano del cuerpo  
   tau(:,i+1) = J'*tau_PID;


end

figure(1)
subplot(3,1,1)
plot(t, xd, 'k--', t, X(:,1), 'r' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('x_d', 'x')

subplot(3,1,2)
plot(t, yd, 'k--', t, X(:,2), 'r' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('y_d', 'y')

subplot(3,1,3)
plot(t, zd, 'k--', t, X(:,3), 'r' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('z_d', 'z')

figure(2)
subplot(3,1,1)
plot(t, phid, 'k--', t, X(:,4), 'b' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('phi_d', 'phi')

subplot(3,1,2)
plot(t, thetad, 'k--', t, X(:,5), 'b' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('theta_d', 'theta')

subplot(3,1,3)
plot(t, psid, 'k--', t, X(:,6), 'b' ,'LineWidth', 2.5)
set(gca, 'FontSize', 12)
legend('psi_d', 'psi')


