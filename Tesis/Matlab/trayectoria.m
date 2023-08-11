close all;
clear all;
clc;


ti = 0;
tf = 60;
Ts = 0.01;
t = ti:Ts:tf;

% x-y deseadas
t1 = t(1:2000);
t2 = t(1:2001);

% coordenadas x
[xd1,xdp1,xdpp1] = trayectoria_cuadrada(t1,0,-10);

xd(1:2000) = xd1;       xdp(1:2000) = xdp1;     xdpp(1:2000) = xdpp1;    
xd(2001:4000) = -10;    xdp(2001:4000) = 0;     xdpp(2001:4000) = 0;

[xd3,xdp3,xdpp3] = trayectoria_cuadrada(t1,-10,10);

xd(4001:6000) = xd3;    xdp(4001:6000) = xdp3;  xdpp(4001:6000) = xdpp3;
xd(6001:8001) = 0;      xdp(6001:8001) = 0;     xdpp(6001:8001) = 0;

% coordenadas y
yd(1:2000) = 0;         ydp(1:2000) = 0;        ydpp(1:2000) = 0;

[yd2,ydp2,ydpp2] = trayectoria_cuadrada(t1,0,10);

yd(2001:4000) = yd2;    ydp(2001:4000) = ydp2;  ydpp(2001:4000) = ydpp2;  
yd(4001:6000) = 10;     ydp(4001:6000) = 0;     ydpp(4001:6000) = 0;

[yd4,ydp4,ydpp4] = trayectoria_cuadrada(t2,10,-10);

yd(6001:8001) = yd4;    ydp(6001:8001) = ydp4;  ydpp(6001:8001) = ydpp4;

%Grafica de la trayectoria cuadrada
plot(xd, yd), grid on		
xlabel('x [m]')
ylabel('y [m]')
xlim([-12, 2]);
ylim([-2, 12]);

function [xd,xdp,xdpp] = trayectoria_cuadrada(t,Pi,pf)
    
    tf = t(end);    % tiempo final
    Ts = t(2)-t(1); % periodo de muestreo
    xd(1) = Pi;     % condicion inicial   
    
    for i=1:length(t)-1
        xd(i+1)   = Pi + pf*( 10*(t(i+1)/tf)^3 - 15*(t(i+1)/tf)^4 + 6*(t(i+1)/tf)^5 );
        xdp(i+1)  =  0 + pf*( 30*(t(i+1)^2/tf^3) - 60*(t(i+1)^3/tf^4) + 30*(t(i+1)^4/tf^5) );
        xdpp(i+1) = (xdp(i+1) - xdp(i))/Ts;
    end

    xd = xd';
    xdp = xdp';
    xdpp = xdpp'; 
end