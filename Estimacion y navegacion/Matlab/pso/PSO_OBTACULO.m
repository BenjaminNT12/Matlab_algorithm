%-------------------------------------------------------------
% SE TIENEN 1 OBTACULO CIRCULAR
%-------------------------------------------------------------
clc
clear all

Niter = 200;    %Numero de iteraciones
Npar = 80;     %Numero de particulas
c1 = 0.8;        %Constante 1
c2 = 1;        %Constante 2
wmin = 0.8;    %Peso de inercia generalmente entre [0.9 1.2] o [0.5 1]
wmax= 1.1;
%Obtener las posiciones inicial  de las particulas
%posición= (x,y)
Xpart = 1*rand(Npar,1)*30;
Ypart = 1*rand(Npar,1)*30;
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
Gx=170;
Gy=150;
%Posición del obstaculo
Ox=100;
Oy=100;

for iter = 1:Niter
    
    % Actualizar la mejor solución de cada partícula
    for i = 1:Npar                                          
        %Funcion a minimizar
        func_1= sqrt(abs((Xpart(i)-Gx)^2+(Ypart(i)-Gy)^2));
        %Funcion para evadir objeto
        func_2= sqrt(abs((Xpart(i)-Ox)^2+(Ypart(i)-Oy)^2));
        %Funcion toal a minimizar
        func_val=func_1+0.1*func_2;
       
        
        if func_val < Pbest(i)
            BestX(i) = Xpart(i);
            BestY(i) = Ypart(i);
            Pbest(i) = func_val;
        end
    end

    %Buscar la mejor solución de todas las partículas
    [gbest,posbest] = min(Pbest);
    Xb(iter) = Xpart(posbest);
    Yb(iter) = Ypart(posbest);
    P(iter) = gbest;
         
    % Actualizar los vectores de posición y velocidad
    for i = 1:Npar  
        w=wmax-((wmax-wmin)*i)/Npar;
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
plot(30,30,'g--o')
%plot(100,100,'b--o')
hold on
plot(Xb,Yb,'r--o')
ylim([0 200])
xlim([0 200])
hold on
colors='k'
centers=[100 100];
radio=10;
viscircles(centers,radio,'Color',colors);
hold on
plot(170,150,'b--o')
% 


