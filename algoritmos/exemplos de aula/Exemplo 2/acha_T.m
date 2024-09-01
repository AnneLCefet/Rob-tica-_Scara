function T = acha_T(L, t, q, dq)
    % Função para encontrar a força generalizada T usando o Lagrangiano L
    % Inputs:
    %   L  - Lagrangiano (expressão simbólica)
    %   t  - variável de tempo (simbólica)
    %   q  - variável de posição (simbólica)
    %   dq - variável de velocidade (simbólica)
    % Output:
    %   T  - Torque generalizado (simbólico)

    % Derivada do Lagrangiano em relação à velocidade dq
    dL_ddq = diff(L, dq);

    % Derivada temporal da derivada do Lagrangiano em relação à velocidade dq
    ddL_ddq_dt = diff(dL_ddq, t);

    % Derivada do Lagrangiano em relação à posição q
    dL_dq = diff(L, q);

    % Equação de Lagrange para encontrar o torque T
    T = ddL_ddq_dt - dL_dq;

    % Simplificação da expressão para o torque T
    T = simplify(T);
end