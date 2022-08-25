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

Gx=170;
Gy=150;

for iter = 1:Niter

    for i = 1:Npar                                          
        
        func_val = sqrt(abs((Xpart(i)-Gx)^2+(Ypart(i)-Gy)^2));

        func_val2(i+1) = sqrt(abs((Xpart(i)-Ox2(i))^2+(Ypart(i)-Oy2(i)^2)));

        func_total = func_val + func_val2;
        
        if func_total < Pbest(i)
            BestX(i) = Xpart(i);
            BestY(i) = Ypart(i);
            Pbest(i) = func_total;
        end
    end

    
    [gbest posbest] = min(Pbest);
    Xb(iter) = Xpart(posbest);
    Yb(iter) = Ypart(posbest);
    P(iter) = gbest;
         
    
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
plot(30,30,'g--o')
hold on
plot(Ox2(:),Oy2(:),'b o')
hold on

plot(Xb,Yb,'r--o')
ylim([0 200])
xlim([0 200])
