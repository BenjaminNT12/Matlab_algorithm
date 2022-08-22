%Metodo Newton Rapshon 
function [xi,yi,ui,vi] = Newton_R_M(Uxy,Vxy,xi,yi)

syms x y;

%ezplot(Uxy,[-200,200]);
%ezplot(Vxy,[-200,200]);

dpUx = diff(Uxy,x);
dpUy = diff(Uxy,y);

dpVx = diff(Vxy,x);
dpVy = diff(Vxy,y);

i = 0;
ui = 1;
vi = 1;
while ((abs(ui) > 0.007 || abs(vi) > 0.007) && i < 5)
%for k = 1:5
    ui = subs(Uxy,{x, y},{xi,yi});
    vi = subs(Vxy,{x, y},{xi,yi});

    VdpUx = subs(dpUx,{x,y},{xi,yi});
    VdpUy = subs(dpUy,{x,y},{xi,yi});

    VdpVx = subs(dpVx,{x,y},{xi,yi});
    VdpVy = subs(dpVy,{x,y},{xi,yi});
    
    detJacob = VdpUx*VdpVy-VdpUy*VdpVx;

    xi = xi-(((ui*VdpVy)-(vi*VdpUy))/detJacob);
    yi = yi-(((vi*VdpUx)-(ui*VdpVx))/detJacob);
    
    i = i + 1;
end

xi = vpa(xi);
yi = vpa(yi);
DispV = ['Valor de X = ',num2str(double(xi)),' Valor de Y = ',num2str(double(yi)),' f(u) = ',num2str(double(ui)),' f(v) = ',num2str(double(vi)),' Numero de iteraciones = ',num2str(i)];
%plot(xi,yi,'X');
%grid on;
disp(DispV);