function voltaje = ADC_Serial(muestras)
delete(instrfind({'port'},{'COM13'}));
puerto=serial('COM13');
puerto.BaudRate = 115200;
fopen(puerto);
figure('Name','Grafica Voltaje');
title('Grafica Voltaje ADC');
xlabel('Numero de Muestras');
ylabel('Voltaje(V)');
grid off;
hold on;

while contador <=muestras 
    ylim([0 5.1]);
    xlim([0 contador+50]);
    valorADC=fscanf(puerto,'%d');
    voltaje(contador)=valorADC(1)*5/1024;
    plot(voltaje);
    drawnow;
    contador=contador+1;
end
fclose(puerto);
delete(puerto);