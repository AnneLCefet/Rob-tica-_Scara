    function [JA_1_0, JA_2_0, JA_3_0, JA_4_0, T_1_0, T_2_0, T_3_0, T_4_0, P_1_0, P_2_0, P_3_0, P_4_0] = cinematicaDiretaSCARA(P_1, P_2, P_3, P_4, elos)
    % DIRETA_SCARA .......
    % RRP
    q1 = elos(1);
    q2 = elos(2); 
    % O q3 está embutido no P_4
    q4 = elos(4);

    p_x_1 = P_1(1);
    p_y_1 = P_1(2);
    p_z_1 = P_1(3);
    p_x_2 = P_2(1);
    p_y_2 = P_2(2);
    p_z_2 = P_2(3);
    p_x_3 = P_3(1);
    p_y_3 = P_3(2);
    p_z_3 = P_3(3);
    p_x_4 = P_4(1);
    p_y_4 = P_4(2);
    p_z_4 = P_4(3);

    %% Elo 1:
    D_1_0_P1 = TranslacaoPura(p_x_1,p_y_1,p_z_1);
    R_y_q1 = RotacaoPura('y',q1);
    D_1_0_P2 = TranslacaoPura(p_x_2,p_y_2,p_z_2);
    transformacoesPuras_1_0 = {D_1_0_P1, R_y_q1, D_1_0_P2};
    [col_Ja_1,T_1_0] = transformacoesCombinadas(eye(4),transformacoesPuras_1_0);
    P_1_0 = T_1_0(:,end);
    P_1_0(end,:) = [];

    %% Elo 2:
    R_y_q2 = RotacaoPura('y',q2);
    D_2_1_P3 = TranslacaoPura(p_x_3,p_y_3,p_z_3);
    transformacoesPuras_2_1 = {R_y_q2,D_2_1_P3};
    [col_Ja_2, T_2_0] = transformacoesCombinadas(T_1_0,transformacoesPuras_2_1);
    P_2_0 = T_2_0(:,end);
    P_2_0(end,:) = [];

    %% Elo 3:
    D_3_2_P4 = TranslacaoPura(p_x_4,p_y_4,p_z_4);
    transformacoesPuras_3_2 = {D_3_2_P4};
    [col_Ja_3, T_3_0] = transformacoesCombinadas(T_2_0,transformacoesPuras_3_2);
    P_3_0 = T_3_0(:,end);
    P_3_0(end,:) = [];

    %% Elo 4:
    R_y_q4 = RotacaoPura('y',q4);
    transformacoesPuras_4_3 = {R_y_q4};
    [col_Ja_4, T_4_0] = transformacoesCombinadas(T_3_0,transformacoesPuras_4_3);
    P_4_0 = T_4_0(:,end);
    P_4_0(end,:) = [];
    
    %% Matrizes de jacobiano angular
    JA_1_0 = [col_Ja_1 zeros(3,1) zeros(3,1) zeros(3,1)];
    JA_2_0 = [col_Ja_1 col_Ja_2 zeros(3,1) zeros(3,1)];
    JA_3_0 = [col_Ja_1 col_Ja_2 col_Ja_3 zeros(3,1)];
    JA_4_0 = [col_Ja_1 col_Ja_2 col_Ja_3 col_Ja_4];

end