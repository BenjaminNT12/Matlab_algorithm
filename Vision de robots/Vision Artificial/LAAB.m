clc
clear all
close all

I = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.png'); % cargar imagen 
% I = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.png)';

figure,imshow(I), title('Imagen original');
figure,imhist(I), title('Histograma de la imagen');
T=110;  %Valor de thresholding
It=im2bw(I,T/225);
figure,imshow(It), title('Imagen binarizada');

%Aplicando adaptación local automática binaria

it3=blkproc(I,[15 15], @adaptt);
figure,imshow(it3), title('Imagen con adaptación automática binaria');