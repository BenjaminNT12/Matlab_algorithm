% Define la función a integrar
f = @(x) x^2;

% Define el intervalo de integración
a = 0;
b = 1;

% Define el número de subintervalos
n = 10;

% Calcula el ancho del subintervalo
h = (b-a)/n;

% Calcula la suma de los trapecios
sum = 0;
for i = 1:n
    x = a + (i-1)*h;
    sum = sum + (f(x) + f(x+h))*h/2;
end

% Imprime el resultado de la integración
integral = sum

