clc, clear; close all;

T = 0.01;
t = 0:T:500;


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

%derivadas
p_T1 = diff(T_1)/T;
p_T_1 = [p_T1  p_T1(end)];

p_T2 = diff(T_1)/T;
p_T_2 = [p_T2  p_T2(end)];

p_T3 = diff(T_3)/T;
p_T_3 = [p_T3  p_T3(end)];

p_T4 = diff(T_4)/T;
p_T_4 = [p_T4  p_T4(end)];

%% referencias
% % x-y deseadas
 A = 4 ;              % amplitud
 Tp = 20;             % periodo
 f = 1/Tp;            % frecuencia
 omega = 2*pi*f;     % frecuencia de oscilacion

 zd   =  A*cos(omega*t);
 zdp  = -A*omega*sin(omega*t);
 zd = T_3;
 zdp = p_T_3;
%xd = 0*t ; 

 yd   =  A*sin(omega*t);
 ydp  =  A*omega*cos(omega*t);

 yd = T_2;
 ydp = p_T_2;
%yd = 0*t ;

% % z deseada
 xd   = 2*t;
 xdp  = 2*ones(1,length(t));
 xd = T_4;
 xdp = p_T_4;

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
% Kp = 5*diag([50, 50, 50, 80, 50, 80]);
% Ki = 4*diag([0.5, 0.5, 0.5, 0.3, 0.1, 1]);
% Kd = 40*diag([0.9, 0.9, 0.9, 0.5, 0.4, 1]);  %con estas aguanta hasta
% 1000s pero da grados de 400 en psi


Kp = 5*diag([50, 50, 50, 80, 50, 80]);
Ki = 4*diag([0.5, 0.5, 0.5, 0.3, 0.1, 1]);
Kd = 40*diag([0.9, 0.9, 0.9, 0.5, 0.4, 1]);


%% condiciones iniciales
X   = [xd(1), yd(1), zd(1), phid(1), thetad(1), psid(1), 0, 0, 0, 0, 0, 0];
tau = [0; 0; 0; 0; 0; 0];


%% Identificación
S=-20*eye(2);  %-30
%S=[-20,0;0,-30];
%S=0*eye(2);

eta_cte=0.01*1.5; %1.5
eta_cte=0.001*1.5;

Gamma1=0.1*[1,0.1;0.1,1];
Gamma1=0.001*[1,0.1;0.1,1];

Gamma2=0.1*[1,0.2;0.2,1];
Gamma2=0.001*[1,0.2;0.2,1];

Gamma3=0.1*1;
Gamma3=0.001*1;

Gamma4=0.1*0.2;
Gamma4=0.001*0.2;

Gamma5=0.1*1;
Gamma5=0.001*1;

%% Inicializaciones
x_hat=[0.2;0]; %2x1
C_hat=[0,0;0,0]; %2x2
A_hat=[0,0;0,0]; %2x2
Cu_hat=[0 0];    %1x2
Au_hat=[0 0];    %1x2
l_hat=0;

