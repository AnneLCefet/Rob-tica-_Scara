clc; clear all; close all;

% EXEMPLO 5 DO CAP 6 DO LIVRO DO NIKU (3 ed.): DINAMICA DE UM SISTEMA DE 2 GDLs com translação 
%
%
% DATA: 21/07/24
% Revisao 0

%% 1° PASSO: Definicao de variaveis simbalicas
syms m1 m2 v t q(t) r(t) dq(t) dr(t) L1 L2 g I1 I2

%% 2° PASSO: Braco 1
% ENERGIA CINETICA

I1 = (1/3)*m1*L1^2;

Ec1 = (1/2)*I1*dq^2;

% ENERGIA POTENCIAL
Ep1 = m1*g*(L1/2)*sin(q);


%% 3° PASSO: Braco 2
% ENERGIA CINETICA
% Como esse braco gira (por causa do primeiro) e translada de novo na reta do primeiro braco
% temos a energia cinetica de translacao e a de rotacao

% Translacao
vd_x = dr*cos(q) - dq*r*sin(q);
vd_y = dr*sin(q) + dq*r*cos(q);

vd = [vd_x; vd_y; 0];

Ec2_trans = simplify((1/2)*m2*(vd.'*vd));


% Rotacao
I2 = (1/12)*m2*L2^2;

Ec2_rot = (1/2)*I2*dq^2;


% Energia cinetica total do braco 2
Ec2 = Ec2_rot + Ec2_trans;

% ENERGIA POTENCIAL
Ep2 = m2*g*r*sin(q);


%% 4° PASSO: Energia Cinetica total e Energia Potencial total
Ec = simplify(Ec1 + Ec2); 

Ep = simplify(Ep1 + Ep2); 



%~~~~~~~~~~~~~~~~~~~~~~ Esta parte abaixo acho que nao vai usar, pq vamos calcular T direto com Ep e Ec ~~~~~~~~~~~~~~~~~~~~ 
% %% 5° PASSO: Lagrangiano
% L = Ec - Ep;
% 
% %% 6° PASSO: Calculo de T
% T = simplify(acha_T(L, t, q, dq));
% F = simplify(acha_F(L, t, r, dr));
% 
% vet = [T; F]

