close all 
clear all
clc
%% Implementación del algoritmo de Sauvola para la binarización de inamgenes
% x=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.png');     %cargar la imagen original
x=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');     %cargar la imagen original
% Ahora redimensionamos la imagen 

size(x);
x = imresize(x,[500 800]);
figure(1)
imshow(x);

map = hsv(256);
rgbImage = ind2rgb(x, map); 
z = rgb2hsv(rgbImage);       %extraer el valor de la parte HSV 
v = z(:,:,3);
v = imadjust(v);

%ahora encontramos la mean y standard deviation requerido para el algoritmo sauvola

m = mean(v(:))
s = std(v(:))
k = -.4;
value = m+ k*s;
temp = v;

% implementación del algoritmo sauvola:

val2 = m*(1+.1*((s/128)-1));
t2 = v;
for p=1:1:500
for q=1:1:800
    pixel=t2(p,q);
    if(pixel>value)
        t2(p,q)=1;
    else
        t2(p,q)=0;
    end
end

end

figure(2);
imshow(t2);
title('resultado por sauvola');
