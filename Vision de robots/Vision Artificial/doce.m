
clear all;
close all;
clc;
%% 12. Funciones lógicas.

%I=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\circ.bmp'); %Leemos y guardamos la imagen 1
I=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\son1.gif');
J=im2bw(I); %Convertimos la imagen 1 a blanco y negro
%Y=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\cruz.bmp');%Leemos y guardamos la imagen 2
Y=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\son2.jpg');%Leemos y guardamos la imagen 2
R=im2bw(Y); %Convertimos la imagen 2 a escala de grises
 
%Operación NOT a ambas imagenes
NJ=not(J);
NR=not(R);

%Operación NOT a ambas imagenes
NI=not(I);
NY=not(Y);
 
%Operación AND
A=bitand(J,R);
 
%Operación OR
O=bitor(J,R); 


%Operación XOR
X=bitxor(J,R); 

%Operación NOR
OR = bitor (I,Y);
NOR = bitcmp (OR); 

%Operación NAND
AND = bitand (I,Y);
NAND = bitcmp (AND);

%Operación XNOR
XOR = bitxor (I,Y);
XNOR = bitcmp (XOR);

%Operación AND con NOT
A1=bitand(NJ,NR);
 
%Operación OR con NOT
O1=bitor(NJ,NR); 
 
%Operación XOR con NOT
X1=bitxor(NJ,NR); 

%Operación NOR con NOT
NOR1 = not (O1); 

%Operación NAND con NOT
NAND1 = not (A1);

%Operación XNOR con NOT
XNOR1 = not (X1);




%Mostramos los resultados
figure
subplot(3,3,1), imshow(J), title('Imagen gray');
subplot(3,3,2), imshow(R), title('Imagen gray'); 
subplot(3,3,3), imshow(NJ), title('Imagen gray NOT');
subplot(3,3,4), imshow(NR), title('Imagen gray NOT');


figure
subplot(3,3,1), imshow(A), title('AND a las imagenes gray ');
subplot(3,3,2), imshow(O), title('OR a las imagenes gray');
subplot(3,3,3), imshow(X), title('XOR a las imagenes gray');
subplot(3,3,4), imshow(NOR), title('NOR a las imagenes originales');
subplot(3,3,5), imshow(NAND), title('NAND a las imagenes originales');
subplot(3,3,6), imshow(XNOR), title('XNOR a las imagenes originales');

figure
subplot(3,3,1), imshow(A1), title('AND y NOT a imagenes gray ');
subplot(3,3,2), imshow(O1), title('OR y NOT a imagenes gray');
subplot(3,3,3), imshow(X1), title('AND y NOT a imagenes gray');
subplot(3,3,4), imshow(NOR1), title('XOR y NOT a imagenes gray');
subplot(3,3,5), imshow(NAND1), title('NAND y NOT a imagenes gray');
subplot(3,3,6), imshow(XNOR1), title('XNOR y NOT a imagenes gray');
