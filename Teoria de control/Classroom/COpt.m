%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
% Ejemplo Control O'ptimo
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% EJECUTAR
clear
clc
syms s
Id = eye(3);
vcero = zeros(3,1);
% 
%------------------------ 
% Representacio'n de Estado
%------------------------ 
% EJECUTAR
A = [0 1 0;
0 0 1;
0 0 0]
b = [0; 0; 1]
c = [-1; 0; 1]
x0 = [1; 0; 0]
%  
%------------------------
% Polos -> valores propios de A
%------------------------ 
% EJECUTAR
pc  = det(s*Id-A)
vpA = eig(A)
% 
%------------------------
% Ceros -> raices del determinante de la Matriz Sistema 
%------------------------ 
% EJECUTAR
MS = [(s*Id-A) b; -c.' 0]
pMS = (det(MS)) 
factor(pMS)
% 
%------------------------ 
% Funncio'n de Transferencia Variable de Estado 
%------------------------ 
% EJECUTAR
FTve = simplify(c.'*inv(s*Id-A)*b)
%
%------------------------ 
% Matriz de observabilildad 
%------------------------ 
% EJECUTAR
MO = [c.'; c.'*A; c.'*A^2]
dMO = det(MO)
% 
%------------------------
% Matriz de controlabilildad 
%------------------------ 
% EJECUTAR
MC = [b A*b A^2*b]
dMC = det(MC)
% 
%% 
%------------------------ 
% Proposicio'n de asignaci'on de polos: 
% FT = ((s-1)(s+1))/(s+1)^3
% FT = ((s-1)(s+1))/(s+10)^3
% FT = ((s-1)(s+1))/(s+0.1)^3
%------------------------ 
% EJECUTAR
collect((s+1)^3,s)
%collect((s+10)^3,s)
%collect((s+0.1)^3,s)
% 
% Retroalimentacio'n de estado asignacio'n de polos
% EJECUTAR 
%fp = [-1; -3; -3]
%fp = [-1000; -300; -30]
fp = [-1/1000; -3/100; -3/10]
% 
% Polos lazo cerrado 
% EJECUTAR
Afp = A + b*fp.'
vpAfp = eig(Afp)
% 
% Ceros lazo cerrado 
% EJECUTAR
MSLcp = [(s*Id-Afp) b; -c.' 0]
pMSLcp = (det(MSLcp))
factor(pMSLcp)
% 
% Funcio'n de transferencia en lazo cerrado 
% 
SisLRp= ss(Afp,b,c.',0)
TFLRrp = zpk(SisLRp)
%
%------------------------ 
% 
%%
%------------------------
% Proposicio'n <Control O'ptimo>: 
% J = (1/2)\int_{0}^{\infty}(y^2 + \rho u^2)dt
%------------------------ 
% EJECUTAR
Q1e2 = c.'
Q = Q1e2.'*Q1e2
vpQ = eig(Q)
%r = 1 
%r = 10 
r = 1/10
% 
%------------------------
% El par (A,b) es controlable
% EJECUTAR LA MATRIZ 
% EJECUTAR EL RANGO
% EJECUTAR EL McPBH
% EJECUTAR TO
% EJECUTAR det(TO)
% EJECUTAR McPBH2 
rank([b,A*b,A^2*b])
McPBH = [(s*Id-A),b]
Tc = [ 1,    0, 0,0;
       s,   -1, 0,0;
       s^2, -s,-1,0;
      -s^3,s^2, s,1]
det(Tc)
McPBH2 = McPBH*Tc
%------------------------
% El par (Q1/2,A) es observable
% EJECUTAR
rank([Q1e2;Q1e2*A;Q1e2*A^2])
MoPBH = [Q1e2;(s*Id-A)]
To = [-1,0,0,0;
      -s,-1,0,1;
      -s^2,-s,-1,s;
      -s^3,-s^2,-s,-1+s^2]
det(To)
MoPBH2 = simplify(To*MoPBH)
%
%------------------------
% Ecuacio'n de Riccati: 
% A.'*P + P*A - P*b*r^(-1)*b.'*P + Q = 0 
%
% Retroalimentacio'n O'ptima: fo.' = r^(-1)*b.'*P
%------------------------ 
% EJECUTAR
[P,L,G] = care(A,b,Q,r,vcero,Id)
P
vpP = eig(P)
%
%------------------------ 
% Retroalimentacio'n de estado control O'ptimo% 
% EJECUTAR
G
r^(-1)*b.'*P
K = lqr(A,b,Q,r)
fo = G.'
%
%------------------------
% Polos lazo cerrado 
%------------------------ 
% EJECUTAR
Afo = A - b*fo.'
pcLco = vpa(det(s*Id-Afo),4)
poly(Afo)
vpAfo = eig(Afo)
%
%------------------------ 
% Ceros lazo cerrado 
%------------------------ 
% EJECUTAR
MSLco = vpa([(s*Id-Afo) b; -c.' 0],4)
pMSLco = det(MSLco)
factor(pMSLco)
%
%
%------------------------ 
% Funci'on de transferencia lazo cerrado 
%------------------------ 
% EJECUTAR
SisLRo= ss(Afo,b,c.',0)
TFLRro = zpk(SisLRo)
[knumLC,denLC] = ss2tf(Afo,b,c.',0)
ceros = roots(knumLC)
polos = roots(denLC)
% 
%------------------------
% Comparacio'n polos en lazo cerrado
%------------------------ 
% EJECUTAR
vpAfp 
r 
vpAfo
[vpAfp,vpAfo]
% 
%  
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Realizar simulacio'n mdl (Simulink)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  