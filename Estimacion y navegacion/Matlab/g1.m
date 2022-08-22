function g1x = g1(x)
    g = -9.81;
    m = 0.1; % 0.1
    mc = 1; % 1
    l = 0.5; %m
    
    g1_x = (cos(x(1))/(mc+m))/(l*((4/3)-((m*cos(x(1))^2)/(mc+m))));
    g1x = [0; g1_x];
end