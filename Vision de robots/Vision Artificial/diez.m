clc
clear all
close all
%% Multiplicación.
%Otra manera de utilizar el rango dinámico de una imagen de manera más eficiente es
%mediante la multiplicación por una constante, técnica conocida como Escalado. Aplicar esta
%técnica a una imagen con poco contraste (robot original)

im=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\robot original.bmp');

figure
subplot(1,2,1)
imshow(im), title('Imagen robot original ')
subplot(1,2,2)
imhist(im), title('Histogrma robot original')


im1=im(:,:,1);
im2=im1*2;
im3=im1*3;
im4=im1*4;
im5=im1*5;

figure
subplot(1,2,1)
imshow(im2), title('Imagen robot original con Escalado 2 ')
subplot(1,2,2)
imhist(im2), title('Histograma robot original con Escalado 2 ')

figure
subplot(1,2,1)
imshow(im3), title('Imagen robot original con Escalado 3 ')
subplot(1,2,2)
imhist(im3), title('Histograma robot original con Escalado 3 ')

figure
subplot(1,2,1)
imshow(im4), title('Histograma robot original con Escalado 4 ')
subplot(1,2,2)
imhist(im4), title('Histograma robot original con Escalado 4 ')

figure
subplot(1,2,1)
imshow(im5), title('Histograma robot original con Escalado 5 ')
subplot(1,2,2)
imhist(im5), title('Histograma robot original con Escalado 5 ')

