function [JA_1_0, JA_2_0, JA_3_0, T_1_0, T_2_0, T_3_0, P_1_0, P_2_0, P_3_0] = cinematicaDiretaEsferico(P_1, P_2, P_3, elos)
    % DIRETA_ESFERICO .......
    % RRP
    q1 = elos(1);
    q2 = elos(2); % O q3 está embutido no P_3
    p_x_1 = P_1(1);
    p_y_1 = P_1(2);
    p_z_1 = P_1(3);
    p_x_2 = P_2(1);
    p_y_2 = P_2(2);
    p_z_2 = P_2(3);
    p_x_3 = P_3(1);
    p_y_3 = P_3(2);
    p_z_3 = P_3(3);

    R_z_q1 = RotacaoPura('z',q1);
    D_1_0 = TranslacaoPura(p_x_1,p_y_1,p_z_1);
    [Ja_1,T_1_0] = transformacoesCombinadas(zeros(4),R_z_q1,D_1_0);
    P_1_0 = T_1_0(:,end);
    P_1_0(end,:) = [];
    
    R_y_q2 = RotacaoPura('y',q2);
    D_2_1 = TranslacaoPura(p_x_2,p_y_2,p_z_2);
    [Ja_2, T_2_0] = transformacoesCombinadas(T_1_0,R_y_q2,D_2_1);
    P_2_0 = T_2_0(:,end);
    P_2_0(end,:) = [];

    D_3_2 = TranslacaoPura(p_x_3,p_y_3,p_z_3);
    [Ja_3, T_3_0] = transformacoesCombinadas(T_2_0,D_3_2);
    P_3_0 = T_3_0(:,end);
    P_3_0(end,:) = [];
    
    JA_1_0 = [Ja_1 zeros(3,1) zeros(3,1)];
    JA_2_0 = [Ja_1 Ja_2 zeros(3,1)];
    JA_3_0 = [Ja_1 Ja_2 Ja_3];

end