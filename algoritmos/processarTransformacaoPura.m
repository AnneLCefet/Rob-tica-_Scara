function [indiceColuna, matriz] = processarTransformacaoPura(transformacao)
% processarTransformacaoPura - Processa uma transformação pura e retorna o 
% índice da coluna e a matriz de transformação associada.
%
% Entrada:
% transformacao - Objeto de transformação que pode ser uma RotacaoPura ou 
% outra TranslacaoPura. Dependendo do tipo, o código irá acessar diferentes
% propriedades.
%
% Saídas:
% indiceColuna - O índice do eixo de rotação, ou -1 se for uma transformação 
% de translação.
% matriz - A matriz associada à transformação (rotação ou translação).

    % Define o valor de retorno padrão para índice de coluna (sem rotação)
    INDICE_INVALIDO = -1;

    % Verifica se a transformação é do tipo 'RotacaoPura'. OBS: isa() é um 
    % método semelhante ao "instanceof()" do java
    if isa(transformacao, 'RotacaoPura')
        % Para rotações puras, obtém a coluna do eixo e a matriz de rotação
        indiceColuna = transformacao.ColunaEixo;
        matriz = transformacao.MatrizRotacao;
    else
        % Para outras transformações, define o índice como inválido (-1) e
        % retorna a matriz de translação
        indiceColuna = INDICE_INVALIDO;
        matriz = transformacao.MatrizTranslacao;
    end
end
