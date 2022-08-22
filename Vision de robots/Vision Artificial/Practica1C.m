close all 
clear all
clc

%% 4. Función lógica EXOR
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr3.jpg'); %Leemos y guardamos la imagen 1
J=im2bw(img1); %Convertimos la imagen 1 a blanco y negro
img2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr4.jpg');%Leemos y guardamos la imagen 2
R=im2bw(img2); %Convertimos la imagen 2 a escala de grises
%%i) Aplicar la función lógica AND a las imágenes multinivel (scr3) y (scr4)
A=and(J,R);
%%ii) Aplicar la función lógica EXOR a esas mismas imágenes (scr3) y (scr4).
B=xor(J,R); 
%%iii) Aplicar la función lógica AND a las imágenes multinivel (scr3) y (scr4) previamente
%binarizadas mediante un umbral elegido a ojo sobre el histograma de dichas imágenes.
figure(1)
imhist(img1), title('Histograma de scr3');
hold on 
figure(2)
imhist(img2), title('Histograma de scr4');
hold on 
% Binarización de la imagenes
imgbw1=im2bw(img1, 0.05);
imgbw2=im2bw(img2, 0.08);
C=xor(imgbw1, imgbw2);
%%iv) Aplicar la función lógica EXOR a las imágenes (scr3) y (scr4) previamente binarizadas
%mediante un umbral elegido a ojo sobre el histograma de dichas imágenes.
T=xor(imgbw1, imgbw2);
%Mostramos los resultados
% subplot(2,2,1), imshow(hist1), title('Histograma de scr3');
% subplot(2,2,2), imshow(hist2), title('Histograma de scr4');
figure(3)
subplot(2,3,1), imshow(img1), title('scr3 original');
subplot(2,3,2), imshow(img2), title('scr4 original');
subplot(2,3,3), imshow(A), title('scr3 y scr4 AND');
subplot(2,3,4), imshow(B), title('scr3 y scr4 EXOR');
subplot(2,3,5), imshow(C), title('scr3 BW y scr4 BW AND');
subplot(2,3,6), imshow(T), title('scr3 BW y scr4 BW EXOR');

%%v) Compare los resultados y coméntelos.


