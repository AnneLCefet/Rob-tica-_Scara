clc; clear all; close all;

% EXEMPLO 4 DO CAP 6 DO LIVRO DO NIKU (3 ed.): DINAMICA DE UM SISTEMA DE DOIS BRAÇOS COM PÊNDULO POR LAGRANGE 
%
%
% DATA: 02/07/24
% Revisao 0

%% 1° PASSO: Definição de variáveis simbólicas
syms m1 m2 v t q1(t) q2(t) dq1(t) dq2(t) L1 L2 g Ia Id

%% 2° PASSO: Braco 1
% ENERGIA CINETICA

Ia = (1/3)*m1*L1^2;

Ec1 = (1/2)*Ia*dq1^2;

% ENERGIA POTENCIAL
Ep1 = m1*g*(L1/2)*sin(q1);


%% 3° PASSO: Braco 2
% ENERGIA CINETICA
% Como esse braco translada (por causa do primeiro) e gira (em torno de seu centro de massa),  
% temos a energia cinetica de translacao e a de rotacao

% Translacao
vd_x = -dq1*L1*sin(q1) - (dq1 + dq2)*(L2/2)*sin(q1 + q2);
vd_y = dq1*L1*cos(q1) + (dq1 + dq2)*(L2/2)*cos(q1 + q2);

vd = [vd_x; vd_y; 0];

Ec2_trans = simplify((1/2)*m2*(vd.'*vd));


% Rotacao
Id = (1/12)*m2*L2^2;

Ec2_rot = (1/2)*Id*(dq1 + dq2)^2;


% Energia cinetica total do braco 2
Ec2 = Ec2_rot + Ec2_trans;

% ENERGIA POTENCIAL
Ep2 = m2*g*(L1*sin(q1) + (L2/2)*sin(q1 + q2));


%% 4° PASSO: Energia Cinetica total e Energia Potencial total
Ec = simplify(Ec1 + Ec2); % 25/07/02 verificado. está certo

Ep = simplify(Ep1 + Ep2); % 25/07/02 verificado. está certo



%~~~~~~~~~~~~~~~~~~~~~~ Esta parte abaixo acho que nao vai usar, pq vamos calcular T direto com Ep e Ec ~~~~~~~~~~~~~~~~~~~~
% %% 5° PASSO: Lagrangiano
% L = Ec - Ep;
% 
% %% 6° PASSO: Calculo de T
% T1 = simplify(acha_T(L, t, q1, dq1));
% T2 = simplify(acha_T(L, t, q2, dq2));
% 
% T = [T1; T2]