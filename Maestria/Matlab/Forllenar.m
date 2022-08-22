%for i = 1:6
clear all;
clc;
for l = 1:3:9
    for i = 1*l:2*l
        for j = 1*l:3*l
            A(i,j) = 1;
        end
    end
end    
%end
A