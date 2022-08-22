clear all
clc
close all

img = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\SANAS\Vision Artificial\Tareas\lena_color.png')
bwimg = im2gray(img)

figure, imshow(img)
figure, imshow(bwimg)

MN = size(img)

circ = drawcircle('Center',[MN(1)/2,MN(1)/2],'Radius',90);

BW = createMask(circ); 

figure, imshow(BW)

BWuint = im2uint8(BW)
lenacirc = bitand(img,BWuint)
BWdouble = double(BW)
imgdouble = double(img)
lenacirc2 = imgdouble.*BWdouble
lenacirc3 = uint8(lenacirc2)


figure, imshow(lenacirc)
figure, imshow(lenacirc3)
