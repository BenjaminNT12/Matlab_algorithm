function out = saturacion6(x,y)
    
    if abs(x) < y
        out = x;
    elseif abs(x) >= y
        out = y*sign(x);
    end
end