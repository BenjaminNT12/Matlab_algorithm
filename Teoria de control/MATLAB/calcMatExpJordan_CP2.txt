clear
clc
syms t a1 a2
A = [0,1;-a2,-a1]
%--------------------------
%% Caso 1: 
%
A1 = subs(A,[a1,a2],[2,1])
vp1 = eig(A1)
[T1 J1] = jordan(A1)
inv(T1)*A1*T1 - J1
D1 = [vp1(1),0;0,vp1(2)]
N1= J1 - D1
ExpD1 = [exp(vp1(1)*t), 0; 0, exp(vp1(2)*t)]
N1*N1
ExpN1 = eye(2) + N1*t
ExpA1 = T1*(ExpD1*ExpN1)*inv(T1)
%--------------------------
%% Caso 2: 
%
A2 = subs(A,[a1,a2],[0,0])
vp2 = eig(A2)
[T2 J2] = jordan(A2)
inv(T2)*A2*T2 - J2
D2 = [vp2(1),0;0,vp2(2)]
N2= J2 - D2
ExpD2 = [exp(vp2(1)*t), 0; 0, exp(vp2(2)*t)]
N2*N2
ExpN2 = eye(2) + N2*t
ExpA2 = T2*(ExpD2*ExpN2)*inv(T2)
%--------------------------
%% Caso 3: 
%
A3 = subs(A,[a1,a2],[0,1])
vp3 = eig(A3)
[T3 J3] = jordan(A3)
inv(T3)*A3*T3 - J3
D3 = [vp3(1),0;0,vp3(2)]
N3= J3 - D3
ExpD3 = [exp(vp3(1)*t), 0; 0, exp(vp3(2)*t)]
N3
ExpN3 = eye(2) 
ExpA3 = simplify(T3*(ExpD3*ExpN3)*inv(T3))