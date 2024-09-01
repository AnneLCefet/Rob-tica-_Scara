clc; clear all; close all;

% EXEMPLO 3 DO CAP 6 DO LIVRO DO NIKU (3 ed.): DINAMICA DE UM SISTEMA MASSA-MOLA COM PÊNDULO POR LAGRANGE 
%
%
% DATA: 27/06/24
% Revisao 0

%% 1° PASSO: Definição de variáveis simbólicas
syms m1 m2 v t q1(t) q2(t) dq1(t) dq2(t) L1 L2 g

%% 2° PASSO: Pendulo 1
% Energia Cinetica
vp1_x = dq1*L1*cos(q1);
vp1_y = dq1*L1*sin(q1);

vp1 = [vp1_x; vp1_y; 0];


Ec_p1 = simplify((1/2)*m1*(vp1.'*vp1));
%Ec_p1 = (1/2)*m1*L1^2*dq1^2;

% Energia Potencial
Ep_p1 = -m1*g*L1*cos(q1);


%% 3° PASSO: Pendulo 2
% Energia Cinetica % vou deixar as formulas da posicao tbm pra perguntar pro prof se tem como fazer direto com elas 
posp2_x = L1*sin(q1) + L2*sin(q1 + q2);
posp2_y = -L1*cos(q1) - L2*cos(q1 + q2);

vp2_x = L1*cos(q1)*dq1 + L2*cos(q1 + q2)*(dq1+ dq2);
vp2_y = L1*sin(q1)*dq1 + L2*sin(q1 + q2)*(dq1+ dq2);

vp2 = [vp2_x; vp2_y; 0];

Ec_p2 = simplify((1/2)*m2*(vp2.'*vp2));

% Energia Potencial
Ep_p2 = -m2*g*L1*cos(q1) - m2*g*L2*cos(q1 + q2);

%% 4° PASSO: Energia Cinetica total e Energia Potencial total
Ec = Ec_p1 + Ec_p2;
 
Ep = Ep_p1 + Ep_p2;
 


%~~~~~~~~~~~~~~~~~~~~~~ Esta parte abaixo acho que nao vai usar, pq vamos calcular T direto com Ep e Ec ~~~~~~~~~~~~~~~~~~~~  
%% 5° PASSO: Lagrangiano
% L = Ec - Ep;
% 
%
%% 6° PASSO: Calculo de T
% T1 = simplify(acha_T(L, t, q1, dq1));
% T2 = simplify(acha_T(L, t, q2, dq2));
% 
% T = [T1; T2]


