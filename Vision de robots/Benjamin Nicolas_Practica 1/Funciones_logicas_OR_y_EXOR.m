%% 7. Funciones lógicas OR y EXOR
% Sea la imagen original (wdg2) y la imagen de su histograma (wdg2hst1). 
% El problema consiste en "encimar" sobre la imagen original la imagen de 
% su histograma de modo que quede en la esquina inferior izquierda.
%%

clc
clear
close all

[X,cmap]        = imread('wdg2.gif');
im_1            = ind2rgb(X,cmap);
im_1            = uint8(im_1*256);
grayIm_1        = rgb2gray(im_1);

[X_2,cmap_2]    = imread('wdg2hst1.gif');
im_2            = ind2rgb(X_2,cmap_2);
im_2            = uint8(im_2*256);
grayIm_2        = rgb2gray(im_2);
% 
%     %%
% % i) Sin cambiar el tamaño de la imagen del histograma completar con 
% % píxeles de color negro (por su izquierda y por arriba) hasta dejarla 
% % del tamaño de la imagen original


[M,N,C] = size(im_1)
[M1,N1,C1] = size(im_2)

V = M-M1
H = N-N1

L1 = zeros(V, N)
L2 = zeros(M1, H)
a = [L2 grayIm_2]

imgC = [L1 ; a]

figure('name','Completa') ,imshow(imgC);



%% ii) Encimar la imagen del histograma sobre la imagen original mediante la operación lógica
%OR entre ambas
% 
C = bitor(im_1, imgC)
figure('name','Completa OR') ,imshow(C);

%% 
% 
% iii) Encimar la imagen del histograma sobre la imagen original mediante la operación lógica EXOR entre ambas.

D = bitxor(im_1, imgC)
figure('name','Completa OR') ,imshow(D);


