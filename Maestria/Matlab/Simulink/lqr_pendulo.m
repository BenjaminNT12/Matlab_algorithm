clc; 
% clear all; close all;
%INVERTER PENDULUM SYSTEM
%CONSTANTES

%masa del carro
M=0.455;%Kg 
%M=0.3;
%masa del pendulo
m=0.210;%Kg
% m=0.18;
%longitud del pendulo
l=0.61;%m
% l=0.3;
%constante de gravedad
g=9.81;
%fuerza aplicada al carro
f=0;

a=(m+M);
b=m*(l^2);
gam=m*l;
del=-m*g*l;


%%%Verificar controlabilidad 
A=[0,1,0,0; ((m+M)/(M*l))*g,0,0,0;0,0,0,1;-(m/M)*g,0,0,0];
B=[0;-1/(M*l);0;1/M];
R=0.5;
Q=[35 0 0 0;0 20 0 0;0 0 20 0;0 0 0 20];
% lqr(A,B,Q,R)

[K,S,V]=lqr(A,B,Q,R)
h=0.001;