clc 
clear all
close all

T = 0.01;
t = [0: T :10];

K(1)  = 0;
Xh = [8 7];
P(1)  = 1;
y(1) = 1;

noise = rand(length(t),1); 

I = 1;

H = [1 0.99];
R = 0.01;
% 
for(i = 1: 10)
    i
    y(i+1) = H(i)*Xh(i) + H(i+1)*Xh(i+1)
    
    K(i+1) = P(i)*H(i)'*inv(R);
% 
    H(i+1) = H(i)*Xh(i) + H(i+1)*Xh(i+1);
    % 
    Xh(i+2) = Xh(i)+K(i+1)*(y(i+1)-H(i+1)*Xh(i));
    
    P(i+1) = (I-K(i+1)*H(i+1))*P(i);    
end

