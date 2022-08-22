clear 
clc
syms s
Id=eye(3)
vcero=zeros(3,1)
a1=0
a2=1
a3=0
b1=-1
b2=0
b3=1
A=[-a1 1 0;-a2 0 1;-a3 0 0]
b=[0;0;1]
beta=inv([1 0 0; a1 1 0; a2 a1 1])*[b1;b2;b3]
c=[beta(3);beta(2);beta(1)]
x0=[-1;0;0]
pc=det(s*Id-A)
Ms=[(s*Id-A) b;-c.' 0]
pMs=det(Ms)
Mc=[b A*b A^2*b]
dMc=det(Mc)
Mo=[c.';c.'*A;c.'*A^2]
dMo=det(Mo)
f=[2;-2;-3]
Af=A+b*f.'
Ao=[0 0 0;1 0 -1;0 1 0]
bo=[1;0;1]
co=[0;0;1]
Moo=[co.';co.'*Ao;co.'*Ao^2]
T1=inv(Mo)*Moo
ko=[-125;-74;-15]
Ako=Ao+ko*co.'
k=T1*ko
Ak=A+k*c.'
Alc=[A b*f.'; -k*c.' (Af+k*c.')]
blc=[b;b]oolo 
cllc=[c; vcero]
[T2 Jlc]=jordan(Alc)