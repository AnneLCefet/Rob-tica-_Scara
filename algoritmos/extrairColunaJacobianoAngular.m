function colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao, indiceM1, indiceM2)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    colunaJacobianoAngular = [0 0 0]';
    indiceColuna = indiceM1;
    if nargin == 3 && indiceM1 == -1
        indiceColuna = indiceM2;    
    end
    if indiceColuna ~= -1
        colunaJacobianoAngular = matrizTransformacao(:,indiceColuna);
        colunaJacobianoAngular(end,:) = [];
    end
end