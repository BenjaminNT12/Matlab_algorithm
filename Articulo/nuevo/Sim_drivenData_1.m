clc
clear all
close all

T=0.01;%paso de integración
t=[0:T:700];%tiempo de simulación

%% Inicializaciones
X=[1 15];%condiciones inciales [x1_0 x2_0]
u=0;

%%

x_hat=[5;10]; %2x1
C_hat=[0,0;0,0]; %2x2
A_hat=[0,0;0,0]; %2x2
Cu_hat=[0 0];    %1x2
Au_hat=[0 0];    %1x2
l_hat=0;

%% Referencia y sus derivadas
x1_d=sin(t).*cos(2*t);
x1_dp=[0 diff(x1_d)/T];
x1_d2p=[0 diff(x1_dp)/T];

%% Constantes
k1=10;
k2=8;

S=-150*eye(2);  %-30
eta=1.5; %1.5

Gamma1=[1,0.1;0.1,1];
Gamma2=[1,0.2;0.2,1];
Gamma3=1;
Gamma4=0.2;
Gamma5=1;
%% Ciclo
for i=1:length(t)-1
    
     [tt,xx] = ode45(@mod_drivenData_1, [t(i), t(i+1)], X(i,:), [], u(i));
     X(i+1,:) = xx(end,:);

    x1 = X(i+1,1); 
    x2 = X(i+1,2);

    xsys = [x1; x2] ;

%% Backstepping Vieja
%     z=x2+(x1)^3 ;
%     x1_til=-x1_d(i)+x1;
%    
%     u(i+1)=-1*(1/(cos(2*x1)+2))*(x1-0.5*x1-0.5*x2*(1-(cos(2*x1)+2)^2)+3*x1^2*(-x1-x1^3+z)+10*z+150*x1_til);

% 
%     %PREGUNTAR
%     %% Backsetpping Nueva
%error estado 1
    e=x1-x1_d(i);
%cambio de variable z, Backstepping nueva
    x2v=x1_d+x1_dp-k1*e;
    z=x2-x2v;
    e_p=-e-x1_d+z+x2v-x1_dp;
    x2v_p=x1_dp+x1_d2p-k1*e_p;

%u(i+1)=0.2;
u(i+1)=1*(1/(cos(2*x1)+2))*(0.5*x1+0.5*x2*(1-(cos(2*x1)+2)^2)+x2v_p(i+1)-e-k2*z(i+1));
     if u(i+1)>100
         u(i+1)=100;
     end
    if u(i+1)<-100
         u(i+1)=-100;
     end

    em=xsys-x_hat(:,i);
    v = S * em + ((l_hat * em) / (em' * em + eta) ) ;
    fx = tanh(x_hat(:,i)) ;

%x_hat
    x_hat(:,i+1)= x_hat(:,i)+T*(C_hat'*x_hat(:,i)+A_hat'*fx+Cu_hat'*u(i+1)+Au_hat'-v);
   

%Matrices de Actualización
    C_hat=C_hat+T*(Gamma1*x_hat(:,i)*em');
    A_hat=A_hat+T*(Gamma2*tanh(x_hat(:,i))*em');
    Cu_hat=Cu_hat+T*(Gamma3*u(i+1)*em');
    Au_hat=Au_hat+T*(Gamma4*em');
    l_hat=l_hat+T*(-Gamma5*((em'*em)/(em'*em +eta)));
%Plot
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
end
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

%% Gráficas
ref=x1_d;
%
figure(1)
subplot(211) 
plot(t,X(:,1),t,ref)
legend('x_1','ref')
%
subplot(212)
plot(t,X(:,2))
legend('x_2')
hold on

figure(2)
plot(t,u)
legend('u')


figure(3)
subplot(211)
plot(t,X(:,1),t,x_hat(1,:))
legend('x1','x1_h')
subplot(212)
plot(t,X(:,2),t,x_hat(2,:)) 
legend('x2','x2_h')
hold on

figure(4)
subplot(311)
plot(t,lambda_plot)
legend('lambda')
subplot(312)
plot(t,Cu_plot(:,1),t,Cu_plot(:,2))
legend('Cu_1','Cu_2')
subplot(313)
plot(t,Au_plot(:,1),t,Au_plot(:,2))
legend('Au_1','Au_2')

% 
figure(5)
subplot(211)
plot(t,A11_plot,t,A12_plot,t,A21_plot,t,A22_plot)
legend('A_11','A_12','A_21','A_22')
subplot(212)
plot(t,C11_plot,t,C12_plot,t,C21_plot,t,C22_plot)
legend('C_11','C_12','C_21','C_22')

