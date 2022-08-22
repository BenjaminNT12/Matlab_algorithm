%integrles multiples por metodo del trapecio 

function R = TrapecioMult(f,li,ls,n)
    SumF = 0;
    px = linspace(li,ls,n+1);
    for i = 2:n
       SumF = SumF + double(subs(f,px(i)));
    end
    R = double((ls-li)*(subs(f,px(1))+(2*SumF)+(subs(f,px(n+1))))/(2*n));
end