close all
clear
% data = load('datos_pruebas_2024-05-20_15-40.txt');
% data = load('datos_pruebas_2024-05-20_15-51.txt');
% data = load('datos_pruebas_2024-05-20_16-04.txt');
% data = load('datos_pruebas_yaw_2024-05-20_16-23.txt');
data = load('datos_pruebas_yaw_2024-05-20_16-45.txt');

% Obtener el número de columnas
numColumns = size(data, 2);

% Crear una figura para cada columna

figure;
plot(rad2deg(data(:, 1)));
hold
plot(data(:, 4));
title(['yaw-yaw medida ']);

figure;
plot(data(:, 2));
title(['yaw vel ']);
figure;
plot(data(:, 3));
title(['control' ]);
