clear
clc
syms s 
a1=0;
a2=1;
a3=0;
b1=-1;
b2=0;
b3=1;

Id = eye(3);
vcero = zeros(3,1);

%Forma can[onica controlable
Acc=[-a1 1 0;-a2 0 1;-a3 0 0]
bcc=[0;0;1]
beta=inv([1 0 0;a1 1 0;a2 a1 1])*[b1; b2; b3];
ccc=[beta(3) beta(2) beta(1)]

Ac=[0 1 0;0 0 1;-a3 -a2 -a1]
bc=bcc
cc=[b3 b2 b1]

A=Acc;
b=bcc;
x0=[-1;0;0];
c=ccc;

Cont_cc=[bcc, Acc*bcc, Acc^2*bcc]
Cont_c=[bc, Ac*bc, Ac^2*bc]
%retro de estado
fc=[-1; -2; -3]

T=Cont_cc*inv(Cont_c)
fk=fc'*inv(T)
simplify(cc*inv((s*eye(3)-(Ac+bc*fc')))*bc)
simplify(ccc*inv((s*eye(3)-(Acc+bcc*fk)))*bcc)

%%llevar de forma controlador a forma observador
Ao=Ac'
bo=cc
co=bc'
obs=[co;co*Ao;co*Ao^2]
obs_c=[ccc;ccc*Acc;ccc*Acc^2]
%%matriz de cambio de base
Tco=inv(obs_c)*obs
collect((s+5)^3,s)
ko=[-125; -74; -15]
kcc=Tco*ko
k=kcc;
Ak = A + k'*c.'
f=fk;
%Af = A + b*f.'
%Alc = [  A      b*f.'  ;
 %      -k*c.' (Af+k*c.')]
%[T2, Jlc] = jordan(Alc)
