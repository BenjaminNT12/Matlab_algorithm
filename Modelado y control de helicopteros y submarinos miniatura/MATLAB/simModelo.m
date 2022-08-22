
clc 
clear all
syms s a1 a2 x1 x2

u = 0.1
t = [0 5]
x = [1 0.1]
[tt,xx] = ode45(@modeloPVTOL,[0:0.1;5],[1 0.1],[],0.1);
plot(tt,xx(:,1),tt,xx(:,2));
legend('x_1','x_2');

A = [x(2) 0;0 u]
X = inv(s*eye(2)-A)
 
Xs = subs(X,[a1 a2],[0 1])
Xt = ilaplace(Xs)

x_0 = [1;0.1] %condiciones iniciales
b = [0;0] % vector b

for i = 0:0.1:5
    xT = subs(Xt,i)*x_0+int(subs(Xt,i),i,5)*b*u;
    hold on
    plot(i,xT(1),'o')
    plot(i,xT(2),'x')
end


