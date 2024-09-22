    function [JA_1_0, JA_2_0, JA_3_0, JA_4_0, T_1_0, T_2_0, T_3_0, T_4_0, T_5_0, P_1_0, P_2_0, P_3_0, P_4_0, P_5_0] = cinematicaDiretaSCARA(P_1, P_2, P_3, P_5, elos)
    % DIRETA_SCARA .......
    % RRPR
    q1 = elos(1);
    q2 = elos(2); 
    % O q3 está embutido no P_4
    q4 = elos(4);

    %% Elo 1:
    R_y_q1 = RotacaoPura('y',q1);
    D_1_0_P1 = TranslacaoPura(P_1);
    transformacoesPuras_1_0 = {R_y_q1,D_1_0_P1};
    [col_Ja_1,T_1_0] = transformacoesCombinadas(eye(4),transformacoesPuras_1_0);
    P_1_0 = T_1_0(1:3, 4);

    %% Elo 2:
    R_y_q2 = RotacaoPura('y',q2);
    D_2_1_P2 = TranslacaoPura(P_2);
    transformacoesPuras_2_1 = {R_y_q2,D_2_1_P2};
    [col_Ja_2, T_2_0] = transformacoesCombinadas(T_1_0,transformacoesPuras_2_1);
    P_2_0 = T_2_0(1:3, 4);

    %% Elo 3:
    D_3_2_P3 = TranslacaoPura(P_3);
    transformacoesPuras_3_2 = {D_3_2_P3};
    [col_Ja_3, T_3_0] = transformacoesCombinadas(T_2_0,transformacoesPuras_3_2);
    P_3_0 = T_3_0(1:3, 4);

    %% Elo 4:
    R_y_q4 = RotacaoPura('y',q4);
    transformacoesPuras_4_3 = {R_y_q4};
    [col_Ja_4, T_4_0] = transformacoesCombinadas(T_3_0,transformacoesPuras_4_3);
    P_4_0 = T_4_0(1:3, 4);
    
    %% {5} Ferramenta:
    D_5_4_P5 = TranslacaoPura(P_5);
    transformacoesPuras_5_4 = {D_5_4_P5};
    [col_Ja_5, T_5_0] = transformacoesCombinadas(T_4_0,transformacoesPuras_5_4);
    P_5_0 = T_5_0(1:3, 4);
    
    %% Matrizes de jacobiano angular
    JA_1_0 = [col_Ja_1 zeros(3,1) zeros(3,1) zeros(3,1)];
    JA_2_0 = [col_Ja_1 col_Ja_2 zeros(3,1) zeros(3,1)];
    JA_3_0 = [col_Ja_1 col_Ja_2 col_Ja_3 zeros(3,1)];
    JA_4_0 = [col_Ja_1 col_Ja_2 col_Ja_3 col_Ja_4];

end