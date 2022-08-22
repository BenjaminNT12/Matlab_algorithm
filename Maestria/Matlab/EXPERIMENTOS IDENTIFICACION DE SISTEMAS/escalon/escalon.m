clear all;
cla
clc;
load escalon.lvm;
load temperatura.lvm;

tiempo = temperatura(:,1);
sensor1 = temperatura(:,2);


control = 30*escalon(:,2);

figure(1)

plot(tiempo,sensor1,'b','linewidth',3);
hold on
plot(tiempo,control,'r','linewidth',3);



title('Voltaje');
xlabel('TIEMPO [seg]');
ylabel('Voltaje ');

grid on; 