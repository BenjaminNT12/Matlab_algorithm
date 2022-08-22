%Muller

clear all;
clc;
syms x;
format long

disp('Metodo iterativo Mûller')

Err         = 100;
i           = 1;
ABC         = 0;
h1          = 0;
h2          = 0;
delt        = 0;
t           = linspace(-50,50);
fx          = input('Funcion f(x) = ');
P_fx        = subs(fx,t);
plot(t,P_fx)
grid on
x1        = input('Ingrese X1 = ');
x2        = input('Ingrese X2 = ');
x3        = input('Ingrese X3 = ');
PercentErr  = input('¿Tolerancia de error permitido? ');
R           = 0;

while Err > PercentErr && i < 10
    h1 = (x2 - x1);
    h2 = (x3 - x2);

    delt1 = (subs(fx,x2)-subs(fx,x1))/(x2-x1);
    delt2 = (subs(fx,x3)-subs(fx,x2))/(x3-x2);

    ABC1 = (delt2 - delt1)/(h2 + h1);
    ABC2 = (ABC1*(h2))+delt2;
    ABC3 = subs(fx,x3);
    
    R = sqrt((ABC2^2)-4*ABC1*ABC3);
    ABC2 = double(ABC2);
    if ABC2 > 0
        x4 = x3+((-2*ABC3)/(ABC2+R));
    else
        x4 = x3+((-2*ABC3)/(ABC2-R));
    end
    Err = abs((x4-x3)/x4)*100;
    x1 = x2;
    x2 = x3;
    x3 = x4;
    i = i+1;
end

DisplayV = ['Raiz = ',num2str(double(x4)),' Error porcentual = ',num2str(double(Err)),' Numero de iteraciones = ',num2str(i)];
disp(DisplayV)


