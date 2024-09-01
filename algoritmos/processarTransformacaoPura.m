function [indiceColuna,matriz] = processarTransformacaoPura(transformacao)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
    % Método semelhante ao "instanceof" do java
    if isa(transformacao,'RotacaoPura')
        indiceColuna = transformacao.ColunaEixo;
        matriz = transformacao.MatrizRotacao;
    else
        indiceColuna = -1;
        matriz = transformacao.MatrizTranslacao;
    end
end