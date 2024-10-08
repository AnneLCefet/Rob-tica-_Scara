function naoEstaNaAreaDeTrabalho = areaDeTrabalhoInvalida(x, y, z, L1, L2, L0)
    % Constantes para os cálculos dos limites da área de trabalho
    r_max = L1 + L2 * cosd(1);      % Raio máximo no plano XZ
    r_min = L1 - L2 * cosd(30);     % Raio mínimo no plano XZ
    y_max = 0;                      % Altura máxima em Y
    y_min = -L0;                   % Altura mínima em Y

    % Cálculo do raio no plano XZ
    r_xz = sqrt(x^2 + z^2);
    
    % Verificar se o ponto está dentro do raio permitido no plano XZ
    estaNoXZ = (r_min <= r_xz) && (r_xz <= r_max);
    
    % Verificar se o ponto está dentro da altura permitida no eixo Y
    estaNoY = (y_min <= y) && (y <= y_max);
    
    % O ponto está na área de trabalho se estiver dentro dos dois limites
    naoEstaNaAreaDeTrabalho = ~estaNoXZ || ~estaNoY;
end