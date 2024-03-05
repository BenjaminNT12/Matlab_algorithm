clear;
close all;
clc;

(1:m, 1) = p(E(1,2)*m-2:E(1,2)*m, 1) - p(E(1,1)*m-2:E(1,1)*m, 1);
qtin = qtinVector(E, qt(1:m, 1), 9, l, m);
v0 = [2*sin(0.35*t)',       2*(cos(0.35*t))',   ones(length(t),1)]'; % trayectoria
w0 = [zeros(length(t),1), zeros(length(t),1),  zeros(length(t),1)]';

V = v0+cross(w0, qtin);

X = [p; V];