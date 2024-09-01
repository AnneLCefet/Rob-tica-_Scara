clear all, close all, clc
%% Primeiro exercício
%
% Modelagem cinemática direta de um manipular, sem o pulso, do tipo
% antropomórfico - RRR (R - Junta de revolução, R - Junta de revolução, R - Junta
% de revolução).
%
% Autor:            Luciano S. C. Raptopoulos
% Revidor:  
% Data:             08/12/2021
% Data da revisão:  

%% Definição das variáveis e constantes
syms q1 q2 q3 dq1 dq2 dq3 d2q1 d2q2 d2q3
q = [q1; q2; q3];
dq = [dq1; dq2; dq3];
d2q = [d2q1; d2q2; d2q3];

syms L1 L2 L3

%% Construir as matrizes de transformação
R1_0 = [cos(q1) -sin(q1) 0 0; sin(q1) cos(q1) 0 0; 0 0 1 0; 0 0 0 1];
D1_0 = [1 0 0 0; 0 1 0 0; 0 0 1 L1; 0 0 0 1];
T1_0 = R1_0*D1_0;

R2_1 = [cos(q2) 0 sin(q2) 0; 0 1 0 0; -sin(q2) 0 cos(q2) 0; 0 0 0 1];
D2_1 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2_1 = R2_1*D2_1;
T2_0 = T1_0*T2_1;

R3_2 = [cos(q3) 0 sin(q3) 0; 0 1 0 0; -sin(q3) 0 cos(q3) 0; 0 0 0 1];
D3_2 = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T3_2 = R3_2*D3_2;
T3_0 = simplify(T2_0*T3_2);

%% Determinar os vetores posição
p1_0 = T1_0(1:3,4);
p2_0 = T2_0(1:3,4);
p3_0 = T3_0(1:3,4);

%% Construir os Jacobianos lineares e calcular as velocidades lineares
JL1_0 = jacobian(p1_0,q);
v1_0 = JL1_0*dq;

JL2_0 = simplify(jacobian(p2_0,q));
v2_0 = simplify(JL2_0*dq);

JL3_0 = simplify(jacobian(p3_0,q));
v3_0 = simplify(JL3_0*dq);

%% Construir as derivadas temporais dos Jacobianos lineares e calcular as acelerações lineares
dJL1_0 = simplify([jacobian(JL1_0(:,1),q)*dq jacobian(JL1_0(:,2),q)*dq jacobian(JL1_0(:,3),q)*dq]);
a1_0 = simplify(dJL1_0*dq + JL1_0*d2q);

dJL2_0 = simplify([jacobian(JL2_0(:,1),q)*dq jacobian(JL2_0(:,2),q)*dq jacobian(JL2_0(:,3),q)*dq]);
a2_0 = simplify(dJL2_0*dq + JL2_0*d2q);

dJL3_0 = simplify([jacobian(JL3_0(:,1),q)*dq jacobian(JL3_0(:,2),q)*dq jacobian(JL3_0(:,3),q)*dq]);
a3_0 = simplify(dJL3_0*dq + JL3_0*d2q);

%% Construir os jacobianos angulares e calcular as velocidades angulares
JA1_0 = [T1_0(1:3,3) zeros(3,1) zeros(3,1)];
w1_0 = JA1_0*dq;

JA2_0 = [T1_0(1:3,3) T2_0(1:3,2) zeros(3,1)];
w2_0 = JA2_0*dq;

JA3_0 = [T1_0(1:3,3) T2_0(1:3,2) T3_0(1:3,2)]
w3_0 = JA3_0*dq

%% Construir as derivadas temporais dos jacobianos angulares e calcular as acelerações angulares
dJA1_0 = simplify([jacobian(JA1_0(:,1),q)*dq jacobian(JA1_0(:,2),q)*dq jacobian(JA1_0(:,3),q)*dq]);
dw1_0 = simplify(dJA1_0*dq + JA1_0*d2q);

dJA2_0 = simplify([jacobian(JA2_0(:,1),q)*dq jacobian(JA2_0(:,2),q)*dq jacobian(JA2_0(:,3),q)*dq]);
dw2_0 = simplify(dJA2_0*dq + JA2_0*d2q);

dJA3_0 = simplify([jacobian(JA3_0(:,1),q)*dq jacobian(JA3_0(:,2),q)*dq jacobian(JA3_0(:,3),q)*dq]);
dw3_0 = simplify(dJA3_0*dq + JA3_0*d2q);

%% Validação as equações de posição

q1 = 0; q2 = 0; q3 = 0; dq2 = 0; dq3 = 0; d2q2 = 0; d2q3 = 0;
subs(a3_0)

% Testar valores "fáceis e conhecidos" para validar as equações (entradas
% conhecidas e saídas conhecidas). Se convergirem para o resultado
% esperado, então o modelo está correto! Testar valores em todos os
% quadrantes de movimento.





