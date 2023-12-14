% Abre el archivo "datos.txt" para lectura ('r')
fid = fopen('control_2023-12-08_14-47.txt', 'r');

% Lee los datos del archivo. La cadena de formato especifica que cada línea debe tener
% la forma 'yaw: %f yaw Deseada: %f Control: %f Error: %f', donde %f es un número en punto flotante.
% textscan devuelve un cell array donde cada elemento es un array de los números leídos para cada %f.
data = textscan(fid, 'yaw: %f yaw Deseada: %f Control: %f Error: %f');

% Cierra el archivo
fclose(fid);

% Extrae los datos del cell array. data{1} contiene todos los números que se leyeron para el primer %f,
% data{2} para el segundo %f, y así sucesivamente.
yaw = data{1};
yawDeseada = data{2};
control = data{3};
error = data{4};

% Crea una nueva figura
figure;

% Plotea yaw
subplot(2,2,1);
plot(yaw);
title('Yaw');

% Plotea yawDeseada
subplot(2,2,2);
plot(yawDeseada);
title('Yaw Deseada');

% Plotea control
subplot(2,2,3);
plot(control);
title('Control');

% Plotea error
subplot(2,2,4);
plot(error);
title('Error');