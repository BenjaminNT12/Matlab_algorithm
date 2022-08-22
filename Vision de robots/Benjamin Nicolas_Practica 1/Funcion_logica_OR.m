%%
% 8. Función lógica OR  
%

clc
clear
close all
%% 
% i) Hacer la función lógica OR entre las imágenes (cir2) y (cir3)
% 

[X,cmap]        = imread('cir2.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('cir3.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
gIm_2        = rgb2gray(im_2);

BWI1            = im2bw(gIm_1, 80/255);
BWI2            = im2bw(gIm_2, 120/255);

imOR = BWI1|BWI2;
figure('name','Imagen OR')
subplot(1,3,1), imshow(im_1);
subplot(1,3,2), imshow(im_2);
subplot(1,3,3), imshow(imOR);

%%
% ii) Hacer la función lógica OR entre las imágenes (cir2neg1) y (cir3neg1) 
% que no son otra cosa que las imágenes negativas de las dos anteriores.
% 

[X,cmap]        = imread('cir2neg1.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
gIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('cir3neg1.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
gIm_2        = rgb2gray(im_2);

BWI1            = im2bw(gIm_1, 80/255);
BWI2            = im2bw(gIm_2, 120/255);

imOR = BWI1|BWI2;
figure('name','Imagen OR')
subplot(1,3,1), imshow(im_1);
subplot(1,3,2), imshow(im_2);
subplot(1,3,3), imshow(imOR);


     