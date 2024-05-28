% Define las posiciones de los nodos
nodos = {'V1', 'V2', 'V3', 'V4', 'V5'};
posiciones = [0 0; 1 0; 1 1; 2 0; 2 1]; % Coordenadas [x y]

% Define las aristas entre los nodos
aristas = [1 2; % Arista de V1 a V2
           2 5; % Arista de V1 a V3
           2 3; % Arista de V2 a V3
           3 4; % Arista de V2 a V4
           3 5; % Arista de V3 a V5
           4 5]; % Arista de V4 a V5

% Dibuja el gráfico
figure;
hold on; % Mantiene el gráfico actual y añade más gráficos
% Dibuja las aristas con un grosor de línea de 2
for i = 1:size(aristas, 1)
    plot(posiciones(aristas(i,:), 1), posiciones(aristas(i,:), 2), 'LineWidth', 2, 'Color', '#0072BD');
end
% Dibuja los nodos
plot(posiciones(:,1), posiciones(:,2), 'o', 'MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10)
% Añade las etiquetas de los nodos
text(posiciones(:,1), posiciones(:,2), nodos, 'VerticalAlignment','bottom', ...
     'HorizontalAlignment','right', 'FontSize', 10);
hold off; % No añade más gráficos a esta figura
axis equal;
xlim([-0.5 2.5]);
ylim([-0.5 1.5]);
