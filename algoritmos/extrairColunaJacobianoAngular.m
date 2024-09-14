function colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao, indiceJacobianoAnterior, indiceJacobianoAtual)
% extrairColunaJacobianoAngular - Extrai a coluna angular do Jacobiano a
% partir de uma matriz de transformação homogênea.
%
% matrizTransformacao - Matriz de transformação de onde será extraída a coluna
% indiceJacobianoAnterior - Índice da coluna anterior do Jacobiano
% indiceJacobianoAtual - Índice atual da coluna do Jacobiano

    % Verifica qual índice usar (anterior ou atual)
    if indiceJacobianoAnterior == -1
        indiceColuna = indiceJacobianoAtual;
    else
        indiceColuna = indiceJacobianoAnterior;
    end
    
    % Inicializa a coluna Jacobiano angular como vetor coluna nulo (3x1)
    colunaJacobianoAngular = zeros(3, 1);
    
    % Se o índice for válido, extrai a coluna da matriz
    if indiceColuna ~= -1
        % Extrai as primeiras três linhas da coluna correspondente
        colunaJacobianoAngular = matrizTransformacao(1:3, indiceColuna);
    end
end
