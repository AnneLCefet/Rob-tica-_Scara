classdef ManipuladorEsfericoTest < matlab.unittest.TestCase

    methods (Test)
        function cinematicaInversaQ1Entre45E135PrimeiroQuadrante(testCase)
            % dado
            x3 = 1;
            y3 = sqrt(3);
            z3 = 4;
            posicao_input = [x3 y3 z3];
            l1 = 5;
            l2 = 1;
            % quando
            elos = cinematicaInversaEsferico(l1,l2,posicao_input);
            % entao
            % opçao 2 foi escolhida
            q1 = pi/3;
            q3 = sqrt(5) - l2;
            q2 = asin((l1-z3)/(q3+l2));
            
            output_desejado = [q1 q2 q3];
            testCase.assertEqual(elos,output_desejado);
        end

        function cinematicaInversaQ1Entre45E135SegundoQuadrante(testCase)
            % dado
            posicao_input = [-1/2 sqrt(3)/2 2];
            l1 = 5;
            l2 = 1;
            % quando
            elos = cinematicaInversaEsferico(l1,l2,posicao_input);
            % entao
            % opçao 2 foi escolhida
            q1 = 2*pi/3;
            q3 = sqrt(10) - l2;
            q2 = asin((l1-z3)/(q3+l2));
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1Entre225E315TerceiroQuadrante(testCase)
            % dado
            x2=-1/2;
            y2=-sqrt(3)/2;
            z2=0.7;
            posicao_input = [x2 y2 z2];
            l1 = 1.2;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 2 foi escolhida
            q1 = 4*pi/3;
            q2 = asin3((l1-z2)/sqrt(1.25));
            q3 = sqrt(1.25);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1Entre225E315QuartoQuadrante(testCase)
            % dado
            x2=1/2;
            y2=-sqrt(3)/2;
            z2=7;
            posicao_input = [x2 y2 z2];
            l1 = 3;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 2 foi escolhida
            q1 = 5*pi/3;
            q2 = asin3((l1-z2)/sqrt(17));
            q3 = sqrt(17);
            output_desejado = [q1 q2 q3];
            testCase.assertEqual(elos,output_desejado);
        end

        function cinematicaInversaQ1MenorQue45EMaiorQue315PrimeiroQuadrante(testCase)
            % dado
            y2=1/2;
            x2=sqrt(3)/2;
            z2=0.3;
            posicao_input = [x2 y2 z2];
            l1 = 0.4;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = pi/6;
            q2 = asin3((l1-z2)/sqrt(1.01));
            q3 = sqrt(1.01);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end
    
        function cinematicaInversaQ1MenorQue45EMaiorQue315QuartoQuadrante(testCase)
            % dado
            y2=-1/2;
            x2=sqrt(3)/2;
            z2=12;
            posicao_input = [x2 y2 z2];
            l1 = 5;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = 11*pi/6;
            q2 = asin3((l1-z2)/sqrt(50));
            q3 = sqrt(50);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1Entre135E225SegundoQuadrante(testCase)
            % dado
            y2=1/2;
            x2=-sqrt(3)/2;
            z2=1.7;
            posicao_input = [x2 y2 z2];
            l1 = 4;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = 5*pi/6;
            q2 = asin3((l1-z2)/sqrt(6.29));
            q3 = sqrt(6.29);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1Entre135E225TerceiroQuadrante(testCase)
            % dado
            y2=-1/2;
            x2=-sqrt(3)/2;
            z2=3;
            posicao_input = [x2 y2 z2];
            l1 = 1.3;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = 7*pi/6;
            q2 = asin3((l1-z2)/sqrt(3.89));
            q3 = sqrt(3.89);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1_Zero(testCase) % Cenario 6.1
            % dado
            y2=0;
            x2=2;
            z2=1;
            posicao_input = [x2 y2 z2];
            l1 = 0.5;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = 0;
            q2 = asin3((l1-z2)/sqrt(4.25));
            q3 = sqrt(4.25);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1_90graus(testCase) % Cenario 6.2
            % dado
            y2=1;
            x2=0;
            z2=0.9;
            posicao_input = [x2 y2 z2];
            l1 = 1.5;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = pi/2;
            q2 = asin3((l1-z2)/sqrt(1.36));
            q3 = sqrt(1.36);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1_180graus(testCase) % Cenario 6.3
            % dado
            y2=0;
            x2=-1;
            z2=0.9;
            posicao_input = [x2 y2 z2];
            l1 = 1.5;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 1 foi escolhida
            q1 = pi;
            q2 = asin3((l1-z2)/sqrt(1.36));
            q3 = sqrt(1.36);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end

        function cinematicaInversaQ1_270graus(testCase) % Cenario 6.4
            % dado
            y2=-1;
            x2=0;
            z2=0.9;
            posicao_input = [x2 y2 z2];
            l1 = 1.5;
            % quando
            elos = inversa_esferico(l1,posicao_input);
            % entao
            % opçao 2 foi escolhida
            q1 = 3*pi/2;
            q2 = asin3((l1-z2)/sqrt(1.36));
            q3 = sqrt(1.36);
            output_desejado = [q1 q2 q3];
            testCase.verifyThat(elos,IsEqualTo(output_desejado,"Within",AbsoluteTolerance(1e-12)));
        end
        
        function cinematicaDireta_e_CinematicaInversa(testCase) % Cenario 7
            x2_inv = 1/2;
            y2_inv = -sqrt(3)/2;
            z2_inv = 7;
            posicao_input_inv = [x2_inv y2_inv z2_inv];
            l1 = 3;

            % Calculo Cinematica Inversa
            elos_inv = inversa_esferico(l1,posicao_input_inv);
            
            % Calculo Cinematica Direta
            matriz_cinematica_direta = direta_esferico(l1,elos_inv);
            
            % Extraindo o vetor de posicao da matriz de cinematica direta
            posicao_output_dir = matriz_cinematica_direta(:,end);
            
            % Removendo a ultima linha, para deixar o vetor 3x1
            posicao_output_dir(end,:) = [];
            
            % Invertendo o vetor para que o assert funcione
            posicao_output_dir = posicao_output_dir';
            
            % A entrada da cinematica inversa deve ser igual a saida da
            % cinematica direta.
            testCase.verifyThat(posicao_output_dir,IsEqualTo(posicao_input_inv,"Within",AbsoluteTolerance(1e-12)));
        end

        
    end   

end

% "import" functions
function result = IsEqualTo(varargin)
result = matlab.unittest.constraints.IsEqualTo(varargin{:});
end
function result = AbsoluteTolerance(varargin)
result = matlab.unittest.constraints.AbsoluteTolerance(varargin{:});
end