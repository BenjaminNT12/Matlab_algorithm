%%%%%%%%%%%%%%%%%%%%% 
%% 
% Ecuacion Diofantina
%
syms s
Q = collect((s+1)^2*(2*s+1),s)
N = -4*s^2+1
M = collect(s^3-s,s)
a1=0; a2=-1; a3=0;
b0=0; b1=-4; b2=0; b3=1;
X = [1  0  0  b0 0  0;
     a1 1  0  b1 b0 0;
     a2 a1 1  b2 b1 b0;
     a3 a2 a1 b3 b2 b1;
     0  a3 a2 0  b3 b2;
     0   0 a3 0  0  b3]
factor(det(X))
Xinv = inv(X)
pLC = simplify(collect((s+2.5)^2*Q,s)) %s+5
q=(sym2poly(pLC))'
coef = inv(X)*q
Sd = collect(coef(1)*s^2 + coef(2)*s + coef(3),s)
Rd = collect(coef(4)*s^2 + coef(5)*s + coef(6),s)

Qob = simplify(M*Sd+N*Rd)
Qob-pLC %comprobacion


FT = simplify((1/Sd)*((N/M)/(1+(Rd/Sd)*(N/M))))
gg = double(subs(FT,s,0))
roots([1 -54 -109/4])

pS = [coef(1) coef(2) coef(3)]
pR = [coef(4) coef(5) coef(6)]  

A = [0 -pS(3);
     1 -pS(2)]

pSR=[(pR(2)-pR(1)*pS(2)) (pR(3)-pR(1)*pS(3))]
%pR = (pR(1)*pS + conv([0 1],pSR))

B = [1 -pSR(2);
    0 -pSR(1)]

C = [0 1]
D = [0 -pR(1)]

N = [0 -4     0     1]
M = sym2poly(collect(s^3-s,s))