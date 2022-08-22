%% 6. Binarización

% La binarización demanda la elección de un umbral que permita separar al 
% fondo del objeto. Existen varias maneras de elegir dicho umbral, de las 
% cuales la más simple consiste en elegir el valor de gris que separa un 
% histograma claramente bimodal en dos distribuciones gaussianas. El 
% problema aparece cuando el histograma no es bimodal como el de este 
% ejercicio, en donde existe un importante gradiente de luminosidad que 
% mantiene el contraste localmente pero de manera global se pierde.

clc
clear
close all

[X,cmap]        = imread('wdg3.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

[X_2,cmap_2]    = imread('step2line.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
gIm_2           = rgb2gray(im_2);

%% 
% i) Obtener el histograma de las imágenes (wdg3, step2line)

figure('name','Resultado')
subplot(1,2,1), imshow(im_1);
subplot(1,2,2), imshow(im_2);

figure('name','Histograma')
subplot(1,2,1), imhist(gIm_1);
subplot(1,2,2), imhist(gIm_2);


%%
% ii) Binarizar estas imágenes utilizando dos umbrales diferentes (80 y 120 
% respectivamente) y comparar los resultados
%

BWI1            = im2bw(gIm_1, 80/255);
BWI2            = im2bw(gIm_2, 120/255);


figure('name','Escala de grises')
subplot(1,2,1), imshow(im_1);
subplot(1,2,2), imshow(im_2);
figure('name','Binarizada ')
subplot(1,2,1), imshow(BWI1);
subplot(1,2,2), imshow(BWI2);


%% 
% 
% iii) Implementar las técnicas de binarización (Paper: Local Thresholding
% Techniques in Image Binarization), en donde se utiliza un umbral diferente 
% en cada subimagen (máscara) de n×n píxeles. Utilizar n = 5, 10 y 15.


%%
% iv) Aplicar las siguientes técnicas de binarización por umbralización del histograma: Ridler-Calvard, Triángulo y distribuciones simétricas.

Ridler-Calvard
[inp, BWI1]     = isodata(gIm_1)
[inp2, BWI2]    = isodata(gIm_2)

figure('name','Binarizacion Ridler-Calvard')
subplot(1,2,1), imshow(BWI1);
subplot(1,2,2), imshow(BWI2);

Triangulo
BWI1=imbinarize(gIm_1, 0.88);
BWI2=imbinarize(gIm_2, 0.496);

figure('name','Binarizacion Metodo Triangulo')
subplot(1,2,1), imshow(BWI1);
subplot(1,2,2), imshow(BWI2);











