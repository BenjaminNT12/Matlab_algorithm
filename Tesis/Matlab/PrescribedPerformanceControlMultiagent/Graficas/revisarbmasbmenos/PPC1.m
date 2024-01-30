clc
clear all
close all

t = [0:0.01:10];
dij = 3.6;
p0 = 1;
pinf = 0.06;
pij = (p0 - pinf)*exp(-0.7*t) + pinf;
bmas = 18.4;
bmenos = 10.4;
%error
eij = 1.1*sin(10*t).*cos(3*t).*exp(-t);
%error en eta
etaij = eij.*(eij + 2*dij); %error normal
etaijmenos = bmenos*pij; % cotas de error superior 
etaijmas = bmas*pij; % cotas de error inferior


emas = -dij + ( dij^2 + etaijmas ).^(1/2); % error superior
emenos = dij - ( dij^2 - etaijmenos ).^(1/2) % error inferior

figure(1)
plot(t,etaij,t,-etaijmenos,t,etaijmas)
title('Eta')

figure(2)
plot(t,eij,t,emas,t,-emenos)
title('Error original')
% figure(1)
% plot(t,eij,t,etaij)
% legend('error','eta')
% hold on
% plot(t,-bmenos*pij,t,bmas*pij)
% figure(2)
% plot(t,pij)