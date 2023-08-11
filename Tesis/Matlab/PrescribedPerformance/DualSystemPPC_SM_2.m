clc
clear
close all

x = [0.1 0];
T = 0.01;
t = 0 : T : 1;

xinf = 3.2;
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
v = 0.001;
beta = 1.75;
alpha = 2;


k1 = 120;
k2 = 70;
k3 = 50;

yd = 5*sin(2*pi*t);
ydp = 10*pi*cos(2*pi*t);
yd2p = -20*pi*sin(2*pi*t);

ppf  = coth(gama*t + v) - 1 + xinf;
ppfp = -gama*csch(gama*t + v).^2;
ppf2p = -2*gama^2*(csch(gama*t + v).^2).*coth(gama*t + v);

eI(1) = 0;
eTI(1) = 0;
zI(1) = 0;

for i = 1: length(t)-1
    e(i+1) = yd(i) - x(i,1);
    ep(i+1) = ydp(i) - x(i,2);

    phi(i+1) = e(i+1)/ppf(i);
    rho(i+1) = (1/(2*ppf(i)))*((1/(phi(i+1) + deltaInferiorInf)) - (1/(phi(i+1) - deltaSuperiorInf))); % se puede obtener    
    z1p(i+1) = rho(i+1)*(ep(i+1) - ( e(i+1)*ppfp(i) )/ppf(i) );
    z1(i+1) = (1/2)*log( (phi(i+1) + deltaInferiorInf) / (deltaSuperiorInf - phi(i+1)));
    zI(i+1) = zI(i) + z1(i+1)*T;
    phip(i+1) = (ep(i+1)*ppf(i)-e(i+1)*ppfp(i))/ppf(i)^2;


    mu(i+1) = (-2*ppfp(i))/(2*ppf(i));
    eta(i+1) = 1/(2*ppf(i));
    rhop(i+1) = mu(i+1)*(1/(deltaSuperiorInf-phi(i+1))) + eta(i+1)*(-phip(i+1)/(deltaInferiorInf - phi(i+1))) - mu(i+1)*(1/(phi(i+1) - deltaInferiorInf)) + eta(i+1)*(phip(i+1)/(phi(i+1)-deltaInferiorInf)^2);
    betaTilde(i+1) = rhop(i+1)  *(x(i,2) - ydp(i) - (e(i+1)*ppfp(i+1))/ppf(i+1));
    alphaTilde(i+1) = rho(i+1)*(yd2p(i)+(ep(i+1)*ppfp(i)+e(i+1)*ppf2p(i)-(ppfp(i)^2)*e(i+1))/ ppf(i)^2);
    
    S(i+1) = z1p(i+1) + beta*z1(i+1) + alpha*zI(i+1);

    v1(i+1) = k1*sign(S(i+1)) + k2*S(i+1);
    u(i+1) = (( (n*Jm + Jl)/rho(i+1) )*(-betaTilde(i+1) + alphaTilde(i+1) - beta*z1p(i+1) - alpha*z1(i+1) + v1(i+1)))/S(i+1);
%     u(i+1) = -( (n*Jm + Jl)/rho(i+1) )* ( beta*z1p(i+1) + alpha*z1(i+1) + k2*S(i+1) +  k1*sign(S(i+1)) );
    
    [tt, xx] = ode45(@Dual_InertialSystemModel, [t(i) t(i+1)], x(i,:), [], u(i+1));

    x(i+1, 1) = (xx(end, 1));
    x(i+1, 2) = (xx(end, 2));
end

figure(1)
plot(t,x(:,1))
hold on
plot(t,yd(:))
legend('Estado','trayectoria deseada');
figure(2)
plot(t, ppf(:))
hold on
plot(t, -ppf(:))
hold on 
plot(t, e(:))
ylim([-20 15])
legend('ppf','ppfp','error');


