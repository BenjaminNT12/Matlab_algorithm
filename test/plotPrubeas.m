% Obtiene una lista de todos los archivos en el directorio
files = dir('~/Github/Matlab_algorithm/Pruebas/Alberca/Control/secuencia7/*.txt');

% Itera sobre cada archivo
for file = files'
    % Abre el archivo en modo lectura
    fid = fopen(fullfile(file.folder, file.name), 'r');
    data = textscan(fid, 'yaw: %f yaw Deseada: %f Control: %f Error: %f');  % Lee los valores numéricos
    fclose(fid);  % Cierra el archivo

    % Extrae los datos
    yaw = data{1};
    yawDeseada = data{2};
    control = data{3};
    error = data{4};

    % Grafica los datos
    figure;

    subplot(2, 2, 1);
    plot(yaw);
    title('Yaw');

    subplot(2, 2, 2);
    plot(yaw, 'b'); hold on;
    plot(yawDeseada, 'r--');
    hold off;
    title('Yaw y Yaw Deseada');
    legend('Yaw', 'Yaw Deseada');

    subplot(2, 2, 3);
    plot(control);
    title('Control');

    subplot(2, 2, 4);
    plot(error);
    title('Error');
end