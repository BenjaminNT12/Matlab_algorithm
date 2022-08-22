close all
clear all 
clc
%% 2. Ecualización del Histograma
%i)Ecualizar la imagen (bld1) usando la función cumulativa de toda la imagen
img=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\bld1.gif');
gris=im2gray(img);
E=histeq(gris,256); %ecualización de la imagen con n niveles
gris = im2gray(img);
subplot(2,2,1);imshow(gris); title('Imagen original');
subplot(2,2,2);imhist(gris); title('Histograma original');
subplot(2,2,3);imshow(E); title('Imagen ecuaclizada');
subplot(2,2,4);imhist(E); title('Histograma ecualizada de la imagen');
%%
%ii) Ecualizar la imagen (bld1) usando la función cumulativa de una parte de la imagen en la
%que no aparezca el cielo.
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\bld1Recortada.jpg');
gris=im2gray(img1);
E=histeq(gris,256); %ecualización de la imagen con n niveles

subplot(2,2,1);imshow(gris); title('Imagen original recortada');
subplot(2,2,2);imhist(gris); title('Histograma original');
subplot(2,2,3);imshow(E); title('Imagen recortada ecuaclizada');
subplot(2,2,4);imhist(E); title('Histograma ecualizada de la imagen');

%iii) Compare los resultados y coméntelos 

%% 3. Funciones lógicas AND y EXOR
%Funciones lógicas AND y EXOR
clear all;
close all;
clc;
 
img1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\pap1.gif'); %Leemos y guardamos la imagen 1
J=im2bw(img1); %Convertimos la imagen 1 a blanco y negro
img2=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\pap2.gif');%Leemos y guardamos la imagen 2
R=im2bw(img2); %Convertimos la imagen 2 a escala de grises
img3=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\pap3.gif');
T=im2bw(img3);
%i) Aplicar la función lógica AND a las imágenes (pap1) y (pap2)
A=and(J,R);
%ii) Aplicar la función lógica AND a las imágenes (pap1) y (pap3)
B=and(J,T); 
%iii) Aplicar la función lógica EXOR a las imágenes (pap1) y (pap2)
X=xor(J,R);
%iv) Aplicar la función lógica EXOR a las imágenes (pap1) y (pap3)
Z=xor(J,T);
%Mostramos los resultados
subplot(3,3,1), imshow(img1), title('pap1 original');
subplot(3,3,2), imshow(img2), title('pap2 original');
subplot(3,3,3), imshow(img3), title('pap3 original');
subplot(3,3,4), imshow(A), title('pap1 BW pap2 BW AND');
subplot(3,3,5), imshow(B), title('pap1 BW pap3 BW AND');
subplot(3,3,6), imshow(X), title('pap1 BW pap2 BW EXOR');
subplot(3,3,7), imshow(Z), title('pap1 BW pap3 BW EXOR');

%v) Compare los resultados y coméntelos 


