function [q, dq, d2q]  = cinematica_inversa_SCARA(L1, L2, Lf, PQ_0,dPQ_0, d2PQ_0, theta5)
    % PQ_0: Vetor de posicoes desejadas
    % dPQ_0: Vetor de velocidades desejadas (linear e angular)
    % d2PQ_0: Vetor de acelerações desejadas
    % theta5 é o angulo final da ferramenta, conseguido pela tarefa. Lembrando que q4 = theta5 - q1 - q2 
    
    x5 = PQ_0(1);
    y5 = PQ_0(2);
    z5 = PQ_0(3);

    %% Cálculo de q3 (componente prismática)
    % q3 é o deslocamento da junta prismática
    % q3 = y5 - L1 - Lf;
    q3 = y5 + Lf;
    
    %% Calculo de q2 (componente rotacional)
    num = (x5^2 + z5^2 - L1^2 - L2^2);
    den = (2*L1*L2);

    % Truncando na 3ª casa decimal
    num = fix(num * 1000) / 1000;
    den = fix(den * 1000) / 1000;
    
    q2 = acos(num/den);
    
    %% Cálculo de q1 (componente rotacional)
    q1 = atan2(-L2*sin(q2)*x5 - (L1 + L2*cos(q2))*z5, (L1 + L2*cos(q2))*x5 - L2*sin(q2)*z5);

    %% Cálculo de q4 (componente rotacional)
    q4 = theta5 - q1 - q2;
    
    %% Atribuiçao das variáveis de saida - posicao e angulos
    q = [q1; q2; q3; q4];

    %% Velocidades
    % Jacobiano completo (linhas para velocidades lineares e angulares)
    % Colocamos as derivadas parciais de x5, y5, z5 e theta5 em relação às variáveis articulares
    J = [
        - L2 * sin(q1 + q2) - L1 * sin(q1), - L2 * sin(q1 + q2), 0, 0;  % dx/dq1, dx/dq2, dx/dq3, dx/dq4
        0, 0, 1, 0; % dy/dq1, dy/dq2, dy/dq3, dy/dq4
        - L2 * cos(q1 + q2) - L1 * cos(q1), - L2 * cos(q1 + q2), 0, 0; % dz/dq1, dz/dq2, dz/dq3, dz/dq4
        1, 1, 0, 1 % dtheta5/dq1, dtheta5/dq2, dtheta5/dq3, dtheta5/dq4
    ];

    % Resolvendo para as velocidades articulares
    dq = J \ [dPQ_0;1]; % Usando \ para maior precisão em vez de inv(J)

    dq1 = dq(1);
    dq2 = dq(2);
    dq3 = dq(3);
    dq4 = dq(4);
    
    %% Aceleracoes
    % Derivada do Jacobiano
    dJ = [
        -L2*cos(q1 + q2)*(dq1 + dq2) - L1*cos(q1)*dq1,  -L2*cos(q1 + q2)*(dq1 + dq2),  0,  0;
        0, 0, 0, 0;
        L2*sin(q1 + q2)*(dq1 + dq2) + L1*sin(q1)*dq1,   L2*sin(q1 + q2)*(dq1 + dq2),  0,  0;
        0, 0, 0, 0
    ];
        
    % Calculando a aceleração inversa
    d2q = J \ ([d2PQ_0;1] - dJ * dq);  % Usando \ (backslash) em vez de inv(J) para maior precisão


end