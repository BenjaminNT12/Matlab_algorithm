% Minimos cuadrados recursivos

clc 
clear all
close all

T = 0.1;
t = [0: T :50];

K(1)  = 0;
Xh = [8 7];
P(1)  = 1;
y(1) = 1;

noise = -0.1 + (0.1 + 0.1)*rand(length(t), 1);  

I = 1;

H = [1 0.99];
R = 0.01;
% 
for(i = 1: 10)
    K(i) = P(i-1)*H(i)'*inv(R);
    Xh(i) = Xh(i-1)+K(i)*(y(i)-H(i)*Xh(i-1));
    P(i) = (I-K(i)*H(i))*P(i-1);
end

