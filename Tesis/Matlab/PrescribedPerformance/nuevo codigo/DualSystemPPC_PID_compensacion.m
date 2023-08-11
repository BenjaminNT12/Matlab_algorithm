%control PD con PPC


clc
clear
close all

x = [1 0];
T = 0.01;
fin = 5;
t = 0 : T : fin;

xinf = 0.05;
gama = 1.5;
deltaInferiorInf = 1;
deltaSuperiorInf = 1;

Jm = 0.026;
Jl = 0.0113;
Bm = 1.3;
Bl = 1.3;
k = 560;
c = 0.15;
a = 0.2;
n = 11.5;
v = 0.5;
beta = 1.75;
alpha = 2;

beta = 1.75;
alpha = 2;

k1 = 120*12;
k2 = 200;

yd = 5*sin(2*pi*t)/4;
ydp = 10*pi*cos(2*pi*t)/4;


yd2p = -20*pi*sin(2*pi*t)/4;

chi  = coth(gama*t + v) - 1 + xinf;
chip = -gama*csch(gama*t + v).^2;
chi2p = 2*gama^2*(csch(gama*t + v).^2).*coth(gama*t + v);

for i = 1: length(t)-1
    e(i) = x(i,1) - yd(i);
    ep(i) = x(i,2) - ydp(i);


    varphi(i) = e(i)/chi(i);
    rho(i) = (1/(2*chi(i)))   *( (1/(varphi(i) + deltaInferiorInf)) - (1/(varphi(i) - deltaSuperiorInf)) ); % se puede obtener    
    

    z1(i) = (1/2)*log( (varphi(i) + deltaInferiorInf) / (deltaSuperiorInf - varphi(i)) );
    z1p(i) = rho(i)*( ep(i) - ( e(i)*chip(i) )/chi(i) );


    mu(i) = (-2*chip(i))/(2*chi(i));
    eta(i) = 1/(2*chi(i));
    varphip(i) = (ep(i)*chi(i)-e(i)*chip(i))/chi(i)^2;
    rhop(i) = mu(i)*(1/(deltaSuperiorInf-varphi(i))) + eta(i)*(-varphip(i)/(deltaInferiorInf - varphi(i))) - mu(i)*(1/(varphi(i) - deltaInferiorInf)) + eta(i)*(varphip(i)/(varphi(i)-deltaInferiorInf)^2);
    alpha(i) = rhop(i) * ( x(i,2) - ydp(i) - e(i)*chip(i)/chi(i) );
    beta(i) = -yd2p(i) - ep(i)*chip(i)/chi(i) - e(i)*chi2p(i)/chi(i) + e(i)*chip(i)^2/chi(i)^2;
    
    
    u(i) = ( (n*Jm + Jl)/rho(i) ) * ( -alpha(i) -beta(i)*rho(i) - k1*z1(i) - k2*z1p(i) ) + n*Bm*x(i,2);
    
    
    [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i));
    x(i+1, 1) = (xx(end, 1));
    x(i+1, 2) = (xx(end, 2));
end
i = i+1;
e(i) = x(i,1) - yd(i);
ep(i) = x(i,2) - ydp(i);
u(i)=u(i-1);

figure(1)
plot(t,x(:,1))
hold on
plot(t,yd(:))
legend('Estado','trayectoria deseada');
figure(2)
plot(t, chi(:))
hold on
plot(t, -chi(:))
hold on 
plot(t, e(:))
% axis([0 fin -2 2 ])
legend('ppf','ppfp','error');
figure(3)
plot(t,u)
title('Señal de control')



figure(8)
plot(t,ep)










