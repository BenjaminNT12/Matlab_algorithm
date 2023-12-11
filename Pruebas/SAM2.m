clc
clear 
close all

for i=1:10
    if i==1
        a=2;
        b=3;
        c=5;
        A=[a b c; c b a; b*c a*b a];
        B=[a*b b*2 c*a; c*3 b a-1; b*c a*b a-2];
        C=A+B
    else
        a=8;
        b=5;
        c=3;
        A=[a b c; c b a; b*c a*b a];
        B=[a*b b*2 c*a; c*3 b a-1; b*c a*b a-2];
        D=A*B
    end
end