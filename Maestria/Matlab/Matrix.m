function m = Matrizacion(A)
l = length(A);
c = 1;
for i = 1:sqrt(l)
    for j = 1:sqrt(l)
        m(j,i) = A(c,1);
        c = c+1;
    end
end

