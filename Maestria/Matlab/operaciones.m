%Parametros
clear all;
clc;
b = 0.1;
m=0.23;
M=0.57;
l=0.641;
g=9.81;
I=(1/2)*m*l^2;
br=.1; %rotacional
bt=5; %fricion del carro
syms L

A1 = [0 1 0 0];
A2 = [0 ((-b*(m*l^2+I))/((M+m)*I+M*m*l^2)) ((-(m^2)*g*l^2)/((M+m)*I+M*m*l^2)) 0];
A3 = [0 0 0 1];
A4 = [0 ((b*m*l)/((M+m)*I+M*m*l^2)) ((m*g*l*(M+m))/((M+m)*I+M*m*l^2)) 0];
A  = [A1;A2;A3;A4]

ValoresP1 = eig(A)
mI=eye(4);
valoresP2 = det(L*mI-A)

