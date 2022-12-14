function r = raices(f, x)
    y=f(x);
    indices=find(y(1:end-1).*y(2:end)<0);
    r=zeros(1,length(indices));
    for k=1:length(indices)
        r(k)=fzero(f, [x(indices(k)), x(indices(k)+1)]);
    end
end