% clc
% clear
% close all
% 
% x = [0.1 0];
% T = 0.01;
% N =  100
% t = 0 : T : 5;
% 
% xinf = 1.2;
% gama = 1.5;
% deltaInferiorInf = 1;
% deltaSuperiorInf = 1;
% 
% Jm = 0.026;
% Jl = 0.0113;
% Bm = 1.3;
% Bl = 1.3;
% k = 560;
% c = 0.15;
% a = 0.2;
% n = 11.5;
% v = 0.001;
% beta = 1.75;
% alpha = 2;
% 
% 
% k1 = 120/1;
% k2 = 70/1;
% k3 = 50/1;
% 
% yd = 5*sin(2*pi*t);
% ydp = 10*pi*cos(2*pi*t);
% 
% 
% ppf  = coth(gama*t + v) - 1 + xinf;
% ppfp = -gama*csch(gama*t + v).^2;
% 
% eI(1) = 0;
% eTI(1) = 0;
% zI(1) = 0;
% 
% for i = 1: length(t)-1
%     e(i+1) = yd(i) - x(i,1);
%     ep(i+1) = ydp(i) - x(i,2);
%     eI(i+1) = eI(i) + e(i+1)*T;
% 
%     phi(i+1) = e(i+1)/ppf(i);
%     rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
%     z1p(i+1) = rho(i+1)*(ep(i+1) - ( e(i+1)*ppfp(i) )/ppf(i) );
%     z1(i+1) = (1/2)*log( (phi(i+1) + deltaInferiorInf) / (deltaSuperiorInf - phi(i+1)));
%     zI(i+1) = zI(i) + z1(i+1)*T;
% %     Sz1(i+1) = (deltaSuperiorInf*exp(z1(i+1)) - deltaInferiorInf*exp(-z1(i+1)))/(exp(z1(i+1)) + exp(-z1(i+1)));
% %     eT(i+1) = ppf(i)*Sz1(i+1);
% 
% %     eTp(i+1) = (eT(i+1) - eT(i))/T;
% % 
% %     eTI(i+1) = eTI(i) + eT(i+1)*T;
% 
% 
%     
% 
% % %     mu(i+1) = (-2*ppfp(i))/(2*ppf(i));
% % %     eta(i+1) = 1/(2*ppf(i));
% % %     rhop(i+1) = mu(i+1)*(1/(deltaSuperiorInf-phi(i+1))) + eta(i+1)*(-phip(i+1)/(deltaInferiorInf - phi(i+1))) - mu(i+1)*(1/(phi(i+1) - deltaInferiorInf)) + eta(i+1)*(phip(i+1)/(phi(i+1)-deltaInferiorInf)^2);
% % 
% % %     betaTilde(i+1) = rhop(i+1)  *(x(i,2) - ydp(i) - (e(i+1)*ppfp(i+1))/ppf(i+1));
% % %     alphaTilde(i+1) = rho(i+1)*(yd2p(i)+(ep(i+1)*ppfp(i)+e(i+1)*ppf2p(i)-(ppfp(i)^2)*e(i+1))/ ppf(i)^2);
% %     
% %     S(i+1) = z1p(i+1) + beta*z1(i+1); %+ alpha*zI(i+1);
% 
%     u(i+1) = k1*z1(i+1) + k2*z1p(i+1) + k3*zI(i+1) + ((n*Jm + Jl)/rho(i+1))*(beta*z1p(i+1)-alpha*z1(i+1)) ; % PID;% % 
%     
% %     ((n*Jm + Jl)/rho(i+1))*(beta*z1p(i+1)-alpha*z1(i+1))
%     [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% end
% 
% 
% 
% 
% 
% 
% figure(3)
% plot(t,u(:))
% legend('control');
% figure(2)
% plot(t,x(:,1))
% hold on
% plot(t,yd(:))
% legend('Estado','trayectoria deseada');
% 
% % figure(1)
% % plot(t,eT(:))
% % legend('Error transformado');
% 
% 
% % PPF
% figure(4)
% plot(t, ppf(:))
% hold on
% plot(t, -ppf(:))
% hold on 
% plot(t, e(:))
% ylim([-20 15])
% legend('ppf','ppfp','error');
% 
