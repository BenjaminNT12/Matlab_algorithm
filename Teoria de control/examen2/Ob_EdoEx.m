%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ejemplo de Asignaci'on de Polos con Observaci'on de Estado
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear
clc
syms s 
%
Id = eye(3);
vcero = zeros(3,1);
%
%------------------------
% Representaci'on de Estado
%------------------------
%
a1=0;
a2=1;
a3=0;
b1=-1;
b2=0;
b3=1;

A = [-a1 1 0;-a2 0 1;-a3 0 0]
b = [0;0;1]
beta=inv([1 0 0;a1 1 0;a2 a1 1])*[b1; b2; b3];
c=[beta(3); beta(2); beta(1)];
x0 = [-1; 0; 0]
%
%------------------------
% Polos -> valores propios de A 
%       -> raices polinomio caracter'istico
%------------------------
%
pc = det(s*Id-A)
%
%------------------------
% Ceros -> raices del determinante de la Matriz Sistema
%------------------------
%
MS = [(s*Id-A) b; -c.' 0]
pMS = det(MS)
%
%------------------------
% Matriz de controlabilildad
%------------------------
%
MC = [b A*b A^2*b]
dMC = det(MC)
%
%------------------------
% Matriz de observabilildad
%------------------------
%
MO = [c.'; c.'*A; c.'*A^2]
dMO = det(MO)
%
%------------------------
% C'alculo de la retroalimentaci'on de estado
%------------------------
%
[A b]
%
collect((s+1)^3,s)
%
% Retroalimentaci'n de estado
%
f = [2; -2; -3]
%
Af = A + b*f.'
factor(det(s*Id-Af))
poly(Af)
eig(Af)
%
%------------------------
% C'alculo de la inyecci'on de salida
%------------------------
%
[A; c.']
%
% Transformaci'on a la forma observador
%
Ao = [0,0,0;1,0,-1;0,1,0]
bo = [1;0;-1]
co = [0;0;1]
[Ao; co.']
%
factor(co.'*inv(s*Id-Ao)*bo)
MOo = [co.'; co.'*Ao; co.'*Ao^2]
%
% Matriz de cambio de base
%
T1 = inv(MO)*MOo
inv(T1)*A*T1 - Ao
inv(T1)*b - bo
c.'*T1 - co.'
%
[Ao; co.']
%
collect((s+5)^3,s)
%collect((s+5)^3,s)
%collect((s+2)^3,s)
%
ko = [-125; -74; -15]
%ko = [-125; -75; -15]
%ko = [-8; -12; -6]
%
Ako = Ao + ko*co.'
factor(det(s*Id-Ako))
%
% Inyecci'on de salida
%
k = T1*ko
%
Ak = A + k*c.'
factor(det(s*Id-Ak))
%
%------------------------
% Sistema en Lazo cerrado
%------------------------
%
Alc = [  A      b*f.'  ;
       -k*c.' (Af+k*c.')]
blc = [b; b]
clc = [c; vcero]
%
%------------------------
% Polos -> valores propios de Alc 
%       -> raices polinomio caracter'istico
%------------------------
%
I6 = eye(6);
pclc = det(s*I6-Alc)
factor(pclc)
%
%------------------------
% Ceros -> raices del determinante de la Matriz Sistema
%------------------------
%
MSlc = [(s*I6-Alc) blc; -clc.' 0]
pMSlc = det(MSlc)
factor(pMSlc)
%
%------------------------
% Matriz de controlabilildad
%------------------------
%
MClc = [blc Alc*blc Alc^2*blc Alc^3*blc Alc^4*blc Alc^5*blc]
dMClc = det(MClc)
rkMOlc = rank(MClc)
factor(pclc)
factor(pMSlc)
%
%------------------------
% Matriz de observabilildad
%------------------------
%
MOlc = [clc.'; 
        clc.'*Alc; 
        clc.'*Alc^2; 
        clc.'*Alc^3; 
        clc.'*Alc^4; 
        clc.'*Alc^5]
dMOlc = det(MOlc)
rkMOlc = rank(MOlc)
factor(pclc)
factor(pMSlc)
%
%
%------------------------
% Forma de Jordan del Sistema en Lazo cerrado
%------------------------
%
[T2, Jlc] = jordan(Alc)
inv(T2)*Alc*T2 - Jlc
bJlc = inv(T2)*blc
cJlc = T2.'*clc
MSlc =[(s*I6-Jlc) bJlc;
           -cJlc.'  0]
vpa(MSlc,2)
round(MSlc)