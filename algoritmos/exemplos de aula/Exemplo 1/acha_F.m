function F = acha_F(L, t, x, dx)
    % Função para encontrar a força generalizada F usando o Lagrangiano L
    % Inputs:
    %   L  - Lagrangiano (expressão simbólica)
    %   t  - variável de tempo (simbólica)
    %   x  - variável de posição (simbólica)
    %   dx - variável de velocidade (simbólica)
    % Output:
    %   F  - Força generalizada (simbólica)

    % Derivada do Lagrangiano em relação à velocidade dx
    dL_ddx = diff(L, dx);

    % Derivada temporal da derivada do Lagrangiano em relação à velocidade dx
    ddL_ddx_dt = diff(dL_ddx, t);

    % Derivada do Lagrangiano em relação à posição x
    dL_dx = diff(L, x);

    % Equação de Lagrange para encontrar a força F
    F = ddL_ddx_dt - dL_dx;

    % Simplificação da expressão para a força F
    F = simplify(F);
end