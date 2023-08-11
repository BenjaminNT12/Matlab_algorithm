clc
clear
close all

x = [0.1 0];
T = 0.01;
N =  100
t = 0 : T : 10;

xinf = 1.314;
gama = 1.5;
deltaInferiorInf = 1;
deltaSuperiorInf = 1;

beta = 1.75;
alpha = 2;

Jm = 0.026;
Jl = 0.0113;
Bm = 1.3;
Bl = 1.3;
k = 560;
c = 0.15;
a = 0.2;
n = 11.5;
v = 0.05;

k1 = 5.51;
k2 = 12.1;
% k3 = 0.2;

yd = 5*sin(2*pi*t);
ydp = 10*pi*cos(2*pi*t);

ppf  = coth(gama*t + v) - 1 + xinf;
ppfp = -gama*csch(gama*t + v).^2;

eI(1) = 0;
zI(1) = 0; 
for i = 1: length(t)-1
    ITERACION = i
    e(i+1) = yd(i) - x(i,1);
    ep(i+1) = ydp(i) - x(i,2);
    eI(i+1) = eI(i) + e(i+1)*T;
    
    %Transformacion del error
    phi(i+1) = e(i+1)/ppf(i);
    rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
    z1p(i+1) = rho(i+1)*(ep(i+1) - ( e(i+1)*ppfp(i) )/ppf(i) );
    z1(i+1) = (1/2)*log( (phi(i+1) + deltaInferiorInf) / (deltaSuperiorInf - phi(i+1)));
    zI(i+1) = zI(i) + z1(i+1)*T;
    % Superficie de deslizamiento    
    S(i+1) = z1p(i+1) + beta*z1(i+1)+ alpha*zI(i+1);
    % ley de Control
    u(i+1)    = -( (n*Jm + Jl)/rho(i+1) )* ( beta*z1p(i+1) + k2*S(i+1) +  k1*sign(S(i+1)) + alpha*zI(i+1));

    [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));

    x(i+1, 1) = (xx(end, 1));
    x(i+1, 2) = (xx(end, 2));
end




% PPF
figure(1)
plot(t, ppf(:))
hold on
plot(t, -ppf(:))
hold on 
plot(t, e(:))
ylim([-20 15])

figure(2)
plot(t,u(:))

figure(3)
plot(t,x(:,1))
hold on
plot(t,yd(:))





















