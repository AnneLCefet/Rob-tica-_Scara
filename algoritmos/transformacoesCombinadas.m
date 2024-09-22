function [colunaJacobianoAngular, matrizTransformacao] = transformacoesCombinadas(matrizTransformacaoAnterior, transformacoesPuras)
    % transformacoesCombinadas - Aplica uma série de transformações puras e
    % extrai a coluna angular do Jacobiano após cada transformação.
    %
    % Entradas:
    % matrizTransformacaoAnterior - A matriz de transformação anterior, que será
    % usada como ponto de partida.
    % transformacoesPuras - Um array de transformações puras que serão aplicadas
    % sequencialmente.
    %
    % Saídas:
    % colunaJacobianoAngular - A última coluna angular do Jacobiano extraída.
    % matrizTransformacao - A matriz de transformação final após todas as
    % transformações.
    
    % Inicializa a matriz de transformação com a anterior
    matrizTransformacao = matrizTransformacaoAnterior;
    
    % Inicializa o índice Jacobiano anterior como -1 (indicando inválido)
    indiceJacobianoAnterior = -1;
    
    % Inicializa a coluna Jacobiano angular como vetor nulo (3x1)
    colunaJacobianoAngular = zeros(3, 1);
    
    % Itera sobre as transformações puras
    for i = 1:numel(transformacoesPuras)
        % Processa a transformação pura atual
        [indiceJacobianoAtual, matriz] = processarTransformacaoPura(transformacoesPuras{i});
        
        % Atualiza a matriz de transformação combinada
        matrizTransformacao = simplify(matrizTransformacao * matriz);
        
        % Extrai a coluna angular do Jacobiano com base na matriz de transformação
        colunaJacobianoAngular = extrairColunaJacobianoAngular(matrizTransformacao, indiceJacobianoAnterior, indiceJacobianoAtual);
        
        % Atualiza o índice Jacobiano anterior para a próxima iteração
        indiceJacobianoAnterior = indiceJacobianoAtual;
    end
end