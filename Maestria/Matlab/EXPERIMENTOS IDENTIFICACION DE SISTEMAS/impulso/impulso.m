clear all;
cla
clc;
load backup.lvm;
load escalonI.lvm;

tiempo = escalonI(:,1);
sensor1 = escalonI(:,2);


control = backup(:,2);

figure(1)

plot(tiempo,20*sensor1,'b','linewidth',3);
hold on
plot(tiempo,control,'r','linewidth',3);



title('Voltaje');
xlabel('TIEMPO [seg]');
ylabel('Voltaje ');

grid on; 