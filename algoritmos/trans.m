function T = trans(dx,dy,dz)
%TRANS Representaçao de uma translaçao pura no espaço
% Descriçao: Essa funçao concatena o vetor de posiçao (em coluna) a uma matriz
% identidade e a um vetor [0 0 0 1] a uma linha.
T = [[eye(3), [dx dy dz]']; [0 0 0 1]];
end