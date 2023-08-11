clear;
close all;
clc;

t = 0:0.01:10;
% vertex number
n = 8;
l = 18;
m = 3;

x = zeros(n,2,length(t));
u = zeros(n,length(t));
for i = 1:length(t)-1
    % x(:,:,i)
    u(:,i) = [1;2;3;4;5;6;7;8];
    
    [tt, xx] = ode45(@system, [t(i) t(i+1)], x(:,:,i), [], u(:,i));
    % xx(end,:)
end
figure(1);
plot(t, x(:,1,:));
figure(2);
plot(t, x(:,2,:));
% plot(t, x(2,:));