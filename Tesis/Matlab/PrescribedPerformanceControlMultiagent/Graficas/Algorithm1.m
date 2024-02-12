function [eMas, eMenos] = Algorithm1(eijO, dij, rci, rcj, rsi, rsj, miu)
                            % (e0(i,1), d(i,1), 8, 8, 0.5, 0.5, 0.02)
    rsij = rsi + rsj;
    rcij = min(rci , rcj);

    miuMASij = (rcij - dij) - miu;
    miuMenosij = (dij - rsij) - miu;
    
    if(eijO >= 0)
        eMas = min( abs(eijO)+miu, rcij - dij );
        eMenos = min( abs(eijO)+miu, miuMenosij );
    elseif(eijO < 0)
        eMas = min( abs(eijO)+miu, miuMASij );
        eMenos = min( abs(eijO)+miu, dij - rsij );
    end
end