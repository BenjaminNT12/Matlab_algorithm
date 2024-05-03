% Datos proporcionados
data = [131.01526628603247, 50; 
        116.00431026474836, 100; 
        61.07372593840988, 150; 
        49.01020301937138, 200; 
        40.11234224026316, 250];

% Separar los datos en variables x e y
x = data(:, 2);
y = data(:, 1);

% Crear un modelo de regresión lineal
mdl = fitlm(x, y);

% Mostrar información del modelo
disp(mdl)

% Predecir valores y trazar la línea de regresión
y_pred = predict(mdl, x);
plot(x, y, 'o', x, y_pred, '-')
legend('Datos', 'Regresión lineal', 'Location', 'best')
xlabel('Distancia(cm)')
ylabel('Distancia(Pixeles)')