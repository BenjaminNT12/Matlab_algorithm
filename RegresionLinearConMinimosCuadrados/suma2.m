function y = suma2(x,x2,p,n)
    temp = 0;
    y = 0;
    for i=1:n
        temp = x2(i)*x(i)^p;
        y = y + temp;
    end
end