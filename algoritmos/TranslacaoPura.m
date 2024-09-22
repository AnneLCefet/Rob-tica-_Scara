classdef TranslacaoPura
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        MatrizTranslacao
    end

    methods
        function obj = TranslacaoPura(vetorDeslocamento)
            %UNTITLED3 Construct an instance of this class
            %   Detailed explanation goes here
            obj.MatrizTranslacao = [[eye(3), vetorDeslocamento]; [0 0 0 1]];
        end
    end
    
end