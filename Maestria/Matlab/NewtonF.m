function Res = NewtonF(x0,fx)
syms x z;

Gi = length(fx);
Gi = Gi-1;
Bn = InterpolationNewton(fx,x0,Gi);
Res = 0;
for i = 1:Gi
    Pp = 1;
    for j = 1:i
        Pp = Pp*(z-x0(j));
    end
    Res = Res+(Bn(i)*Pp);
    Bn(i)
end
Gi
Bn
Res = fx(1)+Res;

val_min = x0(1);
val_max = x0(1);
for i = 1:Gi+1
    if x0(i) < val_min
        val_min = x0(i);
    end
    if x0(i) > val_max
        val_max = x0(i);
    end
end

t = linspace(val_min,val_max,1000);
P_fx = subs(Res,t);
plot(t,P_fx,'LineWidth',2);
grid on
hold on



