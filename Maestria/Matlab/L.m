clear all;
clc;
q = [1 0;0 1];
I = eye(2);
A = [2 0;0 -2];

Kr = Kronecker(I,A)+Kronecker(A,I);
Kri = inv(Kr);
P = Kri*vectorizar(-q);
Mp = Matrizacion(P);
Eq = eig(q)
EA = eig(A)
EMp = eig(Mp)