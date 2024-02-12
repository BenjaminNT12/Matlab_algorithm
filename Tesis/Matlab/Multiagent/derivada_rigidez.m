% calculo de la matriz de Rigidez

clc
close all
clear

syms p1 p2 p3 p4 p5 p6 p7 p8 p9;

P = [p1 p2 p3 p4 p5 p6 p7 p8 p9];

% "EDGE" DE LA FORMACION (UNIONES)
% E1   = [1 2];
% E2   = [1 3];
% E3   = [1 4];
% E4   = [2 3];
% E5   = [2 4];
% E6   = [3 4];


E1   = [1 4]; E2   = [1 5]; E3   = [1 9];
E4   = [2 3]; E5   = [2 6]; E6   = [2 9];
E7   = [3 4]; E8   = [3 7]; E9   = [3 9];
E10  = [4 5]; E11  = [4 8]; E12  = [4 9];
E13  = [5 6]; E14  = [5 8]; E15  = [5 9];
E16  = [6 7]; E17  = [6 8]; E18  = [6 9];
E19  = [7 8]; E20  = [7 9]; E21  = [8 9];
 
E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10; E11; E12; E13; E14; E15; E16; E17; E18; E19; E20; E21];

for i = 1: length(E(:,1))
   Phi(1,i) =  norm(P(E(i,1))-P(E(i,2)))^2;
end

R = (1/2)*jacobian(Phi,P)

%% Calculo del rango de la matriz
rango = rank(R)



























% 
% % calculo de la matriz de Rigidez
% 
% clc
% close all
% clear
% 
% syms p1 p2 p3 p4 p5 p6
% 
% P = [p1 p2 p3 p4 p5 p6]
% 
% % "EDGE" DE LA FORMACION (UNIONES)
% E1 = [1 2];
% E2 = [1 6];
% E3 = [2 3];
% E4 = [2 6];
% E5 = [3 4];
% E6 = [3 6];
% E7 = [4 5];
% E8 = [4 6];
% E9 = [5 6];
%  
% E = [E1; E2; E3; E4; E5; E6; E7; E8; E9];
% 
% Phi = [norm(P(1)-P(2))^2, norm(P(1)-P(6))^2, norm(P(2)-P(3))^2, norm(P(2)-P(6))^2, norm(P(3)-P(4))^2, norm(P(3)-P(6))^2, norm(P(4)-P(5))^2, norm(P(4)-P(6))^2, norm(P(5)-P(6))^2]
% % 
% R = (1/2)*jacobian(Phi,P)
% 
% % 
% % P = [p1 p2 p3 p4 p5]
% % 
% % Phi = [norm(P(1)-P(2))^2, norm(P(1)-P(3))^2, norm(P(1)-P(4))^2, norm(P(1)-P(5))^2, norm(P(2)-P(3))^2, norm(P(3)-P(4))^2, norm(P(4)-P(5))^2]
% % 
% % R = (1/2)*jacobian(Phi,P)