function S = biseccionFunc(kp,qd,A,B)

syms x;
format long

m           = 1;
g           = 1;
l           = 1;

i           = 0;
Xi(2)       = 0;
F1          = 0;
Err1        = 100;
t           = linspace(-50,50);
fx          = kp*x-m*g*l*sin(qd-x);
PercentErr  = 0.01;

while(F1 == 0)

FxA = subs(fx,A);
FxB = subs(fx,B);

    if (FxA*FxB) < 0
        F1 = 1;
    else
        F1 = 2;
        Err1 = 0;
        S = 0;
    end
    
end

while (Err1 > PercentErr && i<100)
    Xi(1)   = Xi(2);
    Xi(2)   = ((B+A)/2);
    FxA     = subs(fx,A);
    FxX     = subs(fx,Xi(2));
    Err1    = abs((Xi(2)-Xi(1))/Xi(2))*100;
    
    if ( FxA * FxX ) < 0
        B = Xi(2);
    end
    if( FxA * FxX )>0
        A = Xi(2);
    end
    if(( FxA * FxX ) == 0)
        break;
    end
    i = i+1;
end
i
S = Xi(2);

