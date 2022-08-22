%%
% Funciones logicas AND y EXOR

clc
clear
close all

[X,cmap]        = imread('pap1.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
grayIm_1        = rgb2gray(im_1);



[X_2,cmap_2]    = imread('pap2.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
grayIm_2        = rgb2gray(im_2);



[X_3,cmap_3]    = imread('pap3.gif');
im_3            = ind2rgb(X_3, cmap_3);
im_3            = uint8(im_3*256);
grayIm_3        = rgb2gray(im_3);


%% 
% i) Aplicar la función lógica AND a las imágenes (pap1) y (pap2)
 
% andIm           =  bitand(grayIm_1, grayIm_2);
% subplot(1,3,1), imshow(grayIm_1);
% subplot(1,3,2), imshow(grayIm_2);
% subplot(1,3,3), imshow(andIm)
%% 
% ii) Aplicar la función lógica AND a las imágenes (pap1) y (pap3)
 
andIm           =  bitand(grayIm_1, grayIm_3);
subplot(1,3,1), imshow(grayIm_1);
subplot(1,3,2), imshow(grayIm_3);
subplot(1,3,3), imshow(andIm)
%% 
% iii) Aplicar la función lógica EXOR a las imágenes (pap1) y (pap2)

andIm           =  bitxor(grayIm_1, grayIm_2);
subplot(1,3,1), imshow(grayIm_1);
subplot(1,3,2), imshow(grayIm_2);
subplot(1,3,3), imshow(andIm)
%% 
% iv) Aplicar la función lógica EXOR a las imágenes (pap1) y (pap3)

andIm           =  bitxor(grayIm_1, grayIm_3);
subplot(1,3,1), imshow(grayIm_1);
subplot(1,3,2), imshow(grayIm_3);
subplot(1,3,3), imshow(andIm)