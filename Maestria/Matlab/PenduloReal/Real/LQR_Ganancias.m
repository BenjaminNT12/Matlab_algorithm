clc;
h=0.001; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ganancias (En base al manual)
M=0.57;
m=0.23;
l=0.641;
g=9.81;
I=0.0260;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ganancias del sistema BPR
% M=0.52 
% m=0.23
% l=0.32
% g=9.81
%Ganancias usadas en controladores difusos de segundo semestre
% M=0.455;
% m=0.210;
% l=0.61;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modelo lineal del carro-péndulo
%%%Verificar controlabilidad 
A=[0,1,0,0; ((m+M)/(M*l))*g,0,0,0;0,0,0,1;-(m/M)*g,0,0,0]
B=[0;-1/(M*l);0;1/M]
% R=0.5;
% Q=[35 0 0 0;0 20 0 0;0 0 20 0;0 0 0 20];  
% [K,S,V]=lqr(A,B,Q,R)
% k1=K(1);
% k2=K(2);
% k3=K(3);
% k4=K(4);
h=0.001;

% plot(Theta.time,Theta.signals.values) 