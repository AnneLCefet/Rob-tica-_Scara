clc; clear all; close all;

% EXEMPLO 1 DO CAP 6 DO LIVRO DO NIKU (3 ed.): DINAMICA DE UM SISTEMA MASSA-MOLA POR LAGRANGE 
%
%
% DATA: 26/06/24
% Revisao 0

%% 1° PASSO: Definicao de varaveis simbolicas
syms m v x(t) dx(t) k t

%% 2° PASSO: Equacoes
Ec = (1/2)*m*dx^2; % Energia cinética 
Ep = (1/2)*k*x^2;  % Energia potencial



%~~~~~~~~~~~~~~~~~~~~~~ Esta parte abaixo acho que nao vai usar, pq vamos calcular T direto com Ep e Ec ~~~~~~~~~~~~~~~~~~~~ 
% L = Ec - Ep;
% 
% F = diff(diff(L, dx), t) - diff(L, x);
% 
% simplify(F)
