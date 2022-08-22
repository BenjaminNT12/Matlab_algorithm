%Metodo Newton
clear all;
clc;
cla;
syms x;
format long

disp('Ingrese el rango de ploteo');
Ii = input('Inferior = ');
Si = input('Superior = ');
X0 = 0;
j  = 0;
Error = 100;
PercentErr = 0.01;
X0(1)   = -1;
ezplot('x*y-exp(y)-y');
for i = Ii:0.1:Si
    fx = exp(x)+((1-i)*x);
    Dfx = diff(fx);
    j = 0;
    Error = 100;
    while (Error > PercentErr && j < 4)
        X0(2)   = (X0(1)-(subs(fx,X0(1))/subs(Dfx,X0(1))));
        Error   = abs((X0(2)-X0(1))/X0(2))*100;
        X0(1)   = X0(2);
        j       = j+1;
    end
    Error
    if Error < 0.1
        plot(i,X0(2),'+');
        hold on; 
    end
end
axis([-10 10 -10 10]);
axis 'square';
grid on;



