%Biseccion control de robots

clear all;
clc;
syms x;
format long

disp('Metodo iterativo Biseccion')


i           = 0;
Xi(2)       = 0;
F1          = 0;
Err1        = 100;
t           = linspace(-50,50);
fx          = input('Funcion f(x) = ');
PercentErr  = input('¿Tolerancia de error permitido? ');
P_fx        = subs(fx,t);

plot(t,P_fx)
grid on

while(F1 == 0)
    
disp('Ingrese el intervalo de A y B');

A   = input('ingrese a = ');
B   = input('ingrese b = ');
FxA = subs(fx,A);
FxB = subs(fx,B);

    if (FxA*FxB) < 0
        F1 = 1;
    else
        disp('En el rango no hay cambios de signo');
    end
    
end

while (Err1 > PercentErr && i<100)
    Xi(1)   = Xi(2);
    Xi(2)   = ((B+A)/2);
    FxA     = subs(fx,A);
    FxX     = subs(fx,Xi(2));
    Err1    = abs((Xi(2)-Xi(1))/Xi(2))*100;
    
    if ( FxA * FxX ) < 0
        B = Xi(2);
    end
    if( FxA * FxX )>0
        A = Xi(2);
    end
    if(( FxA * FxX ) == 0)
        break;
    end
    i = i+1;
end

DisplayV = ['Raiz = ',num2str(Xi(2)),' Error porcentual = ',num2str(Err1),' Numero de iteraciones = ',num2str(i)];
disp(DisplayV);



