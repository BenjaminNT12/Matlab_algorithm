function dxdt = identifier(t, Zg, u, Wg, phi, Zt, P)
    % Crear una función de transferencia para un sistema de primer orden
    k1 = P(1);
    alpha1 = P(2);
    alpha2 = P(3);
    beta1 = P(4);
    beta2 = P(5);
    % gamma1 = 0.5;
    % sigma1 = 0.5;

    s = Zt(1) + k1*sign(Zt(2))*abs(Zt(2))^alpha1;

    z1gp = Zg(2)+ beta1*Zt(1);
    z2gp = Wg(:)'*phi(:) + u + beta2*sign(s) + 1/(alpha1*k1)*sign(Zt(2))*abs(Zt(2))^(2-alpha2)+beta1/alpha1*Zt(2);
    dxdt = [z1gp; z2gp];
end