%Secante
clear all;
clc;
format long
syms x;

disp('Metodo iterativo Secante')

i       = 0;
Error   = 100;
t       = linspace(-50,50);
fx      = input('Funcion f(x) = ');
P_fx    = subs(fx,t);

plot(t,P_fx);
grid on

Xi(1)       = input('Ingrese el valor de X-1= ');
Xi(2)       = input('Ingrese el valor de X 0= ');
PercentErr  = input('¿Tolerancia de error permitido? ');

if Xi(1) ~= Xi(2)
    
    while(Error > PercentErr && i<100)
        
        Xi(3)   = Xi(2)-((subs(fx,Xi(2))*(Xi(1)-Xi(2)))/(subs(fx,Xi(1))-subs(fx,Xi(2))));
        Error   = abs((Xi(3)-Xi(2))/Xi(3))*100;
        Xi(1)   = Xi(2);
        Xi(2)   = Xi(3);
        i       = i+1;
    end
    
    DisplayV = ['Raiz = ',num2str(Xi(3)),' Error porcentual = ',num2str(Error),' Numero de iteraciones = ',num2str(i)];
    disp(DisplayV) 
end

