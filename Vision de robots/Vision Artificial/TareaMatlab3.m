clear all
clc
close all

x = linspace(0,255,400);
xT = transpose(x)
X = repmat(xT,1,400)
Xuint = uint8(X)

x2 = linspace(255,0,400);
xT2 = transpose(x2)
X2 = repmat(xT2,1,400)
NormX2 = X2/255
figure, imshow(NormX2)

NormX = X/255
figure, imshow(NormX)

img = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\SANAS\Vision Artificial\Tareas\LenaColor.jpg')
figure, imshow(img)

imgdouble = double(img)

lenafMulti1 = ((NormX).*(imgdouble))
lenafMulti1 = uint8(lenafMulti1)
figure, imshow(lenafMulti1)

lenaMulti2 = ((NormX2).*(imgdouble))
lenaMulti2 = uint8(lenaMulti2)
figure, imshow(lenaMulti2)
