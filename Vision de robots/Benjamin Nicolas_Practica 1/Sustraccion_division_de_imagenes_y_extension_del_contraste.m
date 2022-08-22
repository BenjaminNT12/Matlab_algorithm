% 5. Sustracción, división de imágenes y extensión del contraste
% 
% Una manera de obtener la diferencia entre dos imágenes consiste en 
% aplicar la operación aritmética de sustracción.

clc
clear
close all

[X,cmap]        = imread('scr1.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
grayIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('scr2.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
grayIm_2        = rgb2gray(im_2);

%%
% 
% i) Hacer la sustracción entre las imágenes (scr1) y (scr2). Como el resultado 
% aparece muy obscuro deberá aplicarse una expansión del contraste mediante 
% una función monótona creciente (función lineal a tramos) mencionado en 
% clase.
% 
% 
img           = imsubtract(im_2, im_1)
gImg          = rgb2gray(img);
nImg          = histeq(gImg)

figure('name','Resultado')
subplot(1,4,1), imshow(im_1);
subplot(1,4,2), imshow(im_2);
subplot(1,4,3), imshow(img);
subplot(1,4,4), imshow(nImg);
figure('name','Histograma')
subplot(1,2,1), imhist(gImg);
subplot(1,2,2), imhist(nImg);


%%
% 
% ii) Hacer la división entre las imágenes (scr1) y (scr2). Aplicar aquí 
% también el algoritmo de extensión del contraste para poder visualizar el resultado.

% 
img           = imdivide(im_2, im_1)
gImg          = rgb2gray(img);
nImg          = histeq(gImg)

figure('name','Resultado')

subplot(1,4,1), imshow(im_1);
subplot(1,4,2), imshow(im_2);
subplot(1,4,3), imshow(img);
subplot(1,4,4), imshow(nImg);
figure('name','Histograma')
subplot(1,2,1), imhist(gImg);
subplot(1,2,2), imhist(nImg);


%%
% 
% iii) Hacer la ecualización del histograma de la imagen obtenida.
   

img           = imdivide(im_2, im_1)
gImg          = rgb2gray(img);
nImg          = histeq(gImg)

figure('name','Resultado')

subplot(1,4,1), imshow(im_1);
subplot(1,4,2), imshow(im_2);
subplot(1,4,3), imshow(img);
subplot(1,4,4), imshow(nImg);
figure('name','Histograma')
subplot(1,2,1), imhist(gImg);
subplot(1,2,2), imhist(nImg);












