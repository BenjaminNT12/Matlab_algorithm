%%Funciones lógicas. 
%

clc
clear
close all

i) Considérese un par de imágenes binarias denominadas (circ) y (cruz), 
ambas imágenes de síntesis. Aplicar entre ellas las siguientes 
operaciones booleanas: OR, NOR, AND, NAND, EXOR y EXNOR.


im_1        = imread('circ.bmp');
% im_1            = ind2rgb(X,cmap);
% im_1            = uint8(im_1*256);
gIm_1           = rgb2gray(im_1);

im_2    = imread('cruz.bmp');
% im_2            = ind2rgb(X_2,cmap_2);
% im_2            = uint8(im_2*256);
gIm_2           = rgb2gray(im_2);

BWI1            = im2bw(gIm_1);
BWI2            = im2bw(gIm_2);

imOR            = bitor(BWI1,BWI2)
imNOR           = ~(bitor(BWI1,BWI2))
imAND           = BWI1 & BWI2
imXOR           =  xor(BWI1, BWI2)
imXNOR          = ~xor(BWI1, BWI2)


figure('name','Operadores')

subplot(5,3,1), imshow(BWI1);
subplot(5,3,2), imshow(BWI2);
subplot(5,3,3), imshow(imOR);

subplot(5,3,4), imshow(BWI1);
subplot(5,3,5), imshow(BWI2);
subplot(5,3,6), imshow(imNOR);

subplot(5,3,7), imshow(BWI1);
subplot(5,3,8), imshow(BWI2);
subplot(5,3,9), imshow(imAND);

subplot(5,3,10), imshow(BWI1);
subplot(5,3,11), imshow(BWI2);
subplot(5,3,12), imshow(imXOR);

subplot(5,3,13), imshow(BWI1);
subplot(5,3,14), imshow(BWI2);
subplot(5,3,15), imshow(imXNOR);


% ii) Repetir el inciso previo con el complemento de dichas imágenes: NOT(circ) y NOT(cruz)

im_1            = imread('circ.bmp');
gIm_1           = rgb2gray(im_1);

im_2            = imread('cruz.bmp');
gIm_2           = rgb2gray(im_2);

BWI1            = ~im2bw(gIm_1);
BWI2            = ~im2bw(gIm_2);

imOR            = bitor(BWI1,BWI2)
imNOR           = ~(bitor(BWI1,BWI2))
imAND           = BWI1 & BWI2
imXOR           =  xor(BWI1, BWI2)
imXNOR          = ~xor(BWI1, BWI2)


figure('name','Operadores')

subplot(5,3,1), imshow(BWI1);
subplot(5,3,2), imshow(BWI2);
subplot(5,3,3), imshow(imOR);

subplot(5,3,4), imshow(BWI1);
subplot(5,3,5), imshow(BWI2);
subplot(5,3,6), imshow(imNOR);

subplot(5,3,7), imshow(BWI1);
subplot(5,3,8), imshow(BWI2);
subplot(5,3,9), imshow(imAND);

subplot(5,3,10), imshow(BWI1);
subplot(5,3,11), imshow(BWI2);
subplot(5,3,12), imshow(imXOR);

subplot(5,3,13), imshow(BWI1);
subplot(5,3,14), imshow(BWI2);
subplot(5,3,15), imshow(imXNOR);












