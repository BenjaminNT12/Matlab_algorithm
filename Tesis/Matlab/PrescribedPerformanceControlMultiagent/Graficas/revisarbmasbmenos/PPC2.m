clc
clear
close all

t = [0:0.01:10];
dij = 3.6;
p0 = 1;
pinf = 0.06;
p = (p0 - pinf)*exp(-0.7*t) + pinf;
emaslim = 2;
emenoslim = 2;
%error
e = 1.1*sin(10*t).*cos(3*t).*exp(-t);
emas = emaslim*p;
emenos = emenoslim*p;
figure(1)
plot(t,e,t,emas,t,-emenos)
title('Error original')

eta = e.*(e + 2*dij); % error normal 
etamas = emas.*(emas + 2*dij); % 
etamenos =  -( -emenos.*(-emenos + 2*dij) ); % 
%etamenos =  -( -emenos.*(0 + 2*dij) );

figure(2)
plot(t,eta,t,etamas,t,-etamenos)
legend('eta','etamas','etamenos')
title('Eta')

bmas = (emas(1)^2 + 2*dij*emas(1))/p(1)
bmenos = (-emas(1)^2 + 2*dij*emas(1))/p(1)
% figure(3)
% plot(t,eij,t,etaij)
% legend('e','eta')
