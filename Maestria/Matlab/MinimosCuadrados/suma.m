function y = suma(x,p,n)
    temp = 0;
    y = 0;
    for i=1:n
        temp = x(i)^p;
        y = y + temp;
    end
end

