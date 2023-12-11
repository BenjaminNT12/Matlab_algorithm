%Programa de materiales compuestos
%Utilizando el metodo de matrices de rigidez [Q], matriz de flexibilidad [s] para un material compuesto.

%Seccion de limpieza
clc
clear  
close all

%Seccion de variables colocadas por el ususario
El = input('Ingrese el valor de El: ');
Et = input('Ingrese el valor de Et: ');
vlt = input('Ingrese el valor de vlt: ');
vtl = input('Ingrese el valor de vtl: ');
Glt = input('Ingrese el valor de Glt: ');
C = input('Ingrese el numero de capas: ');

s = [1/El -vtl/Et 0; 
        -vlt/El 1/Et 0;
         0 0 1/Glt];

sInv = inv(s);
Qbar = zeros(3,3,C);
for i = 1:C
        %Seccion de variables colocadas por el ususario
        fprintf('Ingrese el valor de "t" para la capa: %d',i );
        t(i) = input(':');
        fprintf('Ingrese el valor de theta para la capa %d ',i );
        theta(i) = input(':');
        T(:,:,i) = [(cosd(theta(i))).^2 (sind(theta(i))).^2 2.*cosd(theta(i)).*sind(theta(i));
                  (sind(theta(i))).^2 (cosd(theta(i))).^2 -2.*cosd(theta(i)).*sind(theta(i));
                  -sind(theta(i)).*cosd(theta(i)) sind(theta(i)).*cosd(theta(i)) (cosd(theta(i))).^2 - (sind(theta(i))).^2];
        Tinv(:,:,i) = inv(T(:,:,i));
        Q(:,:,i) = [(cosd(theta(i))).^2 (sind(theta(i))).^2 -cosd(theta(i)).*sind(theta(i));
                  (sind(theta(i))).^2 (cosd(theta(i))).^2 cosd(theta(i)).*sind(theta(i));
                  2.*sind(theta(i)).*cosd(theta(i)) -2.*sind(theta(i)).*cosd(theta(i)) (cosd(theta(i))).^2 - (sind(theta(i))).^2];
        Qinv(:,:,i) = inv(Q(:,:,i));
        fprintf('El valor de Q es para la capa: %d es:' ,i);
        Qt(:,:,i) = T(:,:,i)*sInv*Qinv(:,:,i);
        Qt(:,:,i)
        Qbar(:,:,i+1) = Qt(:,:,i) + Qbar(:,:,i);
end

fprintf('La sumatoria de de Q es desde la capa 1 a %d es:' ,C);
Qbar(:,:,C+1)

%Seccion de variables colocadas por el ususario
