clc; clear all; close all;

% EXEMPLO 2 DO CAP 6 DO LIVRO DO NIKU (3 ed.): DINAMICA DE UM SISTEMA MASSA-MOLA COM PÊNDULO POR LAGRANGE 
%
%
% DATA: 26/06/24
% Revisao 0

%% 1° PASSO: Definição de variáveis simbólicas
syms m1 m2 v x(t) dx(t) k t q(t) dq(t) L g

%% 2° PASSO: Energias Cinéticas
% Energia cinética do carro
Ec_c = (1/2)*m1*dx^2;

% Velocidade do pêndulo em relação ao carrinho
velpemc = [L*dq*cos(q); L*dq*sin(q); 0];

% Velocidade total do pêndulo
velp = dx*[1; 0; 0] + velpemc;

% Energia cinética do pêndulo
Ec_p = (1/2)*m2*(velp.'*velp);

% Energia cinética total
Ec = Ec_c + Ec_p;

%% 3° PASSO: Energias Potenciais
% Energia potencial do carro (como referência)
Ep_c = (1/2)*k*x^2;

% Energia potencial do pêndulo
Ep_p = m2*g*L*(1 - cos(q));

% Energia potencial total
Ep = Ep_c + Ep_p;



%~~~~~~~~~~~~~~~~~~~~~~ Esta parte abaixo acho que nao vai usar, pq vamos calcular T direto com Ep e Ec ~~~~~~~~~~~~~~~~~~~~ 
%% 4° PASSO: Lagrangiano
% L = Ec - Ep;
% 
% %% 5° PASSO: Derivadas das equações de movimento LINEAR 
% 
% F = acha_F(L, t, x, dx)
% 
% 
% %% 6° PASSO: Derivadas das equações de movimento de ROTAÇÃO
% 
% T = acha_T(L, t, q, dq);

