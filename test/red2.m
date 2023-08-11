clear all
close all
clc

t = [0:0.05:30];
%t = [-pi/2:0.01:pi/2];
y = sin(t);    %función a aproximar
c=[-0.5 -0.25 0 0.25 0.5]; %cij
b=[0.2 0.2 0.2 0.2 0.2]'; %bj
w = ones(5,1);
eta = 0.1;   %tasa de entrenamiento 
inc = 1;
%yNN = 2;
%h=zeros(5,1); %hj

%for k=1:30  % k número de etapas
    for i=1:length(t)
        for j=1:length(c)
            h(j,1) = exp(- norm(y(i)- c(:,j))^2/ (2*b(j)*b(j))); %Función de activación
        end

    yNN(i) = w'*h;
    
%     w = w + eta*(y(i) - yNN(i))*h;  % Actualizacion de pesos
%     W(inc,:) = w;
%     inc = inc+1;
    h1(i)=h(1);
    h2(i)=h(2,:);
    h3(i)=h(3,:);
    h4(i)=h(4,:);
    h5(i)=h(5,:);
    end
    %E(k) = inv(2)*norm(y-yNN)^2; %error de etapa
%end

figure(1)
plot(t, y, t, yNN)
legend('y', 'y_{NN}')
xlabel('tiempo [s]')
ylabel('y')
%figure(2)
% plot(W)
% title('Pesos')
% figure(3)
% plot(E)
% title('Error de entrenamiento')
figure(4)
plot(y,h1)
hold on
plot(y,h2)
hold on 
plot(y,h3)
hold on
plot(y,h4)
hold on
plot(y,h5)
xlabel('x')
ylabel('h_{j}')
legend('h1', 'h2', 'h3', 'h4', 'h5')