% Definir tiempo
t = 0:0.01:10;

% Generar ruido
ruido = noise(length(t))+pi*sin(t);

% Graficar ruido
plot(t, ruido);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Ruido generado por la función noise');