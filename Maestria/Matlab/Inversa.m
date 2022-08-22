clear all
clc
cla
syms a al b c d th

ma = [ cos(al)  -sin(al) 0;
        sin(al)  cos(al)  0; 
        0       0       1]
mb = [ cos(b)  0       sin(b);
        0       1       0;
        -sin(b) 0       cos(b)]
mc = [ 1       0         0;
      0       cos(c)    -sin(c);
      0       sin(c)    cos(c)]
    
Mabc =  ma*mb*mc;

Mat = [ cos(th)     -sin(th)*cos(al)       sin(th)*sin(al)         a*cos(th);
        sin(th)     cos(th)*cos(al)        -cos(th)*sin(al)        a*sin(th);
        0           sin(al)                cos(al)                 d;
        0           0                      0                       1]
    

Mat2 = simplify(Mat)

brazode4grados(45,-45,60,45)
    
    
    