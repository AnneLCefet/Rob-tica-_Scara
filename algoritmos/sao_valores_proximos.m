function sao_proximos = sao_valores_proximos(numero1,numero2)
    tolerancia=0.1;
    diferenca = abs(numero1 - numero2);
    if diferenca <= tolerancia
        sao_proximos = 1;
    else
        sao_proximos = 0;
    end
end