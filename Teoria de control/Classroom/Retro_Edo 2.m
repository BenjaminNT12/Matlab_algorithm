%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% C'alculo Simb'olico
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Formas can'onicas controlador y de controlabillidad
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear
clc
syms s a1 a2 a3 a4 b1 b2 b3 b4
%
Id = eye(4);
%
%------------------------
% Forma controlador
%------------------------
%
% Matrices de la representaci'on de estado
%
Ac = [ 0   1   0   0;
       0   0   1   0;
       0   0   0   1;
      -a4 -a3 -a2 -a1]
bc = [0; 0; 0; 1]
cc = [b4; b3; b2; b1]
%
%------------------------
% Polos -> valores propios de Ac 
%       -> raices polinomio caracter'istico
%------------------------
%
pcc = factor(det(s*Id-Ac))
ppcc = charpoly(Ac)
% 
%------------------------
% Ceros -> raices del determinante de 
%          la Matriz Sistema
%------------------------
%
MSc = [(s*Id-Ac) bc; -cc.' 0]
pMSc = factor(det(MSc))
% 
%------------------------
% Matriz de controlabilildad de 
% la forma controlador
%------------------------
%
MCc = simplify([bc Ac*bc Ac^2*bc Ac^3*bc])
dMCc = det(MCc)
rank(MCc)
%
%------------------------
% Forma controlabilidad
%------------------------
%
% Matrices de la representaci'on de estado
%
Aco = [-a1   1   0   0;
       -a2   0   1   0;
       -a3   0   0   1;
       -a4   0   0   0]
bco = [0; 0; 0; 1]
beta = simplify(inv([1  0  0  0; 
          a1 1  0  0; 
          a2 a1 1  0; 
          a3 a2 a1 1])*[b1; b2; b3; b4])
cco = [beta(4); beta(3); beta(2); beta(1)]
%
%------------------------
% Polos -> valores propios de Aco 
%       -> raices polinomio caracter'istico
%------------------------
%
pcco = det(s*Id-Aco)
ppcco = charpoly(Aco)
% 
%------------------------
% Ceros -> raices del determinante de 
% la Matriz Sistema
%------------------------
%
MSco = [(s*Id-Aco) bco; -cco.' 0]
pMSco = det(MSco)
% 
%------------------------
% Matriz de controlabilildad de 
% la forma controlabilildad
%------------------------
%
MCco = [bco Aco*bco Aco^2*bco Aco^3*bco]
dMCco = det(MCco)
rank(MCco)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ejemplo de asignaci'on de polos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear
clc
syms s t
%
Id = eye(3)
vcero = zeros(3,1)
% 
%------------------------
% Representaci'on de Estado
%------------------------
%
A = [0 1 0;
     0 0 1;
     0 0 0]
b = [0; 0; 1]
c = [-1; 0; 1]
x0 = [1; 0; 0]
% 
%------------------------
% Funnci'on de Transferencia Variable de Estado
%------------------------
%
FTve = simplify(c.'*inv(s*Id-A)*b)
factor(FTve)
[num,den] = ss2tf(A,b,c.',0)
roots(num)
roots(den)
% 
%------------------------
% Polos -> valores propios de A 
%       -> raices polinomio caracter'istico
%------------------------
%
pc = det(s*Id-A)
ppc = poly(A)
% 
%------------------------
% Ceros -> raices del determinante de 
%          la Matriz Sistema
%------------------------
%
MS = [(s*Id-A) b; -c.' 0]
pMS = det(MS)
factor(pMS)
% 
%------------------------
% Matriz de controlabilildad 
%------------------------
%
MC = [b A*b A^2*b]
dMC = det(MC)
rank(MC)
% 
%------------------------
% Primera proposici'on: 
% FT = ((s-1)(s+1))/((s-1)(s+1)^2)
%------------------------
%
collect((s+1)^2*(s-1),s)
conv(conv([1 1],[1,1]),[1,-1])
%
% Retroalimentaci?n de estado de 
% la primera proposici'on
%
f1 = [1; 1; -1]
%
% Polos lazo cerrado
%
Af1 = A + b*f1.'
pcLc1 = det(s*Id-Af1)
factor(pcLc1)
poly(Af1)
roots(poly(Af1))
%
% Ceros lazo cerrado
%
MSLc1 = [(s*Id-Af1) b; -c.' 0]
pMSLc1 = det(MSLc1)
factor(pMSLc1)
%
% Forma de Jordan del sistema en lazo cerrado
%
[T1, Jf1] = jordan(Af1)
inv(T1)*Af1*T1 - Jf1
bJ1 = inv(T1)*b
cJ1 = T1.'*c
%
% Matriz sistema del sistema en lazo cerrado 
% en su forma de Jordan
% 
MSLcJ1 = [(s*Id-Jf1) bJ1; -cJ1.' 0]
pretty(MSLcJ1)
%
% Funci'on de transferencia en lazo cerrado
%
FTLc1 = factor(cJ1.'*inv(s*Id-Jf1)*bJ1)
[num1,den1] = ss2tf(Af1,b,c.',0)
roots(num1)
roots(den1)
%
%
%------------------------
% Realizar simulaci'on mdl (Simulink)
%------------------------
%
% 
%------------------------
% Segunda proposici'on: 
% FT = ((s-1)(s+1))/(s+1)^3
%------------------------
%
collect((s+1)^3,s)
conv(conv([1 1],[1,1]),[1,1])
%
% Retroalimentaci'on de estado de 
% la segunda proposici'on
%
f2 = [-1; -3; -3]
%AAA
% Polos lazo cerrado
%
Af2 = A + b*f2.'
pcLc2 = det(s*Id-Af2)
factor(pcLc2)
poly(Af2)
roots(poly(Af2))
%
% Ceros lazo cerrado
%
MSLc2 = [(s*Id-Af2) b; -c.' 0]
pMSLc2 = det(MSLc2)
factor(pMSLc2)
%
% Forma de Jordan del sistema en lazo cerrado
%
[T2, Jf2] = jordan(Af2)
inv(T2)*Af2*T2 - Jf2
bJ2 = inv(T2)*b
cJ2 = T2.'*c
%
% Matriz sistema del sistema en lazo cerrado en su forma de Jordan
% 
MSLcJ2 = [(s*Id-Jf2) bJ2; -cJ2.' 0]
pretty(MSLcJ2)
%
% Funci?n de transferencia en lazo cerrado
%
FTLc2 = cJ2.'*inv(s*Id-Jf2)*bJ2
factor(FTLc2)
[num2,den2] = ss2tf(Af2,b,c.',0)
roots(num2)
roots(den2)
%
%
%------------------------
% Realizar simulaci'on mdl (Simulink)
%------------------------