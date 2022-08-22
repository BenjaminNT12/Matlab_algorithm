% U Newton
clear all;
clc;
cla;
format long;
syms x y;
disp('Utilizar metodo de newton rapshon en funcion');
U1 = input('Ingrese la primera ecuacion U(x,y) = ');
V1 = input('Ingrese la segunda ecuacion V(x,y) = ');
Vx = input('Valores iniciales para X = ');
Vy = input('Valores iniciales para Y = ');
[x1 y1 i1] = Newton_Rapshon_Multiples(U1,V1,Vx,Vy);



