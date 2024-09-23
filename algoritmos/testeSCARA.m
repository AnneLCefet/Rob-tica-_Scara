clear; close all; clc

% Altura da base
syms L0; 
% Comprimento dos elos:
syms L1 L2 Lf;
% Coordenadas dos centros de massa:
syms cm1_x cm1_y cm1_z cm2_x cm2_y cm2_z cm3_x cm3_y cm3_z cm4_x cm4_y cm4_z cm5_x cm5_y cm5_z;
% Coordenadas gerais do mecanismo:
syms q1 q2 q3 q4 dq1 dq2 dq3 dq4 d2q1 d2q2 d2q3 d2q4;

% x5_inv = 0.4;
% y5_inv = 0.5;
% z5_inv = -0.4;

L1_num = 0.525;  % Primeiro corpo móvel
L2_num = 0.330;  % Segundo corpo móvel
Lf_num = 0.07673;  % Ferramenta
q3_max = 0.22331;
PQ_0 = [.6828; .3; -.2828]; % [x5_inv; y5_inv; z5_inv];
dPQ_0 = [0;0;0];
d2PQ_0 = [0;0;0];

P_1 = [L1; 0; 0];
P_2 = [L2; 0; 0];
P_3 = [0; q3; 0];
P_5 = [0; Lf; 0]; % ferramenta

theta5 = 0; % zero = ferramenta paralela ao referencial base

% Matriz de cinemática direta
T_5_0_test = [cos(q1 + q2 + q4), 0, sin(q1 + q2 + q4), L2*cos(q1 + q2) + L1*cos(q1); 0, 1, 0, Lf + q3; -sin(q1 + q2 + q4), 0, cos(q1 + q2 + q4), - L2*sin(q1 + q2) - L1*sin(q1); 0, 0, 0, 1];

% Calculo Cinematica Inversa
[juntas_inv, vel_juntas, acel_juntas] = cinematica_inversa_SCARA(L1_num, L2_num, Lf_num, PQ_0,dPQ_0, d2PQ_0, theta5);
juntas = eval(subs(juntas_inv, ...
    [L1, L2, Lf], ...
    [L1_num, L2_num, Lf_num]))'

% Calculo Cinematica Direta
[JA_1_0, JA_2_0, JA_3_0, JA_4_0, T_1_0, T_2_0, T_3_0, T_4_0, T_5_0, P_1_0, P_2_0, P_3_0, P_4_0, P_5_0] = cinematicaDiretaSCARA(P_1, P_2, P_3, P_5, juntas);

vel_juntas

acel_juntas


PQ_0

P_5_0 = eval(subs(P_5_0, ...
    [L1, L2, Lf,q3], ...
    [L1_num, L2_num, Lf_num,q3_max]))


