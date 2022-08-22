parpool(2)
clear all;
clear axis;
syms s;
clc;
h = 2
QP = s-(-6)-(-2)-exp(-s*h)
P = qpmr_1(QP,[-40 40 -40 40],0.1*pi/2.5,0.001);