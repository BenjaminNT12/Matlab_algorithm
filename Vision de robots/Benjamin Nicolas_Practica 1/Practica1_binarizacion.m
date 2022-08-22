% 1.Sustracción y binarización
% Antes de realizar el análisis de una imagen casi siempre conviene 
% acondicionarlamediante diversas operaciones de procesamiento de imágenes. 
% Aquí, mediante la sustracción del fondo se pretende compensar una
% iluminación deficiente que produce un gradiente de brillo espacial que 
% se traduce en zonas de contraste no homogéneo que impide a su vez la 
% binarización con base en un umbral global.

clc
clear
close all

[X,cmap]        = imread('son1.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
grayIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('son2.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
grayIm_2        = rgb2gray(im_2);

%% 
i)Obtener el histograma de la imagen (son1), escoger un umbral y binarizar la imagen.

BWI1            = im2bw(grayIm_1, 100/255);

figure('name','Resultado')
subplot(1,2,1), imshow(BWI1);
subplot(1,2,2), imhist(grayIm_1);

%%
% ii)Restarle a la imagen original (son1) la imagen del fondo (son2).

img           = imcomplement(imsubtract(im_2, im_1))

figure('name','Resultado')
subplot(1,3,1), imshow(im_1);
subplot(1,3,2), imshow(im_2);
subplot(1,3,3), imshow(img);


%%
% 
% iii)Obtener el histograma de la imagen de diferencia, escoger un umbral y binarizar
% 
img             = imcomplement(imsubtract(im_2, im_1))
gIm_3           = rgb2gray(img);
BWI3            = im2bw(gIm_3, 232/255);

figure('name','Resultado')
subplot(1,3,1), imshow(img);
subplot(1,3,2), imhist(gIm_3);
subplot(1,3,3), imshow(BWI3);
