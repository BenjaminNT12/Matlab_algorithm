function  fx = SplinesF(x,y)

format long;
syms xc;
disp('Splines 2')
m   = 1;
len = length(x);
while m < len+1
    plot(x(m),y(m),'ok');
    hold on;
    A(m,:) = [x(m)^2 x(m) 1];
    if m == len
        break;
    else
        m = m + 1;
    end
end
n       = 3*(m-1);
r       = 2*(m-1);
MS      = zeros(n,n+1);
p       = 1;
l       = 0;
E       = (m-1);
yS(n)   = 0;

for i = 1:E
    for j = 0:1
        for k = 1:3
            MS( p , k + l) = A( j + i , k )
            yS( p ) = y(j + i)
        end
        p = p + 1;
    end
    l = l + 3;
end

for i = 1:(m-2)
    Pm(i,:) = [2*A(i+1,2) 1 0 -2*A(i+1,2) -1]
end
p       = 0;
q       = 0;
for i = r + 1:n-1
    for j = 1:5
        MS(i,j + q) = Pm(p + 1,j)
    end
    q = q + 3;
    p = p + 1;
end

for i = 1:n
    MS(i,n+1) = yS(i)
end

MS(n,1) = 1;
MS      = rref(MS)
w       = 1;
for i = 1:3:n
    fx(w) = (MS(i,n+1)*(xc^2))+(MS(i+1,n+1)*xc)+MS(i+2,n+1)
    t(w,:) = linspace(x(w),x(w+1),1000);
    fxt(w,:) = subs(fx(w),t(w,:));
    plot(t(w,:),fxt(w,:),'LineWidth',2);
    hold on;
    w = w + 1;
end
