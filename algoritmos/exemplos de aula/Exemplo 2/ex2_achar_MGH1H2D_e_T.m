clc; clear all; close all;

%% Variaveis Simbolicas
syms L I1 m1 I2 m2 x q dx dq d2x d2q k g

%% Energia Cinetica e Energia Potencial (pegue do arquivo achar_Ec_Ep) 
% Energia Cinética (Ec)
Ec = (m1*dx^2)/2 + (m2*((dx + L*cos(q)*dq)^2 + L^2*sin(q)^2*dq^2))/2;

% Energia Potencial (Ep)
Ep = (k*x^2)/2 - L*g*m2*(cos(q) - 1);

%% Achando matrizes
q = [x; q]
dq = [dx; dq];
d2q = [d2x; d2q];

% Achar matrizes M, G e H (H ainda nao separado em H1 e H2 (centripeta e coriolis)) 
for linha = 1:1:length(q),
    for coluna = 1:1:length(q),
        M(linha, coluna) = diff(diff(Ec, dq(linha)), dq(coluna));
    end
    G(linha, 1) = diff(Ep, q(linha));
    H(linha, 1) = jacobian(diff(Ec, dq(linha)), q)*dq - diff(Ec, q(linha));
    %D(linha,1) = diff(Ed,dq(linha));
end

% Achando T sem separar Hs. A primeira e a segunda linha sao torques 
T1 = M*d2q+H+G;

for linha = 1:1:length(q),
    for coluna = 1:1:length(q),
        H1aux(linha, coluna) = diff(diff(H(linha), dq(coluna)), dq(coluna))/2;
    end
end
H1 = H1aux*dq.^2;
H2 = H-H1;

% Deixando as matrizes visualmente melhores  
M = simplify(M);
G = simplify(G);
H = simplify(H);
H1 = simplify(H1);
H2 = simplify(H2);

% Achando T separando Hs. A primeira e a segunda linha sao torques 
T2 = M*d2q+H1+H2+G;

% Deixando os Ts visualmente melhores (T1 tem que ser igual a T2) 
T1 = simplify(T1)
T2 = simplify(T2)