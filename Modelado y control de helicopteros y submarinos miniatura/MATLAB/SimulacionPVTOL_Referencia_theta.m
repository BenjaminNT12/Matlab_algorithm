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

zd = 1+0.5*cos(t); % referencia a donde queremos la altura Z
zdp = -0.5*sin(t);
zd2p = -0.5*cos(t);

k1z = 2; % ganancias del control en z 
k2z = 2; % ganancias del control en z

%td = 0; % referencias a donde queremos la posicion theta
td = 0.5*sin(t); % referencia a donde queremos la altura Z
tdp = 0.5*cos(t); % referencia a donde queremos la altura Z
td2p = -0.5*sin(t); % referencia a donde queremos la altura Z

k1t = 2; % ganancias del control en theta 
k2t = 1; % ganancias del control en theta

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
    
    et = x(i+1,3) - td(i+1);
    etp = x(i+1,6) - tdp(i+1); % esto porque la derivada de zd que es fija su derivada es cero
    tauT(i+1) = Iyy*(td2p(i+1)-k1t*etp - k2t*et);
end
%1.47.04
figure(1)
subplot(411)
plot(t,x(:,2),t,zd)
legend('Z','zd')
subplot(412)
plot(t,x(:,1))
legend('X')
subplot(413)
plot(t,x(:,3),t,td)
legend('\theta','\theta_d')
subplot(414)
plot(t,fq)
legend('fq')
