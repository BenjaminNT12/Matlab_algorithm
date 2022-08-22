clear all 
close all
clc
%% 1. Sustracción y binarización
%i)Obtener el histograma de la imagen (son1), escoger un umbral y binarizar
%la imagen. 
im=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\son1.gif');
gray=im2gray(im);
subplot(1,3,1); imshow(im); title('Imagen original');
subplot(1,3,2); imshow(gray); title('Imagen a escala de Grises');
subplot(1,3,3); imhist(gray); title('Histograma');
%figure; imhist(gray)
bw=im2bw(gray, 0.45);    %binarización de la imagen
subplot(2,3,1); imshow(gray); title('Imagen original')
subplot(2,3,2); imshow(bw); title('Imagen binarizada')
%%
clear all 
close all
clc
%ii)Restarle a la imagen original (son1) la imagen del fondo (son2).
im1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\son1.gif');
% figure(1), imshow(im1)
im2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\son2.gif');
% figure(2), imshow(im2)
resti=imsubtract(im1,im2);
% figure(3), imshow(resti)
subplot(2,3,1); imshow(im1); title('Imagen original son1')
subplot(2,3,2); imshow(im2); title('Imagen original son2')
subplot(2,3,3); imshow(resti); title('Imagen de la resta de son1-son2')
%%
%iii)Obtener el histograma de la imagen de diferencia, escoger un umbral y
%binarizar. 
% figure(4), imhist(resti)
level = mean(resti(:))/double(max(resti(:)));
bw=im2bw(resti,0.00053);
% figure(5), imshow(bw)
subplot(2,3,1); imshow(resti); title('Imagen de la resta de son1-son2')
subplot(2,3,2); imhist(resti); title('Histogrma de la resta de son1-son2')
subplot(2,3,3); imshow(bw); title('Imagen binarizada de resta de son1-son2')

%iv)comparar los resultados obtenidos 