% clc
% clear
% close all
% 
% x = [0.1 0];
% T = 0.01;
% N =  100
% t = 0 : T : 10;
% 
% x0 = 0.15;
% xinf = 0.8;
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
% v = 0.05;
% beta = 1.75;
% alpha = 2;
% 
% k1 = 16.51;
% k2 = 45.1;
% k3 = 0.2;
% 
% yd = 5*sin(2*pi*t);
% ydp = 10*pi*cos(2*pi*t);
% yd2p = -20*pi*sin(2*pi*t);
% 
% ppf  = coth(gama*t + v) - 1 + xinf;
% ppfp = -gama*csch(gama*t + v).^2;
% ppf2p = -2*gama^2*(csch(gama*t + v).^2).*coth(gama*t + v);
% eI(1) = 0;
% 
% for i = 1: length(t)-1
%     ITERACION = i
%     e(i+1) = yd(i) - x(i,1);
%     ep(i+1) = ydp(i) - x(i,2);
% 
%     % INTEGRAL qP = u --->> q
%     
%     eI(i+1) = eI(i) + e(i+1)*T;
%     
% 
%     phi(i+1) = e(i+1)/ppf(i);
%     rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
%     z1p(i+1) = rho(i+1)*(ep(i+1) - ( e(i+1)*ppfp(i) )/ppf(i) );
%     u(i+1) = k1*e(i+1) + k2*ep(i+1) + k3*eI(i+1); % PD 
%    
%     [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% end
% 
% 
% 
% 
% % PPF
% figure(1)
% plot(t, ppf(:))
% hold on
% % % plot(t, eT(1,:))
% % % hold on 
% plot(t, -ppf(:))
% hold on 
% plot(t, e(:))
% ylim([-20 15])
% 
% figure(2)
% plot(t,u(:))
% % figure(3)
% % plot(t,ARGUMENTO(:))
% % figure(4)
% % plot(t,z1(:))
% figure(3)
% plot(t,x(:,1))
% hold on
% plot(t,yd(:))
% 














% clc
% clear
% close all
% 
% x = [0.1 0];
% T = 0.01;
% N =  100
% t = 0 : T : 10;
% 
% x0 = 0.15;
% xinf = 3.03;
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
% v = 0.05;
% beta = 1.75;
% alpha = 2;
% 
% k1 = 180.2;
% k2 = 50.6;
% 
% yd = 5*sin(2*pi*t);
% ydp = 10*pi*cos(2*pi*t);
% yd2p = -20*pi*sin(2*pi*t);
% 
% ppf  = coth(gama*t + v) - 1 + xinf;
% ppfp = -gama*csch(gama*t + v).^2;
% ppf2p = -2*gama^2*(csch(gama*t + v).^2).*coth(gama*t + v);
% 
% %e    = zeros(1,length(t));
% %ydp  = zeros(1,length(t));
% %ep   = zeros(1,length(t));
% %ppf  = zeros(1,length(t));
% %ppfp = zeros(1,length(t));
% %phi  = zeros(1,length(t));
% %rho  = zeros(1,length(t));
% %z1   = zeros(1,length(t));
% %z1p  = zeros(1,length(t));
% %zI   = zeros(1,length(t));
% %S    = zeros(1,length(t));
% %u    = zeros(1,length(t));
% 
% 
% for i = 1: length(t)-1
%     ITERACION = i
%     e(i+1) =   yd(i) - x(i,1);
%     
%     ep(i+1) =  ydp(i) - x(i,2);
% 
%     phi(i+1) = e(i+1)/ppf(i);
%     ARGUMENTO(i+1) = (phi(i+1) + deltaInferiorInf) / (deltaSuperiorInf - phi(i+1));
%     z1(i+1) = (1/2)*log( ARGUMENTO(i+1));
% 
% %     Sz1(i+1) = (deltaSuperiorInf*exp(z1(i+1)) - deltaInferiorInf*exp(-z1(i+1)))/(exp(z1(i+1)) + exp(-z1(i+1)));
% % 
% %     eT(i+1) = ppf(i)*Sz1(i+1);
% % 
% %     eTp(i+1) = (eT(i+1) - eT(i))/T;
%     
% 
%     phip(i+1) = (ep(i+1)*ppf(i)-e(i+1)*ppfp(i))/ppf(i)^2;
% 
%     rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
%     
%     z1p(i+1) = rho(i+1)*( x(i,2) - ydp(i) - ( e(i+1)*ppfp(i) )/ppf(i) );
% 
% 
%     mu(i+1) = (-2*ppfp(i))/(2*ppf(i));
%     eta(i+1) = 1/(2*ppf(i));
%     rhop(i+1) = mu(i+1)*(1/(deltaSuperiorInf-phi(i+1))) + eta(i+1)*(-phip(i+1)/(deltaInferiorInf - phi(i+1))) - mu(i+1)*(1/(phi(i+1) - deltaInferiorInf)) + eta(i+1)*(phip(i+1)/(phi(i+1)-deltaInferiorInf)^2);
% 
%     betaTilde(i+1) = rhop(i+1)  *(x(i,2) - ydp(i) - (e(i+1)*ppfp(i+1))/ppf(i+1));
%     alphaTilde(i+1) = rho(i+1)*(yd2p(i)+(ep(i+1)*ppfp(i)+e(i+1)*ppf2p(i)-(ppfp(i)^2)*e(i+1))/ ppf(i)^2);
%     
%     S(i+1) = z1p(i+1) + beta*z1(i+1); %+ alpha*zI(i+1);
% 
%     v1(i+1) = k1*sign(S(i+1)) + k2*S(i+1);
% %     u(i+1) = ( (n*Jm + Jl)/rho(i+1) )*(-betaTilde(i+1) + alphaTilde(i+1) - beta*z1p(i+1) - alpha*z1(i+1) + v1(i+1));
%     u(i+1) = k1*e(i+1) + k2*ep(i+1); % PD 
%     %zI(i+1)   = real(zI(i) + z1(i)*T);
%     
% %     u(i+1)    = -( (n*Jm + Jl)/rho(i+1) )* ( beta*z1p(i+1)+ k2*S(i+1) +  k1*sign(S(i+1)) );
% 
%     [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% 
% 
% %     argumentoLn(i+1) = (phi(i+1) + deltaSuperiorInf) / (deltaSuperiorInf - phi(i+1))
% %     error = x(i,1) - yd(i)
% %     x1 = x(i,1)
% %     yDeseada = yd(i)
% %     figure(1)
% %     plot(e)
% %     figure(2)
% %     plot(x1)
% %     hold on
% %     plot(yd)
% %     hold on
% end
% 
% 
% 
% 
% % PPF
% figure(1)
% % plot(t, ppf(:))
% % hold on
% % % plot(t, eT(1,:))
% % % hold on 
% % plot(t, ppfp(:))
% % hold on 
% plot(t, e(:))
% % ylim([-20 15])
% 
% figure(2)
% plot(t,u(:))
% figure(3)
% plot(t,ARGUMENTO(:))
% figure(4)
% plot(t,z1(:))
% figure(5)
% plot(t,x(:,1))
% hold on
% plot(t,yd(:))


















% clc
% clear
% close all
% 
% x = [0.1 0];
% T = 0.01;
% N =  100
% t = 0 : T : 10;
% 
% k1 = 380.2;
% k2 = 30.6;
% k3 = 93.4;
% yd = 5*sin(2*pi*t);
% ydp = 10*pi*cos(2*pi*t);
% eI(1) = 0;
% 
% for i = 1: length(t)-1
%     ITERACION = i
%     e(i+1) =   yd(i) - x(i,1);
%     
%     ep(i+1) =  ydp(i) - x(i,2);
%     eI(i+1) = eI(i) + e(i+1)*T;
%     u(i+1) = k1*e(i+1) + k2*ep(i+1) + k3*eI(i+1); % PD 
%     z1p(i+1) = 1;
%     [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% end
% 
% 
% 
% 
% % PPF
% figure(1)
% plot(t, e(:))
% ylim([-20 15])
% figure(2)
% plot(t,u(:))
% figure(3)
% plot(t,x(:,1))
% hold on
% plot(t,yd(:))






















% clc
% clear
% close all
% 
% x = [0.1 0];
% T = 0.01;
% N =  100
% t = 0 : T : 10;
% 
% xinf = 0.8;
% gama = 1.5;
% deltaInferiorInf = 1;
% deltaSuperiorInf = 1;
% 
% beta = 1.75;
% alpha = 2;
% 
% Jm = 0.026;
% Jl = 0.0113;
% Bm = 1.3;
% Bl = 1.3;
% k = 560;
% c = 0.15;
% a = 0.2;
% n = 11.5;
% v = 0.05;
% 
% k1 = 35.51;
% k2 = 2.1;
% k3 = 0.2;
% 
% yd = 5*sin(2*pi*t);
% ydp = 10*pi*cos(2*pi*t);
% 
% 
% ppf  = coth(gama*t + v) - 1 + xinf;
% ppfp = -gama*csch(gama*t + v).^2;
% 
% eI(1) = 0;
% 
% for i = 1: length(t)-1
%     ITERACION = i
%     e(i+1) = yd(i) - x(i,1);
%     ep(i+1) = ydp(i) - x(i,2);
%     eI(i+1) = eI(i) + e(i+1)*T;
%     
%     %Transformacion del error
%     phi(i+1) = e(i+1)/ppf(i);
%     rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
%     z1p(i+1) = rho(i+1)*(ep(i+1) - ( e(i+1)*ppfp(i) )/ppf(i) );
% 
%     % Superficie de deslizamiento
% 
%     %     Sz1(i+1) = (deltaSuperiorInf*exp(z1(i+1)) - deltaInferiorInf*exp(-z1(i+1)))/(exp(z1(i+1)) + exp(-z1(i+1)));
% % 
% %     eT(i+1) = ppf(i)*Sz1(i+1);
% % 
% %     eTp(i+1) = (eT(i+1) - eT(i))/T;
%     
%     
%     z1(i+1) = (1/2)*log( (phi(i+1) + deltaInferiorInf) / (deltaSuperiorInf - phi(i+1)));
% 
% %     phip(i+1) = (ep(i+1)*ppf(i)-e(i+1)*ppfp(i))/ppf(i)^2;
% 
% %     rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
%     
% %     z1p(i+1) = rho(i+1)*( x(i,2) - ydp(i) - ( e(i+1)*ppfp(i) )/ppf(i) );
% 
% 
% %     mu(i+1) = (-2*ppfp(i))/(2*ppf(i));
% %     eta(i+1) = 1/(2*ppf(i));
% %     rhop(i+1) = mu(i+1)*(1/(deltaSuperiorInf-phi(i+1))) + eta(i+1)*(-phip(i+1)/(deltaInferiorInf - phi(i+1))) - mu(i+1)*(1/(phi(i+1) - deltaInferiorInf)) + eta(i+1)*(phip(i+1)/(phi(i+1)-deltaInferiorInf)^2);
% 
% %     betaTilde(i+1) = rhop(i+1)  *(x(i,2) - ydp(i) - (e(i+1)*ppfp(i+1))/ppf(i+1));
% %     alphaTilde(i+1) = rho(i+1)*(yd2p(i)+(ep(i+1)*ppfp(i)+e(i+1)*ppf2p(i)-(ppfp(i)^2)*e(i+1))/ ppf(i)^2);
%     
%     S(i+1) = z1p(i+1) + beta*z1(i+1); %+ alpha*zI(i+1);
% 
% %     v1(i+1) = k1*sign(S(i+1)) + k2*S(i+1);
% %     u(i+1) = ( (n*Jm + Jl)/rho(i+1) )*(-betaTilde(i+1) + alphaTilde(i+1) - beta*z1p(i+1) - alpha*z1(i+1) + v1(i+1));
% %     u(i+1) = k1*e(i+1) + k2*ep(i+1); % PD 
%     %zI(i+1)   = real(zI(i) + z1(i)*T);
%     
%     u(i+1)    = -( (n*Jm + Jl)/rho(i+1) )* ( beta*z1p(i+1) + k2*S(i+1) +  k1*sign(S(i+1)) );
% 
% 
% 
% %     u(i+1) = k1*e(i+1) + k2*ep(i+1) + k3*eI(i+1); % PD 
%    
%     
%     
%     
%     
%     
%     
%     
%     
%     [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1), z1p(i+1));
% 
%     x(i+1, 1) = (xx(end, 1));
%     x(i+1, 2) = (xx(end, 2));
% end
% 
% 
% 
% 
% % PPF
% figure(1)
% plot(t, ppf(:))
% hold on
% plot(t, -ppf(:))
% hold on 
% plot(t, e(:))
% ylim([-20 15])
% 
% figure(2)
% plot(t,u(:))
% 
% figure(3)
% plot(t,x(:,1))
% hold on
% plot(t,yd(:))
% 
% 
