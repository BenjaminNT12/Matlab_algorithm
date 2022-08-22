clear all;
clc;
cla;
format long;
disp('x = [3 4.5 7 9];')
disp('y = [2.5 1 2.5 0.5]')
disp('Metodo de Splinas(INTERPOLACION)')
syms xc;

m = 1;
while m < 1000
    x(m) = input('Ingrese los valores de entrada (x) = ');
    y(m) = input('Ingrese los valores de salida (y) = ');
    plot(x(m),y(m),'ok');
    hold on;
    if m >= 3
        R = input('Desea ingresar otro valor (Y)/(N)? ','s');    
        if R == 'N' || R == 'n'
            R = 0;
            break;
        end
    end
    m = m + 1;
end
tic

SplinesF(x,y);
NewtonF(x,y);
Splines3F(x,y);
LangrangeF(x,y);
toc




























%x = [0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
%y = [2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];
%len = length(x)
%z=@(xx) interp1(x,y,xx,'spline');
%fplot(z,[x(1),x(end)])




%x=[0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
%y=[2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];

%x=[1 2 3 4 5 6 7 8 9 10];
%y=[log(1) log(2) log(3) log(4) log(5) log(6) log(7) log(8) log(9) log(10)];