% Crear una nueva figura
clear
close all
figure;

% Definir las posiciones de los vértices
v1 = [-2 0];
v2 = [-1 -1];
v3 = [-1 1];
v4 = [-0 0];

drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0, 'MaxHeadSize', 0.5, varargin{:} );

hold on;
plot(v1(1), v1(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v2(1), v2(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v3(1), v3(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v4(1), v4(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
% Dibujar las aristas
drawArrow([v1(1) v2(1)], [v1(2) v2(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v1(1) v3(1)], [v1(2) v3(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v3(1) v4(1)], [v3(2) v4(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 

% Dibujar los vértices

% Añadir las etiquetas de los vértices
text(v1(1), v1(2), 'v1', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(v2(1), v2(2), 'v2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
text(v3(1), v3(2), 'v3', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
text(v4(1), v4(2), 'v4', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

text(mean([v1(1) v3(1)]), mean([v1(2) v3(2)]), 'l_1', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
text(mean([v1(1) v2(1)]), mean([v1(2) v2(2)]), 'l_2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
text(mean([v3(1) v4(1)]), mean([v3(2) v4(2)]), 'l_3', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');

% Ajustar los límites de los ejes
xlim([-2.5 0.5]);
ylim([-1.5 1.5]);