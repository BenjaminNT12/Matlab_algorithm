% metodo numerico para determinar la integral de una duncion diferencial
% por el metodo de Heun

clear all;
clc;
cla;
syms x y;
load VectSave.mat
% load VectorNewFunction.mat
format long
VInitX = 0;
VInitY = 2;
% VInitX = 0;
% VInitY = 0;
h = 1;
k = 1;
VEndX = 4;
% VEndX = 10;
VEndY = VInitY;
VectorError = 0;
VectorReal = 0;
VectorHeun = 0;
VectorEuler = 0;
VectorPuntoMedio = 0;
VectorRungeKutta3er = 0;
VectorRungeKutta4toFun = 0;
VectorRungeKutta5toFun = 0;
%f = 4*exp(0.8*x)-0.5*y;
% f = (1/(1+x^2))-2*y^2;
%f = sqrt(y^2-25);
f = -2*x^3+12*x^2-20*x+8.5

VectorEuler = EulerFunc(f,VInitX,VEndX,VInitY,h);
VectorPuntoMedio = PuntoMedioFunc(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta3er = RungeKutta3er(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta4toFun = RungeKutta4toFun(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta5toFun = RungeKutta5toFun(f,VInitX,VEndX,VInitY,h);
for i = VInitX:h:VEndX-h
    Fpredictor = subs(f,[x,y],[VInitX,VEndY]);
    VEndYTemp = VEndY + Fpredictor *h;
    VInitX = VInitX + h;
    Fcorrector = subs(f,[x,y],[VInitX,VEndYTemp]);
    Prom = double((Fpredictor + Fcorrector)/2);
    VEndYTemp = Prom;
    VEndYTemp = VEndY + VEndYTemp *h;
    for j = 1:0
        VEndYTemp = double(VEndY+((Fpredictor+subs(f,[x,y],[VInitX,VEndYTemp]))/2)*h);
    end
    Error = abs(((vect((VInitX*1000)+1)-VEndYTemp)/vect((VInitX*1000)+1))*100)
    VectorError(k) = Error;
    VReal = vect((VInitX*1000)+1)
    VectorReal(k) = VReal;
    VEndY = VEndYTemp
    VectorHeun(k) = VEndY;
    k = k+1;
end

t = linspace(1,4,4)
tReal = linspace(1,4,4001)
VectorError
VectorReal
VectorHeun
VectorEuler
VectorPuntoMedio
VectorRungeKutta3er
VectorRungeKutta4toFun
VectorRungeKutta5toFun
%plot(t,VectorError);
%hold on
%plot(tReal,vect);
%hold on
%plot(t,VectorHeun);
%hold on
plot(t,VectorEuler);
%hold on
%plot(t,VectorPuntoMedio);
%hold on
%plot(t,VectorRungeKutta3er);
%hold on
%plot(t,VectorRungeKutta4toFun);
%hold on
%plot(t,VectorRungeKutta5toFun);
%hold on
%legend('Error','Real','Heun','Euler','Punto Medio','Runge Kutta 3er','Runge Kutta 4to','Runge Kutta 5to')


