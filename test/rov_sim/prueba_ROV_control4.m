clc, clear; close all;

T = 0.01;
t = 0:T:100;


% condiciones iniciales de los errores
Ie = [0;0;0;0;0;0];
%% Generación de Trayectorias

%Amplitud
A = 0.5:0.5:2.5;
%Periodo
p1 = 1:1:15;


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


%% Referencia actor/critico

hdt = zeros(1,length(t));
hdt = T_2;

hdt_p = diff(hdt)/T;
hdt_p = [hdt_p hdt_p(end)];

hdt_2p = diff(hdt_p)/T;
hdt_2p = [hdt_2p hdt_2p(end)];

%posicion y velocida3
x1d = T_4;
x2d = p_T4;

    %derivadas
x1d_p = p_T4 ;
x2d_p = pp_T4; 

    %vectores
xd_ = [ x1d ;x2d ] ;
xd_p = [ x1d_p; x2d_p ] ;

%% Ganancias de control
Kp = 5*diag([50, 50, 50, 80, 50, 80]);
Ki = 4*diag([0.5, 0.5, 0.5, 0.3, 0.1, 1]);
Kd = 40*diag([0.9, 0.9, 0.9, 0.5, 0.4, 1]);


%% condiciones iniciales
X   = [xd(1), yd(1), zd(1), phid(1), thetad(1), psid(1), 0, 0, 0, 0, 0, 0];
tau = [0; 0; 0; 0; 0; 0];

ud_ = 0;

u_ = 0;

ue_hat_=0;



W1_hat_=[1;1;1];
W2_hat_=[1;1;1];

load('prueba_X.mat')
%  load('prueba_Y.mat')
% load('prueba_Z.mat')
% load('prueba_PSI.mat')
% load('prueba_PHI.mat')
% load('prueba_THE.mat')


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

    xp_plot(i) = xp;
    yp_plot(i) = yp;
    zp_plot(i) = zp;
    phip_plot(i) = phip;
    thetap_plot(i) = thetap;
    psip_plot(i) = psip;

%% Actor/critico

 xsistema = [x; xp] ;
%  xsistema = [y; yp] ;
    %


    fd_ = tanh(xd_(:,i)) ;
    f_ = tanh(xsistema) ;

    fe_ = f_ - fd_ ;

    ud_(i+1)= pinv(Cu_hat)' * ( xd_p(:,i) - (C_hat' * xd_(:,i)) - (A_hat' * fd_) - Au_hat' ) ;

    e_ac = xsistema - xd_(:,i) ;
    e1=e_ac(1);
    e2=e_ac(2);

    


    %ue(i+1) = pinv(Cu') * (  -C'*e -  A'*fe - Kue*e) ;


    Q=eye(2);
    R=1;
    a1=0.8;
    a2=0.5;

    % %X
    Nabla_phi1=[1,0;e2,e1;0,1];
    phi2=[e1;0;e2];

    % %Z
    % Nabla_phi1=[2*e1,0;e2,e1;0,2*e2];
    % phi2=[e1;e1*e2;e2];

    % %Y
    % a1=0.8;
    % a2=0.5;
    % Nabla_phi1=[e2,1;e1,1;0,e1];
    % phi2=[1;1;1];
     
           

    sigma=Nabla_phi1*(C_hat'*e_ac+A_hat'*fe_+Cu_hat'*ue_hat_);

    s1=sigma/(sigma'*sigma +1);

    W1_hat_=W1_hat_+T*(-a1*s1*(s1'*W1_hat_+e_ac'*Q*e_ac+ue_hat_'*R*ue_hat_));

    W2_hat_=W2_hat_+T*(-a2*phi2*(W2_hat_'*phi2+0.5*inv(R)*Cu_hat*Nabla_phi1'*W1_hat_));

    ue_hat_=W2_hat_'*phi2;


     %u_(i+1) = ue_hat_ + ud_(i);
     u_ = ue_hat_ + ud_(i);

    %   if u_>150
    %      u_=150;
    %  end
    % if u_<-150
    %      u_=-150;
    % end


     W1_plot(:,i) = W1_hat_;
     W2_plot(:,i) = W2_hat_;
     e1_plot(i) = e1;
     e2_plot(i) = e2;
     u_plot(i) = u_;



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
   tau(1,i+1) = u_;


end

W1_plot(:,i+1) = W1_hat_;
W2_plot(:,i+1) = W2_hat_;
e1_plot(i+1) = e1;
e2_plot(i+1) = e2;
u_plot(i+1) = u_;

    xp_plot(i+1) = xp;
    yp_plot(i+1) = yp;
    zp_plot(i+1) = zp;
    phip_plot(i+1) = phip;
    thetap_plot(i+1) = thetap;
    psip_plot(i+1) = psip;


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




figure(3)
plot(t,u_plot)
legend('u ActorCritico')

figure(4)
subplot(211) 
plot(t,W1_plot(1,:),t,W1_plot(2,:),t,W1_plot(3,:))
legend('W1_1','W1_2','W1_3')
%
subplot(212)
plot(t,W2_plot(1,:),t,W2_plot(2,:),t,W2_plot(3,:))
legend('W2_1','W2_2','W2_3') 
hold on


figure(5)
subplot(211) 
plot(t,X(:,1),t,x1d)
legend('x_1','ref')
%
subplot(212)
plot(t,xp_plot,t,x2d)
legend('x_2','ref')
hold on


figure(6)
subplot(211) 
plot(t,e1_plot)
legend('e1')
%
subplot(212)
plot(t,e2_plot)
legend('e2') 
hold on
