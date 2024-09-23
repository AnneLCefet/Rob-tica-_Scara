function [q, dq, d2q]  = cinematica_inversa_SCARA_old(L1, L2, Lf, PQ_0,dPQ_0, d2PQ_0, theta5)
    % PQ_0: Vetor de posicoes desejadas
    % dPQ_0: Vetor de velocidades desejadas (linear e angular)
    % d2PQ_0: Vetor de acelerações desejadas
    
    %% Cálculo do q1
    x5 = PQ_0(1);
    y5 = PQ_0(2);
    z5 = PQ_0(3);

    A = 2*L1*x5;
    B = 2*L1*z5;
    C = L2^2 - L1^2 - x5^2 - z5^2;

    aux1 = cos(-2*A*C + sqrt(4*(A^2)*(C^2)-4*((A^2)+(B^2))*((C^2)-(B^2)))) / (2*((A^2)+(B^2)));
    if (cos(aux1) > sqrt(2)/2 && cos(aux1) < 1) || (cos(aux1)>-1 && cos(aux1)<sqrt(2)/2)
        q1 = acos(aux1);
    else
        q1 = asin(-2*B*C + sqrt(4*(B^2)*(C^2)-4*((A^2)+(B^2))*((C^2)-(A^2)))) / (2*((A^2)+(B^2)));
    end

    %% Cálculo do q2
    q2 = atan2( (L2*sin(q1) - z5) , L2*cos(q1) - x5) - q1;

    %% Cálculo do q3
    q3 = y5 + Lf;

    %% Cálculo do q4
    q4 = theta5 - q1 - q2;
   
    q = [q1, q2, q3, q4];
    dq = [0, 0, 0, 0];
    d2q = [0, 0, 0, 0];

end