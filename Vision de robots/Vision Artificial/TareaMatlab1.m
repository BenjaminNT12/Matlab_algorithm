clear all
clc
close all

img = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\SANAS\Vision Artificial\Tareas\Notredame1.png');

figure, imshow(img)

circ = drawcircle('Center',[600,600],'Radius',120);

BW = createMask(circ); 

figure, imshow(BW)

uintBW = im2uint8(BW)

suma = bitand(img,uintBW)

not = not(BW)
black_circle = bitand(im2uint8(not),img)

black_circle4 = bitcmp(bitand(bitcmp(black_circle),bitcmp(im2uint8(suma)*1.5)))



figure(3)
subplot (3,2,1)
imshow(img)
title('Imagen original')
subplot (3,2,2)
imshow(BW)
title('Máscara circular')
subplot (3,2,3)
imshow(suma)
title('Operación bitwise e Imagen + Máscara')
subplot (3,2,4)
imshow(not)
title('Operación NOT(Máscara)')
subplot (3,2,5)
imshow(black_circle)
title('Operación bitwise and NOT(Máscara) + Imágen original')
subplot (3,2,6)
imshow(black_circle4)
title('Operación bitwise and con el elemento del circulo resaltado al 50%')
