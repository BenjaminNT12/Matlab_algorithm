%% 5 Sustracción, división de imágenes y extensión del contraste

%%% i)Hacer la sustracción entre las imágenes (scr1) y (scr2). Como el resultado aparece muy
%obscuro deberá aplicarse una expansión del contraste mediante una función monótona
%creciente (función lineal a tramos) mencionado en clase.
% clear all 
% close all 
% clc
% 
% Img1=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr1.jpg");
% Img2=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr2.jpg");
% 
% subplot 121
% imshow(Img1)
% title('scr1')
% subplot 122
% imshow(Img2)
% title('scr2')
% hold on 
% Rest = Img1-Img2
% figure, imshow(Rest)
% title('Diferencia entre ambas imágenes')
% figure(3), imhist(Rest)
% hold on 
% RestD = rgb2gray(Rest);
% Resta5copia = rgb2gray(I5-I51);
% [M,N,C] = size(RestD)
% 
% for i=1:M
%     for j=1:N
%         if RestD(i,j)<3;
%             Restcopia(i,j) = 0;
%             
%         else 
%             Restcopia(i,j) = RestD(i,j)+100;
%         end
%     end
% end
% 
% 
% figure(4), imshow(uint8(Restcopia))
% title('Imagen contrastada')
% hold on 
% 
% 
% % ii)	Hacer la división entre las imágenes (scr1) y (scr2). Aplicar aquí también el algoritmo de extensión del contraste para poder visualizar el resultado. 
% 
% close all 
% clear all
% clc
% 
% I5=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr1.jpg");
% I51=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\scr2.jpg");
% 
% subplot 121
% imshow(I5)
% title('scr1')
% subplot 122
% imshow(I51)
% title('scr2')
% 
% Div = imdivide(I5,I51);
% figure, imshow(Div)
% title('División entre imágenes')
% 
% DivD = im2gray(Div);
% DivDcopia = rgb2gray(I5-I51);
% [M,N,C] = size(DivD)
% 
% for i=1:M
%     for j=1:N
%         if DivD(i,j)==0;
%             DivDcopia(i,j) = 0;
%             
%         else 
%             DivDcopia(i,j) = DivD(i,j)+200;
%         end
%     end
% end
% 
% 
% figure, imshow(uint8(DivDcopia))
% title('Imagen contrastada')
% 
% %iii)Hacer la ecualización del histograma de la imagen obtenida.
% figure, imhist(DivD)
% 
% Heq = histeq(DivD,256)
% figure, imshow(Heq)
% title('Imagen con histograma ecualizado')
% figure, imhist(Heq)

%%%%%%%%%%%%%%%

% %% 7 Funciones lógicas OR y EXOR
% clear all 
% close all
% clc
% %i) Sin cambiar el tamaño de la imagen del histograma completar con píxeles de color negro
% %(por su izquierda y por arriba) hasta dejarla del tamaño de la imagen original
% I=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg2.jpg');
% I1=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg2hst1.jpg');
% 
% subplot 121
% imshow(I)
% title('wdg2')
% subplot 122
% imshow(I1)
% title('wdg2hst1')
% 
% I1gray = im2gray(I1)
% 
% [M,N,C] = size(I)
% [M1,N1,C1] = size(I1)
% 
% V = M-M1
% H = N-N1
% 
% L1 = zeros(V,N)
% L2 = zeros(M1,H)
% a = [L2 I1gray]
% 
% imgcompletada = [L1;a]
% 
% figure, imshow(imgcompletada)
% title('imagen completada')
% 
% %%ii) Encimar la imagen del histograma sobre la imagen original mediante la operación lógica
% %OR entre ambas
% 
% C = bitor(I,imgcompletada)
% figure, imshow(C)
% title('OR')
% 
% D = bitxor(I,imgcompletada)
% figure, imshow(D)
% title('EXOR')



% %% 8. Funcion logica OR
% close all 
% clear all 
% clc
% %
% I=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\cir2.jpg");
% I1=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\cir3.jpg");
% 
% I2=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\cir2neg1.jpg");
% I3=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\cir3neg1.jpg");
% 
% subplot 121
% imshow(I)
% title('cir2')
% subplot 122
% imshow(I1)
% title('cir3')
% 
% Or1 = bitor(I,I1);
% figure, imshow(Or1)
% title('OR')
% 
% subplot 121
% imshow(I2)
% title('cir2neg1')
% subplot 122
% imshow(I3)
% title('cir3neg1')
% 
% Or2 = bitor(I2,I3);
% figure, imshow(Or2)
% title('OR')
% %%%%%%%%%%%%

%% 9 Manipulacion del histograma

% I=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg2.jpg");
% I1=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\robot original.png");
% I2=imread("C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\phn1.jpg");
% 
% 
% subplot 131
% imshow(I)
% title('wdg2')
% subplot 132
% imshow(I1)
% title('robot original')
% subplot 133
% imshow(I2)
% title('phn1')
% 
% figure, imhist(I)
% H1 = histeq(I,256)
% figure, imshow(H1)
% title('Imagen después de la ecualización')
% figure, imhist(H1)
% 
% figure, imhist(I1)
% H2 = histeq(I1,256)
% figure, imshow(H2)
% title('Imagen después de la ecualización')
% figure, imhist(H2)
% 
% figure, imhist(I2)
% H3 = histeq(I2,256)
% figure, imshow(H3)
% title('Imagen después de la ecualización')
% figure, imhist(H3)











