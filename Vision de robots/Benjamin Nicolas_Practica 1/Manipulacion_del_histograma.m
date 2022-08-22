%% 
% 9. Manipulación del histograma.
% 

%%
% Manipulando el histograma se puede mejorar la calidad de una imagen en 
% cuanto a su brillo y contraste. Para ilustrar esto considérese una imagen 
% con poco contraste (robot original)

clc
clear
close all

% i) Haga la ecualización del histograma de las imágenes (robot original, wdg2, phn1)
%

[X,cmap]        = imread('robot_original.bmp');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

[X_2,cmap_2]    = imread('wdg2.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
gIm_2           = rgb2gray(im_2);

[X_3,cmap_3]    = imread('phn1.gif');
im_3            = ind2rgb(X_3,cmap_3);
im_3            = uint8(im_3*256);
gIm_3           = rgb2gray(im_3);

nImg_1          = histeq(gIm_1)
nImg_2          = histeq(gIm_2)
nImg_3          = histeq(gIm_3)


figure('name','Histograma')

subplot(3,3,1), imshow(im_1);
subplot(3,3,2), imhist(gIm_1);
subplot(3,3,3), imshow(nImg_1);


subplot(3,3,4), imshow(im_2);
subplot(3,3,5), imhist(gIm_2);
subplot(3,3,6), imshow(nImg_2);
    
subplot(3,3,7), imshow(im_3);
subplot(3,3,8), imhist(gIm_3);
subplot(3,3,9), imshow(nImg_3);

