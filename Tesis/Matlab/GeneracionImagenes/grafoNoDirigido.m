% Define las posiciones de los nodos
nodos = {'V1', 'V2', 'V3', 'V4'};
posiciones = [0 0; 0 1; 1 1; 1 0]; % Coordenadas [x y]

% Define las aristas entre los nodos
aristas = [1 2; % Arista de A a B
           1 4; % Arista de A a D
           2 3; % Arista de B a C
           3 4]; % Arista de C a D

% Dibuja el gráfico
figure;
gplot(aristas, posiciones, 'o-'); % Cambia el orden de los marcadores y las líneas
hold on; 

plot(posiciones(:,1), posiciones(:,2), 'o', 'MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319', 'MarkerSize', 10)
text(posiciones(:,1), posiciones(:,2), nodos, 'VerticalAlignment','bottom', ...
     'HorizontalAlignment','right', 'FontSize', 10);
     
hold off; 
axis equal;


axis equal;
xlim([-0.5 1.5]);
ylim([-0.5 1.5]);