close all 
clear all
clc

%x=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\wdg3.jpg');     %cargar la imagen original
x=imread('C:\Users\cmdjd\OneDrive - CINVESTAV\Documentos\MATLAB\imagesP1\step2line.jpg');     %cargar la imagen original

size(x);
x=imresize(x,[500 800]);
figure;
imshow(x);
title('imagen original');
x = cat(3, x, x, x);

z=rgb2hsv(x);       %extracción del valor de HSV plano
v=z(:,:,3);
v=imadjust(v);

m = mean(v(:));
s=std(v(:));
k=-.6;
value=m+ k*s;
temp=v;

for p=1:1:500
    for q=1:1:800
        pixel=temp(p,q);
        if(pixel>value)
            temp(p,q)=1;
        else
            temp(p,q)=0;
        end
    end
end
figure;
imshow(temp);
title('resultado por por niblack');












