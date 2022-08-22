clear
clc
syms s a1 a2 a3 a4 b1 b2 b3 b4

Id = eye(4)

Ac = [0 1 0 0; 0 0 1 0;0 0 0 1; -a4 -a3 -a2 -a1]

bc= [0;0;0;1]
cc = [b4;b3;b2;b1]


pcc = factor(det(s*Id-Ac))
ppcc=charpoly(Ac)

MSc=[(s*Id-Ac) bc; -cc.' 0]
pMSc = factor(det(MSc))

MCc=simplyfy([bc Ac*bc Ac^2*bc Ac^3*bc])
dMCc=det(MCc)