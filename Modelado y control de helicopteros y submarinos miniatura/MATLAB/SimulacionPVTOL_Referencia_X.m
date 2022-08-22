clc
clear all
close all

fq = 0; % entrada de control para altura Z
tauT = 0; % entrada de control para theta
T = 0.01;

t= [0:T:20];
m = 1;
g =9.81;
Iyy = 0.1

%zd = 1+0.5*cos(t); % referencia a donde queremos la altura Z
%zdp = -0.5*sin(t);
%zd2p = -0.5*cos(t);

zd = 1+0.5*cos(t); % referencia a donde queremos la altura Z
zdp = -0.5*sin(t);
zd2p = -0.5*cos(t);

k1z = 2; % ganancias del control en z 
k2z = 2; % ganancias del control en z

%td = 0; % referencias a donde queremos la posicion theta
td = 0; % referencia a donde queremos la altura Z
tdp = 0; % referencia a donde queremos la altura Z
td2p = 0; % referencia a donde queremos la altura Z

k1t = 10; % ganancias del control en theta 
k2t = 150; % ganancias del control en theta


xd = 5+1.2*sin(t);
xdp = 1.2*cos(t);
xd2p = -1.2*sin(t);

k1x = 4;
k2x = 1;

x = [0 0 0.2 0 0 0]; % condiciones iniciales
% x1 = x
% x2 = z
% x3 = \theta
% x4 = x punto
% x5 = z punto 
% x6 = \theta punto 

%1.- Medir las variables a controlar
for i=1:length(t)-1
    [tt,xx] = ode45(@modeloPVTOL2,[t(i) t(i+1)],x(i,:),[],fq(i),tauT(i));
    x(i+1,:) = xx(end,:);    
%2.- Calcular la ley de control    
    ez = x(i+1,2) - zd(i+1);
    ezp = x(i+1,5) - zdp(i+1); % esto porque la derivada de zd que es fija su derivada es cero
    fq(i+1) = m/cos(x(i+1,3)) * (zd2p(i+1) -k1z*ezp - k2z*ez + g);
    
    ex = x(i+1,1) - xd(i+1);
    exp = x(i+1,4) - xdp(i+1);
    
    ux(i+1) = m*(xd2p(i+1)-k1x*exp-k2x*ex);
    %if(ux(i+1) > 1)
    %    ux(i+1) = 1;
    %end
    %if(ux(i+1) < -1)
    %    ux(i+1) = -1;
    %end
    
    
    %td(i+1) = asin(ux(i+1)/fq(i+1));
    td(i+1) = ux(i+1)/fq(i+1);
    tdp(i+1) = 0;%1/sqrt(1-(ux(i+1)/fq(i+1))^2);
    td2p(i+1) = 0;%(ux(i+1)/fq(i+1))/(1-(ux(i+1)/fq(i+1))^2)^(3/2);
    
    et = x(i+1,3) - td(i+1);
    etp = x(i+1,6) - tdp(i+1); % esto porque la derivada de zd que es fija su derivada es cero
    tauT(i+1) = Iyy*(td2p(i+1)-k1t*etp - k2t*et);
end
%1.47.04



figure(1)
subplot(511)
plot(t,x(:,2),t,zd)
legend('Z','zd')
subplot(512)
plot(t,x(:,1),t,xd)
legend('X','xd')
%plot(t,x(:,1))
%legend('X')
subplot(513)
plot(t,x(:,3),t,td)
legend('\theta','\theta_d')
subplot(514)
plot(t,fq)
legend('fq')
subplot(515)
plot(t,ux)
legend('ux')
