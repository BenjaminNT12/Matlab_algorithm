clear axis
clear all
b = 0.01;
n = 0;
nn = 1;
contador = 1;
Va = 0;
tn1 = 0
tn2 = 0
 
for(n = 1:3)
    for(a = 0:0.1:5)
        tn1(contador) = (2*(n-1)*pi+acos(b/a))/sqrt(a^2-b^2)
        tn2(contador) = (2*n*pi-acos(b/a))/sqrt(a^2-b^2)
        Va(contador) = a;
        contador = contador + 1;
    end
    contador = 1;    
    plot(tn1,Va,'r')
    hold on
    plot(tn2,Va,'b')
    hold on
end

