clc
clear
close all

[X,cmap] = imread('bld1.gif');
rgbImage = ind2rgb(X,cmap);
grayImage = rgb2gray(rgbImage);

f = grayImage
imshow(grayImage)

figure,  imhist(f)
ylim('auto')
g = histeq(f, 256)
figure, imshow(g)
figure, imhist(g)
ylim('auto')

hnorm = hist(f)./numel(f)
cdf = cumsum(hnorm)

figure(5)
x = linspace(0,1,412)
% hold on
plot(x,cdf)
axis([0 1 0 1])
set(gca, 'xtick', 0:0.2:1)
set(gca, 'ytick', 0:0.2:1)
xlabel('entrada de intensidad de valores','fontSize',9)
ylabel('salida de intensidad de valores','fontSize',9)


