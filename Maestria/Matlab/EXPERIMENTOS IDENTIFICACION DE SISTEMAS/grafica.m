clear all;
clc;
load escalon.lvm;
load temperatura.lvm;

load escalonImpulso.lvm;
load backup.lvm;

tiempo = temperatura(:,1);
sensor1 = temperatura(:,2);

tiempoI = backup(:,1);
sensor1Impulso = backup(:,2);

control = escalon(:,2);

figure(1)

plot(tiempo,sensor1,'b');
hold on
plot(tiempo,control,'r');
plot(tiempoI,sensor1Impulso,'r');


title('Voltaje');
xlabel('TIEMPO [seg]');
ylabel('Voltaje ');

grid on; 