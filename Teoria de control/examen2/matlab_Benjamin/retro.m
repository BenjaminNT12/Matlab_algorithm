syms s
a1=0
a2=1
a3=0
Acc = [-a1 1 0;-a2 0 1;-a3 0 0]
bcc=[0;0;1]
beta=inv([1 0 0;a1 1 0;a2 a1 1])*[b1;b2;b3]
ccc=[beta(3),beta(2),beta(1)]

Ac=[0 1 0; 0 0 1; -a3 -a2 -a1]
bc=[0;0;1]
cc=[b3 b2 b1]
%CAbcc=[bcc,Acc*bcc,Acc^2*bcc]
%CAbc=[bc,Ac*bc,Ac^2*bc]
%fc=[-1 -2 -3]
%T=inv(CAbcc)*(CAbc)
%fR=T*fc'
Ao=Acc'
bo=ccc
co=bcc'
obs=[co;co*Ao;co*Ao^2]
obsc=[ccc;ccc*Acc;ccc*Acc^2]
Tco=inv(obsc)*obs
collect((s+5)^3,s)
ko=[-110;-74;-15]
kcc=Tco*ko