%interpolacion de polinomios METODO NEWTON
function [fx4] = InterpolationNewton(fx0,x0,n)

    syms x y;
    format long;
    fx1 = fx0;
    fx2(n,n) = 0;
    i = 1;
    k = 0;
    m = 1;
    o = 1;
    fx2 = 0;
    fx3 = 0;
    fx4 = 0;
    for l = 1:n
        fx2(l) = (fx1(l+1)-fx1(l))/(x0(l+1)-x0(l));
        plot(x0(l),fx0(l),'x');
        hold on;
        if l == 1
            fx4(o) = fx2(1);
            double(fx4(o));
        end
    end
    k = o+2;
    while i <= n-1
        fx3(i) = (fx2(i+1)-fx2(i))/(x0(k)-x0(i));
        i = i + 1
        k = k + 1
        if(i == n)
            i = 1;
            o = o + 1;
            k = o + 2;
            fx4(o) = fx3(1);
            double(fx4(o));
            m = 1;
            while m < n
                fx2(m) = fx3(m);
                m = m+1;
            end
            n = n - 1;
            if(n == 0)
                break;
            end
        end
    end
   fx4
    