%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                                                      %
% Programa MatLab correspondiente a                                                                           %
% a Asignaci'on de Polos:                                                                                                 %
% Teor'ia de Anillos                                                                                                           %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear
clc
syms s a e
N = -4*s^2+1
M = collect(s^3-s,s)
Q = collect((s+1)^3,s)
%
%%%%%%%%%%%%%%%%%%%%% 
%%  
%   Algoritmo de divisi'on de Euclidez
%
%S = 1
%R = Q-M*S
[S,R] = quorem(Q,M,s)
factor(R)
% 
%%%%%%%%%%%%%%%%%%%%%