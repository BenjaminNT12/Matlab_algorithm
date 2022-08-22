close all 
clear all
clc
%%Implmentación del algotritmo de Sigh para la binarización 
%
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.png');     %cargar la imagen original
img2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');
bwim1=adaptivethreshold(img1,11,0.03,0);
bwim2=adaptivethreshold(img2,15,0.02,0);
subplot(2,2,1);
imshow(img1), title('imagen original');
subplot(2,2,2);
imshow(bwim1), title('imagen binarizada');
subplot(2,2,3);
imshow(img2), title('imagen original');
subplot(2,2,4);
imshow(bwim2), title('imagen binarizada');