u_=0;



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
     
    %% Identificador 1
    % 
    % Dinámicas a estimar
    sistema = [theta; thetap] ;
    %psisistema = [psi; r] ;
     
    %Actualización por medio de la NN

    em=sistema-x_hat(:,i);
    v = S * em + ((l_hat * em) / (em' * em + eta_cte) ) ;
    fx_ = tanh(x_hat(:,i)) ;

    % emp=psisistema-x_hat_p(:,i);
    % vp = S * emp + ((l_hat_z * emp) / (emp' * emp + eta_cte) ) ;
    % fx_p = tanh(x_hat_p(:,i)) ;



    x_hat(:,i+1)= x_hat(:,i)+T*(C_hat'*x_hat(:,i)+A_hat'*fx_+Cu_hat'*u_+Au_hat'-v);

     %x_hat_p(:,i+1)= x_hat_p(:,i)+T*(C_hat_p'*x_hat_p(:,i)+A_hat_p'*fx_p+Cu_hat_p'*up+Au_hat_p'-vp);
    % %Matrices de Actualización
    C_hat=C_hat+T*(Gamma1*x_hat(:,i)*em');
    A_hat=A_hat+T*(Gamma2*tanh(x_hat(:,i))*em');
    Cu_hat=Cu_hat+T*(Gamma3*u_*em'); 
    Au_hat=Au_hat+T*(Gamma4*em');
    l_hat=l_hat+T*(-Gamma5*((em'*em)/(em'*em +eta_cte)));


    % C_hat_p=C_hat_p+T*(Gamma1*x_hat_p(:,i)*emp');
    % A_hat_p=A_hat_p+T*(Gamma2*tanh(x_hat_p(:,i))*emp');
    % Cu_hat_p=Cu_hat_p+T*(Gamma3*up*emp'); 
    % Au_hat_p=Au_hat_p+T*(Gamma4*emp');
    % l_hat_p=l_hat_p+T*(-Gamma5*((emp'*emp)/(emp'*emp +eta_cte)));

    
   e_identificacion(:,i+1) = sistema - x_hat(:,i);





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
   % %%
     u_ = tau(5,i+1);
     %up= tau(6,i+1);
     uz_plot(i+1)=u_;
     %up_plot(i+1)=up;

     
   % u2 = tau(6,i+1);
   % us(:,i+1) = [ u1 ; u2]; %Vector columna 2x1, se va a guardar como una matriz

   if u_>100
         u_=100;
     end
    if u_<-100
         u_=-100;
    end

     


  
    %Plot z
    C11_plot(i) = C_hat(1,1,:);
    C12_plot(i) = C_hat(1,2,:);
    C21_plot(i) = C_hat(2,1,:);
    C22_plot(i) = C_hat(2,2,:);
    %A_plot(:,:,i) = A_hat;
    A11_plot(i) = A_hat(1,1,:);
    A12_plot(i) = A_hat(1,2,:);
    A21_plot(i) = A_hat(2,1,:);
    A22_plot(i) = A_hat(2,2,:);
    Cu_plot(i,:) = Cu_hat;
    Au_plot(i,:) = Au_hat;
    lambda_plot(i) = l_hat;
    xp_plot(i) = xp;
    yp_plot(i) = yp;
    zp_plot(i) = zp;
    phip_plot(i) = phip;
    thetap_plot(i) = thetap;
    psip_plot(i) = psip;


    
  
A11_plot(i+1) = A_hat(1,1,:);
A12_plot(i+1) = A_hat(1,2,:);
A21_plot(i+1) = A_hat(2,1,:);
A22_plot(i+1) = A_hat(2,2,:);
%C_plot(:,:,i+1) = C_hat;
C11_plot(i+1) = C_hat(1,1,:);
C12_plot(i+1) = C_hat(1,2,:);
C21_plot(i+1) = C_hat(2,1,:);
C22_plot(i+1) = C_hat(2,2,:);
lambda_plot(i+1) = l_hat;
Cu_plot(i+1,:) = Cu_hat;
Au_plot(i+1,:) = Au_hat;
xp_plot(i+1) = xp;
yp_plot(i+1) = yp;
zp_plot(i+1) = zp;
phip_plot(i+1) = phip;
thetap_plot(i+1) = thetap;
psip_plot(i+1) = psip;

end

save('prueba_THE.mat', 'A_hat', 'C_hat', 'Au_hat', 'Cu_hat','l_hat');
% % figure(1)
% % plot3(xd, yd, zd, 'k--',X(:,1), X(:,2),X(:,3), 'r'), grid on
% % xlabel('x [m]')
% % ylabel('y [m]')
% % zlabel('z [m]')
% figure(1)
% subplot(3,1,1)
% plot(t, xd, 'k--', t, X(:,1), 'r' ,'LineWidth', 2.5)
% set(gca, 'FontSize', 12)
% legend('x_d', 'x')
% 
% subplot(3,1,2)
% plot(t, yd, 'k--', t, X(:,2), 'r' ,'LineWidth', 2.5)
% set(gca, 'FontSize', 12)
% legend('y_d', 'y')
% 
% subplot(3,1,3)
% plot(t, zd, 'k--', t, X(:,3), 'r' ,'LineWidth', 2.5)
% set(gca, 'FontSize', 12)
% legend('z_d', 'z')
% 
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
% 
% figure(3)
% plot(t,uz_plot)
% legend('uz')



figure(4)
subplot(211)
plot(t,X(:,5),t,x_hat(1,:))
legend('x1','x1_h')
subplot(212)
plot(t,thetap_plot,t,x_hat(2,:)) 
legend('x2','x2_h')
hold on

figure(5)
subplot(311)
plot(t,lambda_plot)
legend('lambda')
subplot(312)
plot(t,Cu_plot(:,1),t,Cu_plot(:,2))
legend('Cu_1','Cu_2')
subplot(313)
plot(t,Au_plot(:,1),t,Au_plot(:,2))
legend('Au_1','Au_2')


figure(6)
subplot(211)
plot(t,A11_plot,t,A12_plot,t,A21_plot,t,A22_plot)
legend('A_11','A_12','A_21','A_22')
subplot(212)
plot(t,C11_plot,t,C12_plot,t,C21_plot,t,C22_plot)
legend('C_11','C_12','C_21','C_22')

figure(5)
subplot(211)
plot(t(end-5000:end),e_identificacion(1,end-5000:end),'r')
legend('e1')
subplot(212)
plot(t(end-5000:end),e_identificacion(2,end-5000:end),'g') 
legend('e2')
hold on