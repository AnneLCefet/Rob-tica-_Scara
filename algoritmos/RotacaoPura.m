classdef RotacaoPura
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        ColunaEixo
        Angulo
        MatrizRotacao
    end

    methods
        function obj = RotacaoPura(eixo,angulo)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Angulo = angulo;
            switch eixo
                case 'x'
                    obj.MatrizRotacao = rot_x(angulo);
                    obj.ColunaEixo = 1;
                case 'y'
                    obj.MatrizRotacao = rot_y(angulo);
                    obj.ColunaEixo = 2;
                case 'z'
                    obj.MatrizRotacao = rot_z(angulo);
                    obj.ColunaEixo = 3;
                otherwise
                    exception = MException('RotacaoPura:eixoInvalido', ...
                        ['Eixo "%s" informado invalido, ' ...
                        'escolha entre "x", "y" ou "z"'], eixo);
                    throw(exception)
            end    
        end
    end
    
end