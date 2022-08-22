clear all;
cla
clc;
load salida.lvm;
load lecturatemperatura.lvm;

tiempo = lecturatemperatura(:,1);
sensor1 = lecturatemperatura(:,2);


control = 20*salida(:,2);

figure(1)

plot(tiempo,sensor1,'b','linewidth',3);
hold on
plot(tiempo,control,'r','linewidth',3);



title('Voltaje');
xlabel('TIEMPO [seg]');
ylabel('Voltaje ');

grid on; 