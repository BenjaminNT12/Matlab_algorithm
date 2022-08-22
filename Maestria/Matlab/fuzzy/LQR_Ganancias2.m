clc;
h=0.001; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ganancias (En base al manual)
M=0.57;
m=0.23;
l=0.641;
g=9.81;
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
R=0.5;
Q=[35 0 0 0;0 20 0 0;0 0 20 0;0 0 0 20];   % Ganancias (En base al manual)   Bueno V1  PR+PD
% Q=[40 0 0 0;0 25 0 0;0 0 25 0;0 0 0 25]; % Ganancias (En base al Art. BPR) Optimo v1
%Q=[50 0 0 0;0 25 0 0;0 0 25 0;0 0 0 30]; % Ganancias (En base al Art. BPR) Optimo v2
% Q=[35 0 0 0;0 20 0 0;0 0 35 0;0 0 0 35]; % Ganancias (En base al al manual) Bueno V2  PR+PD
% Ganancias (En base al Art. BPR) Saturación Optimo 
% R=0.5;
% Q=[150 0 0 0;0 100 0 0;0 0 80 0;0 0 0 80]; 
% Q=[30 0 0 0;0 15 0 0;0 0 18 0;0 0 0 18]; 
[K,S,V]=lqr(A,B,Q,R)
k1=K(1);
k2=K(2);
k3=K(3);
k4=K(4);
h=0.001;

% plot(Theta.time,Theta.signals.values) 