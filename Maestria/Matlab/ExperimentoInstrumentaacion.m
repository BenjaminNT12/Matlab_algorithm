clear all;
clc;
cla;
x = [10 28 30 43 60]
y = [28 512 640 723 984]

sx = 0;
sy = 0;
sxx = 0;
sxy = 0;
N = length(x)
M = length(y)

if N == M
    for i = 1:N
        sx = sx+x(i);
        sxx = sxx+x(i)*x(i);
        sxy = sxy+x(i)*y(i);
        sy = sy+y(i);
    end
    m = (N*sxy-sx*sy)/(N*sxx-sx*sx)
    b = (sxx*sy-sx*sxy)/(N*sxx-sx*sx)
else
    disp('error')
end

x1 = linspace(0,80,1000);
y1 = m*x1+b;
plot(x,y,'K',x1,y1,'r')
legend('Real','Estimado')