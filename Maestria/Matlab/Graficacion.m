% matlabpool open 4

clear all;
clc;
cla;
format long;
syms x y;
disp('Utilizar metodo de newton rapshon para graficar');

w = 0.1;
Vx = 1;
Vy = 1;
ui = 1;
vi = 1;
Vxp = 0;
Vyp = 0;
ezplot(F_Cos(Vx,Vy,w),[-200,200]);
hold on;
ezplot(F_Sin(Vx,Vy,w),[-200,200]);
hold on;
axis([0 50 0 50])

Vx = input('Ingrese los valores iniciales de X = ');
Vy = input('Ingrese los valores iniciales de Y = ');
tic
Err = 0.09;
c = 0;
Vx2 = Vx;
Vy2 = Vy;

for k = 1:4
    Vx2 = Vx;
    Vy2 = Vy;
    c = 0;
    for w = 0.1:0.01:0.1+(0.01*200)
        [Vx Vy ui vi] = Newton_R_M(F_Cos(Vx,Vy,w),F_Sin(Vx,Vy,w),Vx,Vy);
        c = c + 1;
        Vxp(c) = Vx;
        Vyp(c) = Vy;
        if(abs(ui) > Err) || (abs(vi) > Err)
            Vxp(c) = Vxp(c-1);
            Vyp(c) = Vyp(c-1);
            break
        end
    end
    plot(Vxp,Vyp)
    Vxp = 0;
    Vyp = 0;
    grid on
    hold on
    if(mod(k+1,2) == 0)
        Vx = Vx2 + 6.4;
        Vy = Vy2 - 15;
    else
        Vx = Vx2 - 6.4;
        Vy = Vy2 - 47;        
    end
end
toc
% matlabpool close









%Vx = 33.6;
%Vy = 23.4;
%c = 0;
%for w = 0.1:0.01:0.1+(0.01*200)
%    [Vx Vy ui vi] = Newton_R_M(F_Cos(Vx,Vy,w),F_Sin(Vx,Vy,w),Vx,Vy);
%    c = c + 1;
%    Vxp(c) = Vx;
%    Vyp(c) = Vy;
%    if(abs(ui) > Err) || (abs(vi) > Err)
%        break
%    end    
%end
%plot(Vxp,Vyp)
%grid on




















%plot

%x = fzero(fun,x0)



