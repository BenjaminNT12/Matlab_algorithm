% calculo de la matriz de Rigidez

clc
close all
clear

syms p1 p2 p3 p4 p5 p6 p7 p8 p9;

P = [p1 p2 p3 p4 p5];

% "EDGE" DE LA FORMACION (UNIONES)
E1 = [1 2];
E2 = [2 3];
E3 = [3 4];
E4 = [4 5];
E5 = [5 1];
E6 = [1 3];
E7 = [1 4];
E8 = [2 4];
E9 = [2 5];
E10 = [3 5];


E = [E1; E2; E3; E4; E5; E6; E7; E8; E9; E10];

for i = 1: length(E(:,1))
   Phi(1,i) =  norm(P(E(i,1))-P(E(i,2)))^2;
end

R = (1/2)*jacobian(Phi,P)
rank(R)
rref(R)





