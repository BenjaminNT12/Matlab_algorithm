%Metodo Newton Rapshon 
function [xi,yi,i] = Newton_Rapshon_Multiples(Uxy,Vxy,xi,yi)

syms x y;
detJacob = 0;
ezplot(Uxy,[-20,20]);
hold on;
ezplot(Vxy,[-20,20]);
hold on;

dpUx = diff(Uxy,x);
dpUy = diff(Uxy,y);

dpVx = diff(Vxy,x);
dpVy = diff(Vxy,y);

plot(xi,yi,'o');
hold on

mJacob = [dpUx dpUy ; dpVx dpVy];

i = 0;
ui = 1;
vi = 1;
while ((abs(ui) > 0.5 || abs(vi) > 0.5) && i < 10)
    ui = subs(Uxy,{x, y},{xi,yi});
    vi = subs(Vxy,{x, y},{xi,yi});

    VdpUx = subs(dpUx,{x,y},{xi,yi});
    VdpUy = subs(dpUy,{x,y},{xi,yi});

    VdpVx = subs(dpVx,{x,y},{xi,yi});
    VdpVy = subs(dpVy,{x,y},{xi,yi});
    
    detJacob = VdpUx*VdpVy-VdpUy*VdpVx;

    xi = xi-(((ui*VdpVy)-(vi*VdpUx))/detJacob);
    yi = yi-(((vi*VdpUx)-(ui*VdpVx))/detJacob);
    
    i = i + 1;
end

xi = vpa(xi);
yi = vpa(yi);
DispV = ['Valor de X = ',num2str(double(xi)),' Valor de Y = ',num2str(double(yi)),' Numero de iteraciones = ',num2str(i)];
plot(xi,yi,'X');
grid on;
disp(DispV);
