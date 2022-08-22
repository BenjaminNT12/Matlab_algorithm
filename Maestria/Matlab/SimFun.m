function S = SimFun(v)
x = v(1);
y = v(2);
% S = 4*exp(0.8*x)-0.5*y;
S = (1/(1+x^2))-2*y^2;

