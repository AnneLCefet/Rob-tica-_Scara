classdef TransformacoesCombinadasTest < matlab.unittest.TestCase

    methods (Test)
        function transformacaoCombinadaSemMatrizAnterior(testCase)
            % dado
            syms q1 l1;
            R_z_q1 = RotacaoPura('z',q1);
            D_1_0 = TranslacaoPura(0,0,l1);
            transformacoesPuras = {R_z_q1, D_1_0}; % Isso aqui é um cell array. doc: https://www.mathworks.com/help/matlab/cell-arrays.html
            % quando
            [col_Ja_1,T_1_0] = transformacoesCombinadas(eye(4),transformacoesPuras);
            % entao
            coluna_jacobiano_desejada = sym([0;0;1;]);
            matriz_desejada = [cos(q1), -sin(q1), 0, 0; sin(q1), cos(q1), 0, 0; 0, 0, 1, conj(l1); 0, 0, 0, 1];
            testCase.assertEqual(col_Ja_1,coluna_jacobiano_desejada);
            testCase.assertEqual(T_1_0,matriz_desejada);
        end

        function transformacaoCombinadaComMatrizAnterior(testCase)
            % dado
            syms q1 q2 l1 l2;
            T_1_0 = [cos(q1), -sin(q1), 0, 0; sin(q1), cos(q1), 0, 0; 0, 0, 1, conj(l1); 0, 0, 0, 1];
            R_y_q2 = RotacaoPura('y',q2);
            D_2_1 = TranslacaoPura(l2,0,0);
            transformacoesPuras = {R_y_q2,D_2_1}; % Isso aqui é um cell array. doc: https://www.mathworks.com/help/matlab/cell-arrays.html
            % quando
            [col_Ja_2, T_2_0] = transformacoesCombinadas(T_1_0,transformacoesPuras);
            % entao
            coluna_jacobiano_desejada = [-sin(q1);cos(q1);0;];
            matriz_desejada = [cos(q1)*cos(q2), -sin(q1), cos(q1)*sin(q2), conj(l2)*cos(q1)*cos(q2); cos(q2)*sin(q1), cos(q1), sin(q1)*sin(q2), conj(l2)*cos(q2)*sin(q1); -sin(q2), 0, cos(q2), conj(l1) - conj(l2)*sin(q2); 0, 0, 0, 1];           
            testCase.assertEqual(col_Ja_2,coluna_jacobiano_desejada);
            testCase.assertEqual(T_2_0,matriz_desejada);
        end

        function transformacaoCombinadaComApenasUmaTransformacaoPura(testCase)
            % dado
            syms q1 q2 l1 l2 q3;
            T_2_0 = [cos(q1)*cos(q2), -sin(q1), cos(q1)*sin(q2), conj(l2)*cos(q1)*cos(q2); cos(q2)*sin(q1), cos(q1), sin(q1)*sin(q2), conj(l2)*cos(q2)*sin(q1); -sin(q2), 0, cos(q2), conj(l1) - conj(l2)*sin(q2); 0, 0, 0, 1];
            D_3_2 = TranslacaoPura(q3,0,0);
            transformacoesPuras = {D_3_2}; % Isso aqui é um cell array. doc: https://www.mathworks.com/help/matlab/cell-arrays.html
            % quando
            [col_Ja_3, T_3_0] = transformacoesCombinadas(T_2_0,transformacoesPuras);
            % entao
            coluna_jacobiano_desejada = [0;0;0;];
            matriz_desejada = [cos(q1)*cos(q2), -sin(q1), cos(q1)*sin(q2), conj(l2)*cos(q1)*cos(q2) + conj(q3)*cos(q1)*cos(q2); cos(q2)*sin(q1), cos(q1), sin(q1)*sin(q2), conj(l2)*cos(q2)*sin(q1) + conj(q3)*cos(q2)*sin(q1); -sin(q2), 0, cos(q2), conj(l1) - conj(l2)*sin(q2) - conj(q3)*sin(q2); 0, 0, 0, 1];
            testCase.assertEqual(col_Ja_3,coluna_jacobiano_desejada);
            testCase.assertEqual(T_3_0,matriz_desejada);
        end
        
        function tresTransformacoesSemMatrizAnterior(testCase)
            % dado
            syms L1 L2 q1;
            D_1_0_P1 = TranslacaoPura(0,L1,0);
            R_y_q1 = RotacaoPura('y',q1);
            D_1_0_P2 = TranslacaoPura(L2,0,0);
            transformacoesPuras = {D_1_0_P1, R_y_q1, D_1_0_P2}; % Isso aqui é um cell array. doc: https://www.mathworks.com/help/matlab/cell-arrays.html
            % quando
            [col_Ja_1,T_1_0] = transformacoesCombinadas(eye(4),transformacoesPuras);
            % então
            coluna_jacobiano_desejada = sym([0;1;0;]);
            matriz_desejada = [cos(q1), 0, sin(q1), conj(L2)*cos(q1); 0, 1, 0, conj(L1); -sin(q1), 0, cos(q1), -conj(L2)*sin(q1); 0, 0, 0, 1];
            testCase.assertEqual(col_Ja_1,coluna_jacobiano_desejada);
            testCase.assertEqual(T_1_0,matriz_desejada);
        end

    end   

end