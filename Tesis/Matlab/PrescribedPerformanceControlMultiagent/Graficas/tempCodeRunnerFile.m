figure(6)

% Grafica para calcular la norma de la velocidad v0 - V de cada agente

for i = 1:length(t)
    sum = 0;
    for k = 1:n
        sum = norm(v0(:,i) - V(m*k-2:m*k, i)) + sum; % Calcula la norma de v0 - V
    end
    norm_v0_V(i) = sum;
end

semilogy(t, norm_v0_V, 'Linewidth',2)

xlabel('Seconds');
ylabel({'$\sum^{N}_{i=1}||v_0 - v_i ||$'},'Interpreter','latex');
grid on