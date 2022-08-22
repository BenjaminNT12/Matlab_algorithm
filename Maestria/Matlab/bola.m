%(x-h)^2 + (y-k)^2 = r^2 
clear all
clc
cla
clf('reset')

Ax      = 0;
Ay      = 0;
Bx      = 0;
By      = 0;
t       = 0:pi/60:2*pi; 
D       = 0;

disp('Ingresa el Valor de A(x,y)')

Ax      = input('valor de Ax = ')
Ay      = input('valor de Ay = ')
R       = input('Ingresar R = ')
x1      = R*cos(t)+Ax;
y1      = R*sin(t)+Ay;
A       = plot(x1,y1,'--');
grid on;
hold on;
axis([-R R -R R])
axis 'square'


while(R > D || D == R)
    Bx      = input('valor de Bx ')
    By      = input('valor de By ')    
    D       = sqrt(((Ax-Bx)^2)+((Ay-By)^2));
    
    if(D < R)
        D = (R-D)/2
        break
    end
    
    if (D == R)
        disp('El numero esta en la frontera, proponga otro punto dentro de A')
        D = 0;
    end
    
    if (D > R)
        disp('El numero esta fuera del conjunto A, proponga otro punto dentro de A')
        D = 0;
    end
    
end

x2  = D*cos(t) + Bx;
y2  = D*sin(t) + By; 
DisplayV = ['Epsilon = ',num2str(double(D)),' con centro en Bx = ',num2str(Bx),' By = ',num2str(By)];
disp(DisplayV);
B   = plot(x2,y2,'--');


