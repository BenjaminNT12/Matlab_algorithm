close all
clear all
clc
%% 6 Binzarización
%i)Obtener el histograma de las imágenes (wdg3, step2line)
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.jpg');
A=im2gray(img1);
img2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');
B=im2gray(img2);
figure
subplot(2,2,1); imshow(A); title('Imagen original')
subplot(2,2,2); imshow(B); title('Imagen original')
subplot(2,2,3); imhist(A); title('Histograma')
subplot(2,2,4); imhist(B); title('Histograma')

%ii)Binarizar estas imágenes utilizando dos umbrales diferentes (80 y 120 respectivamente)
%y comparar los resultados
BW1=imbinarize(A,.80);
BW2=imbinarize(B,.120);
% figure(2); imshowpair(A,BW1,'montage')
% figure(3); imshowpair(B,BW2,'montage')
figure
subplot(2,2,1); imshow(A); title('Imagen original')
subplot(2,2,2); imshow(B); title('Imagen binarizada')
subplot(2,2,3); imshow(BW1); title('Imagen original')
subplot(2,2,4); imshow(BW2); title('Imagen binarizada')

%% iv) Binarización por el método del Tríangulo 
%%%%%%%%%%%Para determinar el umbral adecuado mediante el método del
%triangulo, se deben determinar el valor máximo de la
%probabilidad Pmax y mímino Pmin de la gráfica del histograma. El
%umbral se determina mediante otra línea recta la cual debe cortar
%perpendicular a la primera y rodear el histograma hasta
%encontrar la máxima distancia d. El punto donde la recta toca el
%histograma corresponde a umbral deseado T%%%%%%%%%%%%%%%%%%
clear all 
close all 
clc
%
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.jpg');
A=im2gray(img1);
img2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');
B=im2gray(img2);
figure
subplot(2,2,1); imshow(A); title('Imagen original wdg3')
subplot(2,2,2); imshow(B); title('Imagen original step2line')
subplot(2,2,3); imhist(A); title('Histograma wdg3')
subplot(2,2,4); imhist(B); title('Histograma step2line')

BW1=imbinarize(A,0.88);
BW2=imbinarize(B,0.496);

figure
subplot(2,2,1); imshow(A); title('Imagen original')
subplot(2,2,2); imshow(B); title('Imagen binarizada')
subplot(2,2,3); imshow(BW1); title('Imagen original')
subplot(2,2,4); imshow(BW2); title('Imagen binarizada')




