function [colunaJacobianoAngular,matrizTransformacao] = transformacoesCombinadas(matrizTransformacaoAnterior, transformacao1, transformacao2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [indiceM1,matriz1] = processarTransformacaoPura(transformacao1);
    if nargin == 2 && ~isequal(matrizTransformacaoAnterior,zeros(4))
        matrizTransformacao = matrizTransformacaoAnterior*matriz1;
        colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao,indiceM1);
    elseif nargin == 2 && isequal(matrizTransformacaoAnterior,zeros(4))
        matrizTransformacao = matriz1;
        colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao,indiceM1);
    elseif isequal(matrizTransformacaoAnterior,zeros(4))
        [indiceM2,matriz2] = processarTransformacaoPura(transformacao2);
        matrizTransformacao = matriz1*matriz2;
        colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao,indiceM1,indiceM2);
    else
        [indiceM2,matriz2] = processarTransformacaoPura(transformacao2);
        matrizTransformacao = matrizTransformacaoAnterior*matriz1*matriz2;
        colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao,indiceM1,indiceM2);
    end
end

