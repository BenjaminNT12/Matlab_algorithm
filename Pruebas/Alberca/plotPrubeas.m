fid = fopen('~/Github/Matlab_algorithm/Pruebas/ControlBenjamin/datosAlberca_2023-12-14_13-35.txt', 'r');  % Abre el archivo en modo lectura
data = textscan(fid, 'yaw: %f Yaw vel: %f Yaw acc: %f yaw Deseada: %f Control: %f Error: %f');  % Lee los valores numéricos
fclose(fid);  % Cierra el archivo

% Extrae los datos
yaw = data{1};
yawVel = data{2};
yawAcc = data{3};
yawDeseada = data{4};
control = data{5};
error = data{6};

% Grafica los datos
figure;

subplot(3, 2, 1);
plot(yaw);
title('Yaw');

subplot(3, 2, 2);
plot(yawVel);
title('Yaw Velocity');

subplot(3, 2, 3);
plot(yawAcc);
title('Yaw Acceleration');

subplot(3, 2, 4);
plot(yaw, 'b'); hold on;
plot(yawDeseada, 'r--');
hold off;
title('Yaw y Yaw Deseada');
legend('Yaw', 'Yaw Deseada');

subplot(3, 2, 5);
plot(control);
title('Control');

subplot(3, 2, 6);
plot(error);
title('Error');