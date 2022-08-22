function y = sat(sigma, v)

condition = abs(sigma/v);

if condition <= 1
    y = sigma/v;
else 
    y = sign(sigma/v);
end