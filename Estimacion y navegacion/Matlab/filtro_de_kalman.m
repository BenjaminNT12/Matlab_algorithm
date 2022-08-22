clc
clear all
close all

T = 5;
t1 = [0;T;60*T];
t =[0:60];

VAR = 900;
MED =0;
v=sqrt(3*(VAR))*((2*rand(length(t),1)-1));
%v=sqrt(3*(VAR))*((2*rand(10000,1)-1));

F = [1 T T^2/2; 0 1 T; 0 0 1];
x = [1 0.1 0.05];
H = [1 0 0];

y = H*x';

R=VAR;

xmas = x;
pmas = 100*eye(3);


for i=2:length (t)
    x(i,:)=F*x(i-1,:)';
    y(i) = H*x(i,:)'+v(i);
end

for i=2:length(t)
    
    %Prediccion
    
    xmenos(i,:)=F*xmas(i-1,:)';
    pmenos = F*pmas*F';
    pminus(:,:,i)=pmenos;
    
    %Actualizacion
    
    K = pmenos*H'*inv(H*pmenos*H'+R);
    pmas = pmenos - K*H*pmenos;
    pplus(:,:,i)=pmas;
    xmas(i,:)=xmenos(i,:)+K'*(y(i)-H*xmenos(i,:)');
end

figure(1)
plot(t,y,t,xmas(:,1),t,x(:,1))


figure(2)
subplot(211)
plot(t,xmas(:,2),t,x(:,2))
subplot(212)
plot(t,xmas(:,3),t,x(:,3))

figure(3)
plot(t,x(:,1)-y',t,x(:,1)-xmas(:,1))
legend('E_{medicion}','E_{estimado}')
plot(t,x(:,1)-y',t,x(:,1)-xmas(:,1))

figure(4)
hold on
for i=1:4
    plot([i i+1],[pplus(1,1,i) pminus(1,1,i+1)],'r','LineWidth',2)
    plot([i+1 i+1],[pminus(1,1,i+1) pplus(1,1,i+1)],'r','LineWidth',2)
end
    
