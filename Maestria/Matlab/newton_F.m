%Metodo Newto
clear all;
clc;
format long;
syms x;
function rx  = newton_F(fx)

disp('Metodo iterativo Newton')

Fxi     = 0;
DFxi    = 0;
X0      = 0;
i       = 0;
Error   = 100;
t       = linspace(-50,50);
%fx      = input('Funcion f(x) = ');
PercentErr = 0.1;%input('¿Tolerancia de error permitido? ');
P_fx    = subs(fx,t);

plot(t,P_fx);
grid on

Dfx     = diff(fx)
X0(1)   = input('Ingrese X0 = ');

if( Dfx ~= 0)
    
    while (Error > PercentErr && i<100)
        Fxi     = subs(fx,X0(1));
        DFxi    = subs(Dfx,X0(1));
        X0(2)   = (X0(1)-(Fxi/DFxi));
        Error   = abs((X0(2)-X0(1))/X0(2))*100;
        X0(1)   = X0(2);
        i       = i+1;
    end
    rx = X0(2);
    DisplayV = ['Raiz = ',num2str(double(X0(2))),' Error porcentual = ',num2str(Error),' Numero de iteraciones = ',num2str(i)];
    disp(DisplayV);
else
    disp('pendiente cero')
end
end