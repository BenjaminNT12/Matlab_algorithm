%Interpolacion Hermite

clear all;
syms x;
clc;
x1 = [1 2 3 0];
x2 = [2 6 7 8];

y = [x1;x2];
[l1 l2] = size(y);

k = 1;
d = 0
for i = 1:l1
    for j = 1:l2-1
        d(i) = 1;
        if y(i,j+1) > 0
            H(k,1) = y(i,1);
            H(k,2) = y(i,2);
            k = k+1;
            d(i) = d(i)+1;
        end
        d(i) = d(i)+1;
    end
end
d;
w = k-1;
b = 0;
while b<l2
    j = 1;
    c = 1;
    g = 1;
    for i = 1:k-2
        v = (H(i+1,b+j+1)-H(i,b+j+1))/(H(b+i+1,1)-H(i,1));
        if isnan(v) == 1 
            H(i,b+j+2) = y(c,b+j+2)/factorial(b+1);
        else
            H(i,b+j+2) = v;  
        end
        if g == d(c)
            g = 0;
            c = c+1;
        end
        if i == k-2
            c = 1;
            k = k-1;
            j = j + 1;
        end
        g = g+1;
    end
    b = b+1;
end

vx = 1;
fp = 1;
c = 1;
Poli = H(1,2);
for i = 1:w-1
    vx = vx*(x-H(i,1))
    Poli = Poli+vx*(H(1,i+2))
end

t = linspace(x1(1),x2(1))

fx=subs(Poli,t)
plot(t,fx)



