%calculo de los valores de la serie discreta de fourier
%4*sin(x)+3*cos(x);
clear all;
clc;
cla;
syms x;
format long
fxt = 0;
N = 128;
K = N/2;
% 
fxt = 4*sin(x)+3*cos(x)+2.3*cos(2*x)-5.6*sin(5*x+pi/3);
% 
% gs = 0;
% for i = 1:100
%     gs = gs + sin(i*x)/i
% end
% gs = gs*2
% fxt = pi-gs

t = linspace(0,2*pi-2*pi/N,N);
Fx = double(subs(fxt,t));
plot(t,Fx);
hold on
VectorCoseno = 0;
VectorSeno = 0;
c = 1;
for i = 1:N
    VectorCoseno(c) = double(cos((2*pi*(i-1))/N));
    VectorSeno(c) = double(sin((2*pi*(i-1))/N));
    c = c+1;
end

A0 = 0
for l = 1:K
    Re = 0;
    Im = 0;
    p = 1;
    for i = 1:N
        Re = Re + (Fx(i)*VectorCoseno(p));
        Im = Im - (Fx(i)*VectorSeno(p));
        p = p + l;
        if (p > N)
            p = p - N;
        end
    end
    SumRe(l) = Re/(N/2);
    SumIm(l) = -Im/(N/2);
    Mag(l) = sqrt(SumRe(l)^2 + SumIm(l)^2);
    A0 = A0+SumRe(l)
     Phase(l) = atand(SumIm(l)/SumRe(l));    
end
A0 = A0/N;
% bar(Mag);
hold on 
disp('Inversa')
 SumRe(1) = SumRe(1)/2;
 SumRe(K) = SumRe(K)/2;
for i = 1:N
    p = 1;    
    SumPReal = 0;
    SumPImag = 0;
    for ki = 1:K
        SumPReal = SumPReal + (SumRe(ki)*VectorCoseno(p));
        SumPImag = SumPImag + (SumIm(ki)*VectorSeno(p));
        p = p + i;
        if( p > N)
            p = p - N;
        end
    end
    Fxp(i) = SumPReal + SumPImag;
end

 plot(t,Fxp,'X');
