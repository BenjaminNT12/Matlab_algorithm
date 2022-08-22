% Integrales definidas
% Metodo del trapacio

function R = Trapecio(F,Li,Ls)
    R = (Ls-Li)*((subs(F,Li)+subs(F,Ls))/2)
end

