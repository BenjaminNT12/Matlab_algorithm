clc
close all
clear

% Definir los puntos del hexágono
theta = 0:pi/3:2*pi;
x = [cos(theta), 2];  % Agregar un séptimo punto en el origen
y = [sin(theta), 0];  % Agregar un séptimo punto en y=5

% Crear la figura
figure

% Graficar los puntos rojos más grandes
plot(x, y, 'o', 'MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10)
hold on

% Conectar todos los puntos con líneas azules más gruesas
for i = 1:length(x)-1  % Excluir el último punto
    for j = i+1:3:length(x)-1  % Incluir todos los puntos después del i-ésimo
        plot([x(i), x(j)], [y(i), y(j)], '-', 'Color', '#0072BD', 'LineWidth', 2)
    end
end

plot([x(1), x(end)], [y(1), y(end)], '-', 'Color', '#0072BD', 'LineWidth', 2)

% Añadir etiquetas a los puntos
for i = 1:length(x)-2
    text(x(i), y(i)+0.09, ['V', num2str(i)], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
end
text(x(end), y(end), 'V7', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')

% Ajustar los ejes para que el hexágono se vea bien
axis equal

% Establecer los límites de los ejes
xlim([-1.5, 2.5])
ylim([-1.5, 1.5])