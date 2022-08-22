%%
% 4) Funcione logica EXOR
%
% Obtener la imagen de los elementos que no sufren modificación en su ubicación, 
% o bien de los que cambian, mediante las operaciones lógicas AND y EXOR. 
% Primero hacerlo sobre las imágenes multinivel (no son binarias), es decir, 
% aplicando la función lógica sobre palabras de ocho bits y luego sobre imágenes 
% binarizadas por umbralización.

clc
clear
close all

[X,cmap]        = imread('scr3.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
grayIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('scr4.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
grayIm_2        = rgb2gray(im_2);



%% 
% i) Aplicar la función lógica AND a las imágenes multinivel (scr3) y (scr4)
 
andIm           =  bitand(grayIm_1, grayIm_2);
subplot(1,3,1), imshow(grayIm_1)
subplot(1,3,2), imshow(grayIm_2)
subplot(1,3,3), imshow(andIm)

%% 
% ii) Aplicar la función lógica EXOR a esas mismas imágenes (scr3) y (scr4)

andIm           =  bitxor(grayIm_1, grayIm_2);

subplot(1,3,1), imshow(grayIm_1)
subplot(1,3,2), imshow(grayIm_2)
subplot(1,3,3), imshow(andIm)
 
%% 
% iii) Aplicar la función lógica AND a las imágenes multinivel  (scr3) y (scr4) 
% previamente binarizadas mediante un umbral elegido a ojo sobre el histograma 
% de dichas imágenes.

% figure('name','H1'), imhist(grayIm_1);
% figure('name','H2'), imhist(grayIm_2);;
% 
% 
% BWI1            = im2bw(grayIm_1,100/255);
% BWI2            = im2bw(grayIm_2,100/255);
% 
% andIm           =  bitand(BWI1, BWI2);
% 
% figure('name','Resultado')
% subplot(1,3,1), imshow(grayIm_1);
% subplot(1,3,2), imshow(grayIm_2);
% subplot(1,3,3), imshow(andIm);

%%
% iv) Aplicar la función lógica EXOR a las imágenes (scr3) y (scr4) previamente 
% binarizadas mediante un umbral elegido a ojo sobre el histograma de dichas imágenes.


figure('name','H1'), imhist(grayIm_1);
figure('name','H2'), imhist(grayIm_2);


BWI1            = im2bw(grayIm_1,160/255);
BWI2            = im2bw(grayIm_2,160/255);

andIm           =  bitxor(BWI1, BWI2);

figure('name','Resultado')
subplot(1,3,1), imshow(grayIm_1);
subplot(1,3,2), imshow(grayIm_2);
subplot(1,3,3), imshow(andIm);

