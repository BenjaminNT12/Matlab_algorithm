clear all;
clc;
cla;
format long;
disp('Metodo de Newton(INTERPOLACION)')

syms z;
Bn = 0;
i = 1;

while i < 100
    x0(i) = input('Ingrese los valores de entrada (x) = ');
    fx(i) = input('Ingrese los valores de salida (y) = ');
    plot(x0(i),fx(i),'ok');
    hold on;
    i = i + 1;
    if i > 3
        R = input('Desea ingresar otro valor (Y)/(N)? ','s');
        if R == 'N' || R == 'n' 
            R = 0;
            break;
        end
    end
end

Gi = length(fx);
Gi = Gi-1;
Bn = InterpolationNewton(fx,x0,Gi);
Res = 0;
for i = 1:Gi
    Pp = 1;
    for j = 1:i
        Pp = Pp*(z-x0(j));
    end
    Res = Res+(Bn(i)*Pp);
end
Res = fx(1)+Res

val_min = x0(1);
val_max = x0(1);
for i = 1:Gi+1
    if x0(i) < val_min
        val_min = x0(i);
    end
    if x0(i) > val_max
        val_max = x0(i);
    end
end

t = linspace(val_min,val_max);
P_fx = subs(Res,t);
plot(t,P_fx);
grid on
hold on
R = input('Desea evaluar un valor de entrada (Y)/(N)? ','s');

if R == 'Y' || R == 'y'
    x = input('Ingresa el valor que deseas evaluar ');
    P2_fx = subs(Res,x);
    plot(x,P2_fx,'X');
    DisplayV = ['salida = ',num2str(double(P2_fx))];
    disp(DisplayV);    
end

















