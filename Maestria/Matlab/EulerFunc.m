function R = EulerFunc(f,VInitX,VEndX,VInitY,h)
syms x y;
VEndY = VInitY;
VectorEuler = 0;
j = 1;
for i = VInitX:h:VEndX-h
    VEndY = VEndY + subs(f,[x,y],[VInitX,VEndY])*h;
    VInitX = VInitX + h;
    VectorEuler(j) = double(VEndY);
    j = j + 1;
end
R = VectorEuler;
