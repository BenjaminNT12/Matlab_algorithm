clc
clear all
close all


%%i)Haga la ecualización del histograma de la imagen (step2line)

im = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');
imagen_equa=histeq(im);


%Histograma de la imagen original
figure
subplot(1,2,1)
imshow(im), title('Imagen original');
subplot(1,2,2), title('Histograma imagen original');
imhist(im)


%Ecualización de la imagen
figure
subplot(1,2,1)
imshow(imagen_equa), title('Imagen ecualizada ');
subplot(1,2,2)
imhist(imagen_equa), title('Histograma imagen ecualizada');

%%ii)Obtenga el histograma de la imagen de referencia (wdg2) e impóngalo a la imagen (step2line)

im2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg2.jpg');

%Histograma de la imagen wdg2
figure
subplot(1,2,1)
imshow(im2), title('Imagen original');
subplot(1,2,2)
imhist(im2), title('Histograma imagen original');

im3 = histeq(im2,50);

figure
subplot(1,2,1)
imshow(im3), title('Imagen ecualizada');
subplot(1,2,2)
imhist(im3), title('Histograma imagen ecualizada');

%%iii)Imponga a la imagen (step2line) el histograma de la imagen de referencia (robot
%original)
close all 
clear all 
clc
im4=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\robot original.bmp');


figure
subplot(1,2,1)
imshow(im4), title('Imagen original');
subplot(1,2,2)
imhist(im4), title('Histograma imagen original');

im5 = histeq(im4,75);

figure
subplot(1,2,1)
imshow(im5), title('Imagen ecualizada');
subplot(1,2,2)
imhist(im5), title('Histograma imagen ecualizada');

