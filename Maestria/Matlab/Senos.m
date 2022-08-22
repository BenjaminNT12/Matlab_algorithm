x = 0;
n = 0;
R = 0;
C = 1;
b = 1;
EN = input('Si quieres calcular seno ingresa 1 o coseno 0 \t')
if EN == 1
    x = input('Calcular seno de = ')
    n = input('Ingrese N')
    for i = 1:2:n 
        R = R+(b*((x^i)/factorial(i)));
        b = -b;
    end
    disp('Sen = ')
    R 
else
    b = 1
    x = input('Calcular coseno de = ')
    n = input('Ingrese N')    
    R = 1;
    for i = 2:2:n   
        R = R-(b*((x^i)/factorial(i)));
        b = -b;
    end
    disp('Cos = ');
    R    
end

