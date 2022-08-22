clear all;
clc;
cla;
format long;
disp('x = [3 4.5 7 9];')
disp('y = [2.5 1 2.5 0.5]')
disp('Metodo de Splinas(INTERPOLACION)')
syms xc;

m = 1;

%x = [0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
%y = [2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];
%len = length(x)
%z=@(xx) interp1(x,y,xx,'spline');
%fplot(z,[x(1),x(end)])
while m < 1000
    x(m) = input('Ingrese los valores de entrada (x) = ');
    y(m) = input('Ingrese los valores de salida (y) = ');
    plot(x(m),y(m),'ok');
    hold on;
    A(m,:) = [x(m)^2 x(m) 1];
    if m >= 3
        R = input('Desea ingresar otro valor (Y)/(N)? ','s');    
        if R == 'N' || R == 'n'
            R = 0;
            break;
        end
    end
    m = m + 1;
end
%m = m - 1;%%%%%%%%%%%%
n = 3*(m-1);
r = 2*(m-1);
MS = zeros(n,n+1);
p = 1;
l = 0;
E = (m-1);
yS(n) = 0;

for i = 1:E
    for j = 0:1
        for k = 1:3
            MS( p , k + l) = A( j + i , k );
            yS( p ) = y(j + i);
        end
        p = p + 1;
    end
    l = l + 3;
end

for i = 1:(m-2)
    Pm(i,:) = [2*A(i+1,2) 1 0 -2*A(i+1,2) -1];
end
p = 0;
q = 0;
for i = r + 1:n-1
    for j = 1:5
        MS(i,j + q) = Pm(p + 1,j);
    end
    q = q + 3;
    p = p + 1;
end

for i = 1:n
    MS(i,n+1) = yS(i);
end

MS(n,1) = 1;
MS = rref(MS);
w = 1;
for i = 1:3:n
    fx(w) = (MS(i,n+1)*(xc^2))+(MS(i+1,n+1)*xc)+MS(i+2,n+1);
    t(w,:) = linspace(x(w),x(w+1));
    fxt(w,:) = subs(fx(w),t(w,:));
    plot(t(w,:),fxt(w,:));
    hold on;
    w = w + 1;
end

fx(1)
fx(2)
fx(3)

for g = 0:1000
    if g == 0
        R = input('Desea evaluar un punto (Y)/(N)? ','s');
    else
        R = input('Desea evaluar otro punto (Y)/(N)? ','s');
    end
    w = 1;
    if R == 'Y' || R == 'y'
        xe = input('Ingrese el valor que deseas evaluar ');
        for i = 1:m-1
            if xe < x(w)
                fy = subs(fx(1),xe);            
            else
                if xe < x(i)
                    fy = subs(fx(i-1),xe);
                    break;
                end
            end
        end
    else
        break;
    end

    plot(xe,fy,'x');
    hold on;
    display = ['El resultado del valor evaluado es : ',num2str(double(fy))];
    disp(display);
end










