function [trayectoria1, trayectoria2, trayectoria3, trayectoria4] = calcular_trayectorias(T, fin)

    t = 0:T:fin;
    
    A = 0.5:0.5:2.5;
    %Periodo
    p1 = 1:1:15;
    P = zeros(size(p1));
    for i = 1:length(p1)
        P(i) = 1 / p1(i); % P(1)= 1/1, P(2)= 1/2, ..., P(15)= 1/15;
    end

    %Frecuencia
    f = 2:2:10;
    F = zeros(size(f));
    for i = 1:length(f)
        F(i) = pi / f(i); % F(1)= pi/2, F(2)= pi/4, ..., F(6)= pi/10;
    end

    trayectoria1 = A(2)*sin(2*pi*P(10)*t + F(2)) + A(3)*cos(2*pi*P(7)*t + F(1)) + A(4)*sin(2*pi*P(5)*t + 2*F(1)) + A(1)*sin(2*pi*P(3)*t + 2*F(3)) + A(5)*cos(2*pi*P(15)*t + F(3));

    trayectoria2 = A(2)*sin(2*pi*P(8)*t + 2*F(3)) + A(4)*cos(2*pi*P(12)*t + F(2)) + A(3)*sin(2*pi*P(6)*t + F(1)) + A(5)*cos(2*pi*P(15)*t + F(3)) + A(1)*sin(2*pi*P(5)*t + F(1)) + A(5)*cos(2*pi*P(10)*t + F(2));

    trayectoria3 = A(4)*sin(2*pi*P(7)*t + F(2)) + A(3)*cos(2*pi*P(11)*t + 2*F(3)) + A(2)*sin(2*pi*P(9)*t + F(1)) + A(5)*cos(2*pi*P(14)*t + F(3)) + A(1)*sin(2*pi*P(6)*t + F(2)) + A(2)*cos(2*pi*P(12)*t + F(2)) + A(2)*sin(2*pi*P(12)*t + (2/5)*F(1));

    trayectoria4 = A(3)*sin(2*pi*P(12)*t + 2*F(3)) + A(2)*cos(2*pi*P(8)*t + F(2)) + A(4)*sin(2*pi*P(10)*t + F(1)) + A(5)*cos(2*pi*P(15)*t + F(3)) + A(1)*sin(2*pi*P(7)*t + F(2)) + A(2)*cos(2*pi*P(9)*t + (2/5)*F(1)) + A(4)*sin(2*pi*P(6)*t + (2)*F(3));
end