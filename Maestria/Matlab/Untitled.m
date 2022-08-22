clear all
clc
format long

h=5; %retardo
inc=0.05; %incremento  
N=h/inc;  %indice 100
tau=3;
nUno=tau/inc;

%sistema
SP=0.7;

A0=-0.062113910612249;
A1=0.041173272423816;
B=0.014272634016577;


%ganancias del predictor, se usó qpmr para ver la estabilidad del
%quasipolinomio
F0=-3.6;
F1=-3.6;


ci=0.25;%condición inicial de x
ciu=0;%condición inicial del control


to=0; %tiempo inicial      
tf=500; %tiempo final     
t=to-h;%osea -h

for contaCero=1:N+1   
    x(contaCero)=ci; 
    e(contaCero)=ci-SP;
    K(contaCero)=0;
    tv(contaCero)=t;%construimos todo el tramo de h
    t=t+inc; 
end

%calcular matriz fundamental
t1=0:inc:h;%todo el tramo de 0 a h, en incrementos de 0.05s
for conta1=1:length(t1) 
     K(N+conta1)=exp(A0*t1(conta1));%construimos la matriz fundamental en todo el tramo, 
end
  
%ci del control
for conta2=1:nUno+1
    u(conta2)=ciu; %llenamos el vector para el control de 0 al retardo tau en incrementos de 0.05
end

Ytt=ci;%la salida es igual a ci
Ett=Ytt-SP;%la salida menos el setpoint
Utt=ciu;%el control es igual a ciu
int1=0;%integral 1
int2=0;%integral 2
offset=(-(A0*SP+A1*SP)/(B));%offset

%solución en la forma de cauchy
for conta3 = N+1:(tf-to+h)/inc   %desde 101 (osea, una vez terminado el retardo), hasta 10,200,osea en todo el tiempo más el tramo inicial, en pasos de inc
        auxCont=conta3+(nUno-N); %nUno=60, N=100
        % se calcula y(t-h)
        ind_th=conta3-round(N);%empezamos a llenar el indice, desde 1
        Yth=x(ind_th);%la salida es igual a x
        Eth=Yth-SP;

        % se calcula y(t+tau-h)
        ind_ttauh=conta3+round((tau-h)/inc);%empezamos desde 3, osea desde que termina tau
        Yttauh=x(ind_ttauh);
        Ettauh=Yttauh-SP;

        %se calcula u(t-tau)
        ind_ttau=auxCont-round(nUno);%empezamos desde que termina tau, en este caso en 3, osea posicion 61
        Uttau=u(ind_ttau);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% integrales mediante la regla trapezoidal
%%%%% primer termino
        T1i1 = (1/2)*exp(A0*tau)*B*Uttau; %aproximacion de la trapezoidal
        T1i2 = (1/2)*exp(A0*tau)*A1*Eth; %aproximacion de la trapezoidal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        x(conta3) = x(conta3-1)+inc*(A0*x(conta3-1)+A1*x(conta3-1-round((h-inc)/inc))+B*u(auxCont-1-round((tau-inc)/inc)));
        e(conta3) = x(conta3)-SP;

        Ytt = x(conta3);
        Ett = x(conta3)-SP;
      
        u(auxCont) = F0*(exp(A0*tau))*Ett + F0*int1 + F0*int2 + F1*Ettauh + offset;
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        Utt = u(auxCont);
% nuevo For
        for conta4 = 1:1:N-1
            T3 = conta4*inc;
            theta1 = -h + T3;
            ind_th2t = conta3+round(theta1/inc);
            Yt2h = x(ind_th2t);   
            Et2h = -(SP-Yt2h); 
            theta3 = tau-h-theta1;
            indi2 = round((theta3/inc));
       
         if (indi2) == 0
            KK = 1;         
         elseif indi2 <= -1
            KK = 0;     
         elseif indi2 > length(K)
            KK = K(length(K));
         else
            KK = K(indi2);
         end
            s1i2(conta4,:) = A1*KK*Et2h;
        end
% nuevo For
        for conta5 = 1:1:nUno-1
    
            T2 = conta5*inc;
            theta = -tau+T2;
            ind_th2t = auxCont+round(theta/inc);
            Ut2 = u(ind_th2t);
            indi = round((-theta/inc));
       
        if indi == 0 
            KK = 1;
        elseif indi <= -1
            KK = 0;
        elseif indi > length(K)
            KK = K(length(K));
        else
            KK = K(indi);
        end
    
        s1i1(conta5,:) = B*KK*Ut2;
 
       end

T2i1(:,1) = sum(s1i1);
T2i2(:,1) = sum(s1i2);
  
T4i1 = (1/2)*B*Utt; 
T4i2 = (1/2)*exp(A0*(tau-h))*A1*Ett;
 
% % % % % % aproximaxion de la integral

int1 = (tau/nUno)*T1i1 + T2i1 + (tau/nUno)*T4i1;
int2 = (h/N)*T1i2 + T2i2 +(h/N)*T4i2;

 tv(conta3+1) = t;
 t = t+inc; 
 
 end
 

plot((-5:0.05:499.95),x,'r')
grid on
hold on
axis([-5 500 0 .80])
