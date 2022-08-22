clear all
close all
clc

imgBw = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.png');
figure, imshow(imgBw);
title('wdg3')
figure, imhist(imgBw)
title('Histograma wdg3')

imgBw2 = imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.png');
figure, imshow(imgBw2);
title('step2line')
figure, imhist(imgBw2)
title('Histograma step2line')

[M, img]=isodata(imgBw,'log');
[M2, img2]=isodata(imgBw2,'log');

imgA = double(img);
figure, imshow(imgA)
title('Umbralización por el algoritmo Ridler Cavard')

imgB = double(img2);
figure, imshow(imgB)
title('Umbralización por el algoritmo Ridler Cavard')