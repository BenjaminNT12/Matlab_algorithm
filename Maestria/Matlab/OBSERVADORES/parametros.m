clear all
clc
m =.5;
l =.23;
ka =.02;
g = 9.81;
L1=0.1;
L2=0.1;
%A=[0 1;-g/l -k/(m*l)];
%////////////////////////
zc=0.8;
wnc=4;
zo=1;
wno=18;
k1=g/l-16
k2=ka/(m*l)-6.4;

L1=2*zo*wno-ka/(m*l);
L2=wno^2-L1*ka/(m*l)-g/l

%K=k/m*l;
% Wn= sqrt(-K);
% si= K/2*m*l*Wn;
% K1=g/l-Wn^2;
% K2=k/(m*l)-(2*si*Wn);
% L1=.8432;
% L2=18.29;
% L1=2*si*Wn-k/(m*l);
% L2=Wn^2-l*k/(m*l)-g/l
%////////////////
K1=3.06;
K2=-0.7160;