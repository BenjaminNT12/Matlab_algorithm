clc
clear all
close all

%% Configuración del ciclo principal, condiciones iniciales

T = 0.01 ;
t = [ 0 : T : 200 ] ;


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

%xsistema deseadas
    %posicion y velocidad
x1d = T_1 ;
x2d = p_T1 ;

    %derivadas
x1d_p = p_T1 ;
x2d_p = pp_T1; 

    %vectores
xd_ = [ x1d ;x2d ] ;
xd_p = [ x1d_p; x2d_p ] ;

%%%%%%%%%%%%%%%%%%
%Inicializaciones

X   = [x1d(1), 0];
tau = [0; 0; 0; 0; 0; 0];


u_ = 0 ;

W1_hat_=[1;1;1];
W2_hat_=[1;1;1];

%% Pesos obtenidos por el entrenamiento 
load('prueba_X.mat')

%lambda_tilde = -2.9655 ;


ud_ = 0;

u_ = 0;

ue_hat_=0;


%% Ciclo principal


for i=1:length(t)-1

    [tt xx] = ode45(@p200s_mod_X_ident,[t(i) t(i+1)],X(i,:),[],u_(i)) ;
    X(i+1,:) = xx(end,:) ;

     % variables de estado 
    x = X(i+1,1) ; 
    xp = X(i+1,2) ;
 
    xsistema = [x; xp] ;
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

    Nabla_phi1=[2*e1,0;e2,e1;0,2*e2];
    %phi2=[e1;e1*e2;e2]; 
    phi2=[e1;e1*e2;e2];       

    sigma=Nabla_phi1*(C_hat'*e_ac+A_hat'*fe_+Cu_hat'*ue_hat_);

    s1=sigma/(sigma'*sigma +1);

    W1_hat_=W1_hat_+T*(-a1*s1*(s1'*W1_hat_+e_ac'*Q*e_ac+ue_hat_'*R*ue_hat_));

    W2_hat_=W2_hat_+T*(-a2*phi2*(W2_hat_'*phi2+0.5*inv(R)*Cu_hat*Nabla_phi1'*W1_hat_));

    ue_hat_=W2_hat_'*phi2;


     u_(i+1) = ue_hat_ + ud_(i);


     W1_plot(:,i) = W1_hat_;
     W2_plot(:,i) = W2_hat_;
     e1_plot(i) = e1;
     e2_plot(i) = e2;


    %u(i+1) = 0;


end

W1_plot(:,i+1) = W1_hat_;
W2_plot(:,i+1) = W2_hat_;
e1_plot(i+1) = e1;
e2_plot(i+1) = e2;


figure(1)
subplot(211) 
plot(t,X(:,1),t,x1d)
legend('x_1','ref')
%
subplot(212)
plot(t,X(:,2),t,x2d)
legend('x_2','ref')
hold on

figure(2)
plot(t,u_)
legend('u')

figure(3)
subplot(211) 
plot(t,W1_plot(1,:),t,W1_plot(2,:),t,W1_plot(3,:))
legend('W1_1','W1_2','W1_3')
%
subplot(212)
plot(t,W2_plot(1,:),t,W2_plot(2,:),t,W2_plot(3,:))
legend('W2_1','W2_2','W2_3') 
hold on

figure(4)
subplot(211) 
plot(t,e1_plot)
legend('e1')
%
subplot(212)
plot(t,e2_plot)
legend('e2') 
hold on

