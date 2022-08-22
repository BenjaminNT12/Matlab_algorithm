clear all;
clear axis;
clc;

b = -5;
g = 1;
for i = 1:2
    for k = 0:0.5:2
        for a = -abs(b):0.1:abs(b)
            h = (acos(-a/b)+2*k*pi)/(g*sqrt(b^2-a^2))
            plot(h,a,'.-r');
            plot(a,-b,'.-b');
            hold on 
        end
    end
    g = -1
end
axis([-10 10 -10 10])
