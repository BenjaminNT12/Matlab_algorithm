function f1p_rfilt = LevantDiff(datos,t, gain)

f1 = datos(:,1)';
x1 = zeros(length(datos(:,1)));
x2 = zeros(length(datos(:,1)));
f1p_robusto = zeros(length(datos(:,1)));
alpha = gain(1);  %k2
lamda = gain(2);  %k1

for i=1:length(t)-1
    u = (-lamda*abs(x1(i) - f1(i))^(1/2)*sign(x1(i) - f1(i)) + x2(i));
    x1(i+1) = x1(i) + T*u;
    x2(i+1) = x2(i) + T*(-alpha*sign(x1(i) - f1(i)));
    f1p_robusto(i+1) = u;
end
tf2 = tf([1], [0.05 1]);
f1p_rfilt = lsim(tf2,f1p_robusto,t);
end


