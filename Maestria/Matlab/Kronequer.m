function AP = Kronecker(P,A)
[L1 L2] = size(P)
L1 
L2
AP = zeros(L1*2)
b = 0
c = 0
for k = 1:L2
    b = 0
    for l = 1:L2
        for i = 1:L2
            for j = 1:L2
                AP(i+c,j+b) = P(k,l)*A(i,j);
            end
        end
        b = b+L2
    end
    c = c + L2
end
