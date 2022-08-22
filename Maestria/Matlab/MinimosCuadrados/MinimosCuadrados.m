clear all;
clear axis;
clc;
cla
format long;

nOrder = 5;

%x = [3.924 4.218 4.905 5.886 6.572 7 8 9 10];
x = [654 546 465 404 357 322 291 247 216];
y = [20 25 30 35 40 45 50 60 70];
nSample = length(y);

matrixMinCuad = 0;
p = nOrder*2;

for i = 1:nOrder+1
    for j = 1:nOrder+1
        matrixMinCuad(i,j) = suma(x,p-j+1,nSample);
    end
    p = p-1;
end

invMatrixMinCuad = inv(matrixMinCuad);

for i = 1:nOrder+1
    vecMinCuad(i,1) = suma2(x,y,nOrder-i+1,nSample);
end

vecABC = invMatrixMinCuad*vecMinCuad;
temp = 0;
temp2 = 0;
Out = 0;
t = [x(1):-0.01:x(nSample)];
%t = [0:0.1:10]
l = length(t);
for j =1:l
    temp2 = 0;
    for i = 1:nOrder+1
        temp = vecABC(i,1)*(t(j)^(nOrder-i+1));
        temp2 = temp2 + temp;
    end
    Out(j) = temp2;
end
plot(t,Out,'b');
hold on;
plot(x,y,'r');
hold on;
vecABC




