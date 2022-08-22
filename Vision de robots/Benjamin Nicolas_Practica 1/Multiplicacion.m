%% 
% Multiplicacion
% 
% Otra manera de utilizar el rango dinámico de una imagen de manera más 
% eficiente es mediante la multiplicación por una constante, técnica 
% conocida como Escalado. Aplicar esta técnica a una imagen con poco 
% contraste (robot original)
% 
%
% i) Hacer el Escalado por una constante C=2, C=3, C=4 y C=5
%

clc
clear
close all

% i) Haga la ecualización del histograma de las imágenes (robot original, wdg2, phn1)
%

[X,cmap]        = imread('robot_original.bmp');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

figure('name','Escalado')

subplot(2,2,1), imshow(im_1*2);
subplot(2,2,2), imshow(im_1*3);
subplot(2,2,3), imshow(im_1*4);
subplot(2,2,4), imshow(im_1*5);
