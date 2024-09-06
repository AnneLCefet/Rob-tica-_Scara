clc; clear all; close all;

%% Variaveis Simbolicas
syms L1 I1 m1 L2 I2 m2 q r dq dr d2q d2r g

%% Energia Cinetica e Energia Potencial (pegue do arquivo achar_Ec_Ep) 
Ec = (m2*(dq^2*r^2 + dr^2))/2 + (L1^2*m1*dq^2)/6 + (L2^2*m2*dq^2)/24;
Ep = (g*sin(q)*(L1*m1 + 2*m2*r))/2;

%% Achando matrizes
q = [q; r];
dq = [dq; dr];
d2q = [d2q; d2r];

% Achar matrizes M, G e H (H ainda nao separado em H1 e H2 (centripeta e coriolis)) 
for linha = 1:1:length(q),
    for coluna = 1:1:length(q),
        M(linha, coluna) = diff(diff(Ec, dq(linha)), dq(coluna));
    end
    G(linha, 1) = diff(Ep, q(linha));
    H(linha, 1) = jacobian(diff(Ec, dq(linha)), q)*dq - diff(Ec, q(linha));
    %D(linha,1) = diff(Ed,dq(linha));
end

% Achando T sem separar Hs. A primeira linha e torque, a segunda linha e forca 
T1 = M*d2q+H+G;

for linha = 1:1:length(q),
    for coluna = 1:1:length(q),
        H1aux(linha, coluna) = diff(diff(H(linha), dq(coluna)), dq(coluna))/2;
    end
end
H1 = H1aux*dq.^2;
H2 = H-H1;

% Deixando as matrizes visualmente melhores  
M_symbolic = simplify(M);
G_symbolic = simplify(G);
H_symbolic = simplify(H);
H1_symbolic = simplify(H1);
H2_symbolic = simplify(H2);

% Achando T separando Hs. A primeira e a segunda linha sao torques 
T2 = M_symbolic*d2q+H1_symbolic+H2_symbolic+G_symbolic;

% Deixando os Ts visualmente melhores (T1 tem que ser igual a T2) 
T1_symbolic = simplify(T1)
T2_symbolic = simplify(T2)


%% Inicializando constantes
g_num = 9.81;
m1_num = 20;
m2_num = 5;
L1_num = 2;
L2_num = .5;

%% Atribuindo valores das constantes à equações
M = subs(M_symbolic, [g,m1,m2,L1,L2], [g_num,m1_num,m2_num,L1_num,L2_num]);
G = subs(G_symbolic, [g,m1,m2,L1,L2], [g_num,m1_num,m2_num,L1_num,L2_num]);
H = subs(H_symbolic, [g,m1,m2,L1,L2], [g_num,m1_num,m2_num,L1_num,L2_num]);

matlabFunctionBlock('simulacao_4_5/matriz_massa_M',M);
matlabFunctionBlock('simulacao_4_5/gravidade_G',G);
matlabFunctionBlock('simulacao_4_5/centrifuga_coriolis_H',H);