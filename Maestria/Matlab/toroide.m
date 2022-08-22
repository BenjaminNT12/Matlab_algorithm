%(x-h)^2 + (y-k)^2 = r^2 
clear all
clc
cla
clf('reset')

Ax = 0;
Ay = 0;
Bx = 0;
By = 0;
t = 0:pi/60:2*pi; 
N = 0;
R = 0.5


for i = 1:2
    Ax = 0
    Ay = 0
    x1 = R*cos(t)+Ax;
    y1 = R*sin(t)+Ay;
    A = plot(x1,y1,'--');
    grid on;
    hold on;
    R = R*2
end
%axis([-R R -R R])
axis 'square'

for j = 1:2
    while(N < 0.5 || N > 1)
        %Bx(j) = input('valor de Bx ')
        %By(j) = input('valor de By ')    
        if(j == 1)
            Bx(j) = 0.5
            By(j) = 0.5
        else
            Bx(j) = -0.5
            By(j) = -0.5            
        end
        N = sqrt((Bx(j)^2)+(By(j)^2));
    
        if (N == 0.5 || N == 1)
            disp('El numero esta en las fronteras de los toroides')
            N = 0;
        end
        if (N < 0.5 || N > 1)
            disp('El numero esta fuera del Toroide, proponga otro punto dentro')
            N = 0;
        end
    end
    N = 0;
    plot(Bx,By,'X');
end

pX = 1;
pY = 1;
contador = 1;
for j = 1:-0.5:-1
    for k = -1:0.5:1
        N = sqrt((j^2)+(k^2));
        pX
        pY
        M(pX,pY) = 0;
        px(pX,pY) = 0;   % x   
        py(pX,pY) = 0;   % y
        if (N > 0.5 && N < 1)
            N = 0;
            M(pX,pY) = 1; % x,y
            px(pX,pY) = k   % x
            py(pX,pY) = j   % y
            plot(j,k,'ok');         
        end
        contador = contador + 1;
        pY = pY+1;
    end
    pY = 1;
    pX = pX+1;
end

M
px
py


p_X = 1;
p_Y = 1;
flag = 0;

Vx = Bx(2);
Vy = By(2);

NuevaPosicionX = 0
NuevaPosicionY = 0

for h = 1:3
    for j = -1:0.5:1
        for k = -1:0.5:1
            if px(p_X,p_Y)+0.3 >= Vx && px(p_X,p_Y)-0.3 <= Vx && py(p_X,p_Y)+0.3 >= Vy && py(p_X,p_Y)-0.3 <= Vy
                plot(px(p_X,p_Y),py(p_X,p_Y),'X');
                Vx = px(p_X,p_Y);
                Vy = py(p_X,p_Y);
                hold on;
                flag = 1;
                break;
            end 
            p_Y = p_Y + 1;
        end
        if(flag == 1)
            if Vx < Bx(1)
                Vx = Vx + 0.5
                if px(p_X,p_Y) == 0 && M(p_X,p_Y) == 0
                    Vx = Vx-0.5
                end
            end  
            if Vy < By(1)
                Vy = Vy + 0.3
                if py(p_X,p_Y) == 0 && M(p_X,p_Y) == 0
                    Vy = Vy-0.3
                end
            end  
            p_X = 1;
            p_Y = 1;
            flag = 0;
            break;
        end
        p_Y = 1;
        p_X = p_X + 1;
    end
    p_X = 1;
end