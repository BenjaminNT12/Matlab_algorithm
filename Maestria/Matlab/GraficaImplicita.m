%Metodo Newton
clear all;
clc;
syms x;
format long

Fxi     = 0;
DFxi    = 0;
X0      = 0;
i       = 0;
k       = 1;
Error   = 100;
t       = linspace(0.1,1,9);
PercentErr = 0.1;
VGi     = 0;
X0(1)   = 0.1;
for i = 0.1:0.1:.3
    i
    fx = exp(x)+((1-i)*x)
    VGi(k) = newton_F(fx);
    k = k+1;
end
P_fx    = subs(VGi,t,'x');
plot(P_fx);

grid(on)