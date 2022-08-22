clc
clear all
close all

datos1 = csvread('datos11.csv');

T = 0.05;
tau = 1;
x = datos1(:,1);
Fs = 500;
xref = datos1(:,2);
t = [0:0.05:119.85];

filter1.gain = 0.00034604133763910326;
filter1.numerator 	= [1, 2, 1] * filter1.gain;
filter1.denominator = [1, -1.946698, 0.948082];

xFilt = filter(filter1.numerator, filter1.denominator, x);

firf = [filter1.numerator, filter1.denominator]
grpdelay(firf,length(datos1(:,1)))
delay = mean(grpdelay(firf))


tt = t(1:end-delay);
sn = x(1:end-delay);

sf = xFilt;
sf(1:delay) = [];

figure(1)
plot(tt,sn,tt,sf(1:end-1),t,xFilt)
title 'Electrocardiogram'
xlabel('Time (s)')
legend('Original Signal','Filtered Shifted Signal','Filtro Original')
grid


% plot(t, xFilt(:,1), t, x, 'LineWidth',1.7)
% legend('filtro Micromodeler', 'Real');































% clc
% clear all
% close all
% 
% datos1 = csvread('datos11.csv');
% 
% Xtemp1 = 0;
% Xtemp2 = 0;
% Xtemp3 = 0;
% 
% Ytemp1 = 0;
% Ytemp2 = 0;
% Ytemp3 = 0;
% 
% T = 0.05;
% tau = 1;
% x = datos1(:,1);
% Fs = 500;
% xref = datos1(:,2);
% t = [0:0.05:119.85];
% 
% % tn = (0:length(datos1(:,1))-1)/Fs;
% 
% filter1.gain = 0.00034604133763910326;
% filter1.numerator 	= [1, 2, 1] * filter1.gain;
% filter1.denominator = [1, -1.946698, 0.948082];
% 
% xFilt = filter(filter1.numerator, filter1.denominator, x);
% 
% xf(1) = x(1);
% 
% for i=1:length(t)-1
%     xf(i+1) = xf(i) + (T/tau)*(x(i) - xf(i));
% end
% 
% for i=1:length(t)-1
%     xf2(i+1) = (0.08727*x(i) + 0.2618*Xtemp1 + 0.2618*Xtemp2 + 0.08727*Xtemp3 +  0.06968*Ytemp1 - 0.4612*Ytemp2 + 0.6934*Ytemp3);
%     Xtemp3 = Xtemp2;    
%     Xtemp2 = Xtemp1;
%     Xtemp1 = x(i)
%     
%     Ytemp3 = Ytemp2;
%     Ytemp2 = Ytemp1;
%     Ytemp1 = xf2(i+1)
% end
% 
% plot(t, xFilt(:,1), t, x, t, xf, t,xf2, 'LineWidth',1.7)
% legend('filtro Micromodeler', 'Real','Filtro Dr.', 'Filtro Matlab');
