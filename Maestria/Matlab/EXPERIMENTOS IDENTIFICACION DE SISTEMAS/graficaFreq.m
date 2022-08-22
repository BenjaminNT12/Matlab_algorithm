clear all;
clc;
load frecuencia.lvm;
load temperaturafrecuencia.lvm;

tiempo = frecuencia(:,1);
sensor1 = frecuencia(:,2);

figure(1)

plot(tiempo,sensor1,'b');
hold on


title('Voltaje');
xlabel('TIEMPO [seg]');
ylabel('Voltaje ');

grid on; 