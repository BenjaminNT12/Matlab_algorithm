%% Manipulando el histograma se puede mejorar la calidad de una imagen en
% cuanto a su brillo y contraste. Para ilustrar esto considérese la imagen 
% (step2line)
% 
% 

clc
clear
close all

%%
% i) Haga la ecualización del histograma de la imagen (step2line)
% 
[X,cmap]        = imread('step2line.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

nImg_1          = histeq(gIm_1)
figure('name','Histograma')

subplot(1,3,1), imshow(im_1);
subplot(1,3,2), imhist(gIm_1);
subplot(1,3,3), imshow(nImg_1);

%%
% ii) Obtenga el histograma de la imagen de referencia (wdg2) e impóngalo   
% a la imagen (step2line)

[X,cmap]        = imread('wdg2.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

im3 = histeq(im_1,50);

subplot(1,2,1), imshow(im3);
subplot(1,2,2), imhist(im3);


