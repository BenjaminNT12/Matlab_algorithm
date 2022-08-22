function v = vectorizar(A)
[L1 L2] = size(A)
k = 1;
for i = 1:L1
    for j = 1:L1
        v(k,1) = A(j,i);
        k = k+1;
    end
end


