% % Define la matriz que representa la adyacencia del gráfico
% A = [0 1 0 1; % Conexiones del nodo A
%      0 0 1 0; % Conexiones del nodo B
%      1 0 0 0; % Conexiones del nodo C
%      0 0 1 0]; % Conexiones del nodo D

% % Define un objeto digraph usando la matriz de adyacencia
% G = digraph(A);

% % Etiqueta los nodos
% G.Nodes.Name = {'V1' 'V2' 'V3' 'V4'}';

% % Enumera las aristas
% G.Edges.Edges = {'1', '2', '3', '4', '5'}';

% % Traza el gráfico con flechas más grandes, nombres de nodos más grandes y aristas enumeradas
% h = plot(G, 'ArrowSize', 15, 'NodeFontSize', 12, 'EdgeFontSize', 12 ,'MarkerSize', 10, 'NodeColor', '#D95319');
% % title('Grafo dirigido')
% xlabel('X')
% ylabel('Y')

% Crear una nueva figura
clear
close all
figure;

% Definir las posiciones de los vértices
v1 = [3 1];
v2 = [0  1];
v3 = [1 3];
v4 = [4 3];

drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0, 'MaxHeadSize', 0.3, varargin{:} );

hold on;
plot(v1(1), v1(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v2(1), v2(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v3(1), v3(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
plot(v4(1), v4(2), 'o','MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10);
% Dibujar las aristas
drawArrow([v1(1) v2(1)], [v1(2) v2(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v3(1) v1(1)], [v3(2) v1(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v3(1) v4(1)], [v3(2) v4(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v2(1) v3(1)], [v2(2) v3(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 
drawArrow([v1(1) v4(1)], [v1(2) v4(2)], 'Color', '#0072BD','LineWidth', 2);
hold on 

% Dibujar los vértices

% Añadir las etiquetas de los vértices
text(v1(1), v1(2), 'v1', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
text(v2(1), v2(2), 'v2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
text(v3(1), v3(2), 'v3', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
text(v4(1), v4(2), 'v4', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

% text(mean([v1(1) v3(1)]), mean([v1(2) v3(2)]), 'l_1', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
% text(mean([v1(1) v2(1)]), mean([v1(2) v2(2)]), 'l_2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
% text(mean([v3(1) v4(1)]), mean([v3(2) v4(2)]), 'l_3', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');

% Ajustar los límites de los ejes
xlim([-1 5]);
ylim([0 4]);


