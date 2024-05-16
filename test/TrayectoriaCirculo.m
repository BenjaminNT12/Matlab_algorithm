%%Trayectoria circulo
close all; clear all; clc

Ti=0.05;
t=0:Ti:120;
angulo= (2*pi*t/30);
angulo(1:length(t))=pi/2;

for i=1:length(t)-1
    x(i)=sin(pi*t(i)/60);
    y(i)=-1+cos(pi*t(i)/60);

    gamma=2*pi/30;
    g2=1;
   
    qd(i,:)=[cos(gamma*t(i)/2),0,0,sin(gamma*t(i)/2)];
    r=[0.25 0 0];
    P(i,:)=quatmultiply(qd(i,:),quatmultiply([0,r],quatconj(qd(i,:))))+[0 0 0 1]-[0,r];
    

    qd2(i,:)=[cos(pi/2),0,0,sin(pi/2)];
    euler = [angulo(i),0,0];
    quat(i,:) = eul2quat( euler );


end 

q=[0.7071,0,0,0.7071];

absq=sqrt(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2);

qn1=[q(1)/absq q(2)/absq q(3)/absq q(4)/absq]
    
absq2=qn1(1)^2 + qn1(2)^2 + qn1(3)^2 + qn1(4)^2

qn2=quatnormalize(q)
    
figure(1)
plot(x,y)

% plot(x,y)
% grid on

% plot(t(1:length(t)-1),angulo)

% grid on
% plot(P(:,2),P(:,3))
% grid on

% qq = [1 0 1 0]
% rr = [1 0.5 0.5 0.75]
% mult = quatmultiply(qq, rr)



