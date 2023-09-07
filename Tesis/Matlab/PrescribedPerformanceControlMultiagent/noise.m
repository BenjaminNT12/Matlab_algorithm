% Matlab: Escribe una funcion para generar ruido aleatorio de media 0 y varianza 1
%       de longitud N. Usa la funcion randn de Matlab. 
%       [X] = ruido(N)
%       X: Vector de ruido aleatorio
%       N: Longitud del vector
function [X] = noise(N)
    X = randn(1,N);
end
