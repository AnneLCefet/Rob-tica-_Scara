classdef TranslacaoPura
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        MatrizTranslacao
    end

    methods
        function obj = TranslacaoPura(deslocamentoEixoX,deslocamentoEixoY,deslocamentoEixoZ)
            %UNTITLED3 Construct an instance of this class
            %   Detailed explanation goes here
            obj.MatrizTranslacao = [[eye(3), [deslocamentoEixoX deslocamentoEixoY deslocamentoEixoZ]']; [0 0 0 1]];
        end
    end
    
end