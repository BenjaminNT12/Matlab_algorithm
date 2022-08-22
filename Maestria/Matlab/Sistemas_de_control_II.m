clc
clear all 

syms x2 x4 th ph m r11 r22
syms H11 H12 H21 H22 H33 H34 H43 H44
g = 9.81
f0 = [x2;g;x4;0]
f1 = [0 0;(cos(th)*cos(ph))/m 0;0 0;0 1]
H = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1]
Q = H
R = [r11 0;0 r22]

B = [f1'*H*f1+R]
B = inv(B)
U = B*(f1'*Q*f0)

H = [H11 H12 0 0;H21 H22 0 0;0 0 H33 H34;0 0 H43 H44]
Q = H

B = [f1'*H*f1+R]
B = inv(B)
U = B*(f1'*Q*f0)