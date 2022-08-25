%-------------------------------------------------------------
% SE TIENEN 50 OBTACULO puntuales
%-------------------------------------------------------------
clc
clear all

Niter = 100;    %Numero de iteraciones
Npar = 10;     %Numero de particulas
c1 = 2;        %Constante 1
c2 = 2;        %Constante 2

w=1;
wd=2;
wt=2;
%Obtener las posiciones inicial  de las particulas
%posición= (x,y)
Xpart = 1*rand(Npar,1);
Ypart = 1*rand(Npar,1);
%Velocidad inicial de cada particula
%Velocidad= (Vx,Vy)
Vxpart = zeros(Npar,1);
Vypart = zeros(Npar,1);
% Vector con la mejor posción de particula
Pbest = 1000*ones(Npar,1);
BestX = zeros(Npar,1);
BestY = zeros(Npar,1);
%Cambio de variable
X = Xpart;
Y = Ypart;
%Posición final
Gx=23;
Gy=30;
%Posición del obstaculo
Ox=0;
Oy=0;
%Posición de los obstaculos
Xops=1*rand(50,1)*23;
Yops=1*rand(50,1)*30;
for iter = 1:Niter
    
    % Actualizar la mejor solución de cada partícula
    for i = 1:Npar                                          
        %Funcion a minimizar
        d= sqrt((Xpart(i)-Gx)^2+(Ypart(i)-Gy)^2);
        v=Vxpart(i)+Vypart(i)
        t=d/v
        func_val= 1/(wd*d+wt*t);
        
        if func_val < Pbest(i)
            for j=1:50
            if (Xpart(i)~=Xops(j)) && (Xpart(i)~=Xops(j))
               BestX(i) = Xpart(i);
               BestY(i) = Ypart(i);
               Pbest(i) = func_val;
            end
            end
        end
    end

    %Buscar la mejor solución de todas las partículas
    [gbest,posbest] = min(Pbest);
    Xb(iter) = Xpart(posbest);
    Yb(iter) = Ypart(posbest);
    P(iter) = gbest;
         
    % Actualizar los vectores de posición y velocidad
    for i = 1:Npar  
        
        Vxpart(i) = rand*w*Vxpart(i) + c1*rand*(BestX(i) - Xpart(i)) +c2*rand*( Xb(iter) - Xpart(i));
        Vypart(i) = rand*w*Vypart(i) + c1*rand*(BestY(i) - Ypart(i)) +c2*rand*( Yb(iter) - Ypart(i));
        
        Xpart(i) = Xpart(i) + Vxpart(i);
        Ypart(i) = Ypart(i) + Vypart(i);        
    end   

    X(:,iter) = Xpart;
    Y(:,iter) = Ypart;
end
%Grafica de la mejor particula
figure(1)
plot(P)

f2=figure(2)
clf(f2)
hold on
plot(0,0,'g--o')
plot(23,30,'b--o')
hold on
plot(Xb,Yb,'r--o')
ylim([0 30])
xlim([0 23])
hold on
plot(Xops(:),Yops(:),'ko')
% 