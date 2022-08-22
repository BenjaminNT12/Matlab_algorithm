%Metodo Newto
clear all;
clc;
cla;
format long;
syms x y;

disp('Metodo iterativo Newton-Rapshon')

xi = 1;
yi = 1;
detJacob = 0;

Uxy = input('Ingrese la primera ecuacion U(x,y) = ');
ezplot(Uxy,[-200,200]);
hold on;
Vxy = input('Ingrese la segunda ecuacion V(x,y) = ');
ezplot(Vxy,[-200,200]);
hold on;
xi = input('Ingrese los valores iniciales para X = ');
yi = input('Ingrese los valores iniciales para Y = ');
N = input('Numero de iteraciones = ');

dpUx = diff(Uxy,x);
dpUy = diff(Uxy,y);

dpVx = diff(Vxy,x);
dpVy = diff(Vxy,y);

mJacob = [dpUx dpUy ; dpVx dpVy]

i = 1;
ErrX = 100;
ErrY = 100;

for i=1:N
    ui = subs(Uxy,{x, y},{xi,yi});
    vi = subs(Vxy,{x, y},{xi,yi});

    VdpUx = subs(dpUx,{x,y},{xi,yi});
    VdpUy = subs(dpUy,{x,y},{xi,yi});

    VdpVx = subs(dpVx,{x,y},{xi,yi});
    VdpVy = subs(dpVy,{x,y},{xi,yi});
    
    detJacob = VdpUx*VdpVy-VdpUy*VdpVx;

    xi_1 = xi-(((ui*VdpVy)-(vi*VdpUy))/detJacob);
    yi_1 = yi-(((vi*VdpUx)-(ui*VdpVx))/detJacob);
    
    xi = xi_1;
    yi = yi_1;
    i = i + 1;
end

xi = vpa(xi);
yi = vpa(yi);
DispV = ['Valor de X = ',num2str(double(xi)),' Valor de Y = ',num2str(double(yi)),' Numero de iteraciones = ',num2str(i)];
plot(xi,yi,'X')
disp(DispV)




%