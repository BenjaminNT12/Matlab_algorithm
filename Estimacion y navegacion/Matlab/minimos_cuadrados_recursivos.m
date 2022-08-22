tic
clc 
close all
clear
 
Vec_k = [0 0];
Po = eye(2);

x1(1) = 8;
x2(1) = 7;

Xk_1 = [x1 x2]';

R = 0.01;

for i = 1:50
    A = [1 0.99];
    
    noise = -0.01 + (0.01 + 0.01)*rand(1, 1);

    y = 14.5 + (15.5-14.5).*rand(1,1) - noise; 

    P1 = inv(inv(Po) + A'*A/R);
    
    Kk = P1*A'/R;
    
    Xk = Xk_1 + Kk*(y-A*Xk_1);

    Po = P1;

%     Vec_k(1:end-1,:) = Vec_k(2:end,:) 
%     Vec_k(end,:) = Xk';
    
    x1(i+1) = Xk(1);

    x2(i+1) = Xk(2);

    Xk_1 = Xk;
end 

    figure(1)
    plot(x1)
    hold on
    plot(x2)
    hold on

timeelapsed = toc;




% clc 
% close all
% clear all
%  
% figure(1)
% axis([-1 1 -1 1])
% grid on
% hold on
% X = linspace(-1,1,100)'
% Xk_1 = rand(2,1)
% Ar = [X ones(size(X))];
% Y = Ar*Xk_1
% h = plot(X,Y)
% 
% figure(2)
% Vec_k = zeros(20,2)
% Po = eye(2)*6000;
% 
% while(1)
%     figure(1)
%     [x,y] = ginput(1)
%     plot(x,y,'*r','LineWidth',3)
%     A = [x 1]
%     b = y
%     P1 = Po-(Po*A'*A*Po)/(1+A*Po*A')
%     Xk = Xk_1 + (P1*A')*(b-A*Xk_1)
%     Po = P1;
%     Vec_k(1:end-1,:) = Vec_k(2:end,:) 
%     Vec_k(end,:) = Xk';
%     figure(2)
%     plot(Vec_k)
%     Ar = [X ones(size(X))];
%     Y = Ar*Xk
%     delete(h)
%     figure(1)
%     h = plot(X,Y)
%     Xk_1 = Xk
% end 




