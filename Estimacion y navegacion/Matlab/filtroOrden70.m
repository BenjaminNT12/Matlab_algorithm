Fs = 500;
N = 500;

rng default

datos1 = csvread('datos11.csv')

xn = datos1(:,1);
tn = (0:length(datos1(:,1))-1)/Fs;

Nfir = 70;
Fst = 75;

firf = designfilt('lowpassfir','FilterOrder',Nfir,'CutoffFrequency',Fst,'SampleRate',Fs);

xf = filter(firf,xn);

plot(tn,xn,tn,xf)
title 'Electrocardiogram'
xlabel 'Time (s)'
legend('Original','FIR Filtered')
grid

grpdelay(firf,length(datos1(:,1)),Fs)

delay = mean(grpdelay(firf))

tt = tn(1:end-delay);
sn = xn(1:end-delay);

sf = xf;
sf(1:delay) = [];

figure(2)
plot(tt,sn,tt,sf)
title 'Electrocardiogram'
xlabel('Time (s)')
legend('Original Signal','Filtered Shifted Signal')
grid