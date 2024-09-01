function elos = cinematicaInversaEsferico(l1, l2, posicao_desejada)
    %INVERSA_ESFERICO .......
    % RRP
    x2 = posicao_desejada(1);
    y2 = posicao_desejada(2);
    z2 = posicao_desejada(3);
    
    % usando funcao de tangente inversa com angulo ajustado
    q1 = atan3(y2,x2);
    
    if(q1 <= 3*pi/4 && q1 >= pi/4) || (q1 >= 5*pi/4 && q1 <= 7*pi/4)
        % executa a opcao 2
        q3 = sqrt( (y2/sin(q1))^2 + (l1-z2)^2 ) - l2;
    else
        % executa a opcao 1
        q3 = sqrt( (x2/cos(q1))^2 + (l1-z2)^2 ) - l2;
    end

    q2 = asin3((l1-z2)/(q3+l2));
    
    elos(1) = q1;
    elos(2) = q2;
    elos(3) = q3;
end