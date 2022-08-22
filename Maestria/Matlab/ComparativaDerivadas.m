%Derivadas Comparativa

clear all;
clc;
cla;
syms x y;
load VectSave.mat
format long
VInitX = 0;
VInitY = 2;
h = 0.1;
VEndX = 4;
VEndY = VInitY;
f = 4*exp(0.8*x)-0.5*y;

VectorEuler = EulerFunc(f,VInitX,VEndX,VInitY,h);
VectorPuntoMedio = PuntoMedioFunc(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta3er = RungeKutta3er(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta4toFun = RungeKutta4toFun(f,VInitX,VEndX,VInitY,h);
VectorRungeKutta5toFun = RungeKutta5toFun(f,VInitX,VEndX,VInitY,h);
VectorHeun = HeunFunc(f,VInitX,VEndX,VInitY,h);
NP = (VEndX-VInitX)/h
t = linspace(1,4,NP)
tReal = linspace(1,4,4001)
VectorHeun
VectorEuler
VectorPuntoMedio
VectorRungeKutta3er
VectorRungeKutta4toFun
VectorRungeKutta5toFun
plot(tReal,vect,'x');
hold on
plot(t,VectorHeun);
hold on
plot(t,VectorEuler);
hold on
plot(t,VectorPuntoMedio);
hold on
plot(t,VectorRungeKutta3er);
hold on
plot(t,VectorRungeKutta4toFun);
hold on
plot(t,VectorRungeKutta5toFun);
hold on
legend('Real','Heun','Euler','Punto Medio','Runge Kutta 3er','Runge Kutta 4to','Runge Kutta 5to')


