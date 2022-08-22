% metodo de lagrange
function Res = LangrangeF(x,fx)
clear all;
clc;
cla;
format long;
syms vfx
Gf = length(x)
Gf = Gf - 1

Res = 0;

for i = 0: Gf
    l = 1;
    for j = 0 : Gf 
        if i ~= j
            l = l*((vfx-x(j+1))/(x(i+1)-x(j+1)));
        end
    end
    Res = Res + fx(i+1)*l;
end

val_min = x(1);
val_max = x(1);
for i = 1:Gf+1
    if x(i) < val_min
        val_min = x(i);
    end
    if x(i) > val_max
        val_max = x(i);
    end
end

t = linspace(val_min,val_max);
P_fx = subs(Res,t);
plot(t,P_fx,'LineWidth',2);
grid on

