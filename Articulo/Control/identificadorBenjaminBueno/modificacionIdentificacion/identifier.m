function dxdt = identifier(t, Zg, u, W1g, W2g, phi, psi, Zt, P, s)
    % Crear una función de transferencia para un sistema de primer orden
    k1 = P(1);
    alpha1 = P(2);
    alpha2 = P(3);
    beta1 = P(4);
    beta2 = P(5);
    % gamma1 = P(6);
    % gamma2 = P(7);
    % sigma1 = P(8);
    % sigma2 = P(9);
    GAMMA = P(10);

    z1gp = Zg(2)+ beta1*Zt(1) + GAMMA*sign(s);
    z2gp = W1g(:)'*psi(:) + W2g(:)'*phi(:)*u + beta2*sign(s) + 1/(alpha1*k1)*sign(Zt(2))*abs(Zt(2))^(2-alpha2) + beta1/alpha1*Zt(2);
    dxdt = [z1gp; z2gp];
end