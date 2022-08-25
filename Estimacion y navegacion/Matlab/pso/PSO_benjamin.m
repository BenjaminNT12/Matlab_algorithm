clc
clear all

Niter = 50;    
Npar = 80;     
c1 = 2;        
c2 = 2;        
wmin = 0.8;    
wmax= 1.1;

func_val2 = 0;

Ox2 = 1*rand(Npar,1)*10*20;
Oy2 = 1*rand(Npar,1)*10*20;

Xpart = 1*rand(Npar,1)*10*3;
Ypart = 1*rand(Npar,1)*10*3;

Vxpart = zeros(Npar,1);
Vypart = zeros(Npar,1);

Pbest = 1000*ones(Npar,1);
BestX = zeros(Npar,1);
BestY = zeros(Npar,1);

X = Xpart;
Y = Ypart;

Gx = 170;
Gy = 150;

for i = 1:Niter
    for j = 1:Npar                                          
        
        f1 = sqrt(abs((Xpart(j)-Gx)^2+(Ypart(j)-Gy)^2));
        f2 = sqrt(abs((Xpart(j)-Ox2(j))^2+(Ypart(j)-Oy2(j)^2)));
        fT = f1 + f2;
        
        if fT < Pbest(j)
            BestX(j) = Xpart(j);
            BestY(j) = Ypart(j);
            Pbest(j) = fT;
        end
    end

    
    [gbest posbest] = min(Pbest);
    Xb(i) = Xpart(posbest);
    Yb(i) = Ypart(posbest);
    P(i) = gbest;
         
    
    for j = 1:Npar  
        w=wmax-((wmax-wmin)*j)/Npar;
        Vxpart(j) = rand*w*Vxpart(j) + c1*rand*(BestX(j) - Xpart(j)) +c2*rand*( Xb(i) - Xpart(j));
        Vypart(j) = rand*w*Vypart(j) + c1*rand*(BestY(j) - Ypart(j)) +c2*rand*( Yb(i) - Ypart(j));
        
        Xpart(j) = Xpart(j) + Vxpart(j);
        Ypart(j) = Ypart(j) + Vypart(j);         
    end   

    X(:,i) = Xpart;
    Y(:,i) = Ypart;
end
%Grafica de la mejor particula
figure(1)
plot(P)

f2=figure(2)
clf(f2)
plot(30,30,'g--o')
hold on
plot(Ox2(:),Oy2(:),'b o')
hold on

plot(Xb,Yb,'r--o')
ylim([0 200])
xlim([0 200])
