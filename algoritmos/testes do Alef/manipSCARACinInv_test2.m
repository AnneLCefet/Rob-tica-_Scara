clc; clear all; close all;

% [x y z] = [0.7 1 0] L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: q = [0 0 0] OK

% [x y z] = [0.6414    1.0000   -0.1414] L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: q = [0 45 0] OK, q1_pos e q2_pos  
% [x y z] = [0.6414    0.5000   -0.1414] L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: q = [0 45 -.5] OK, q1_pos e q2_pos  
% [x y z] = [0.2000    1.0000   -0.5000] L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: q = [90 -90 0] OK, q1_neg e q2_neg  



L1 = 1; % cm
L2 = .5; % cm
L3 = .2; % cm
%Lf = .2; % cm

x = 0.2000; % cm
y = 1; % cm
z = -.5000; % cm

% DÚVIDA: qnd usar o acos negativo e quando usar positivo?
% %q2 = acos((x^2 + y^2 - L2^2- L3^2)/(2*L2*L3));
% q2 = -acos((x^2 + y^2 - L2^2- L3^2)/(2*L2*L3));
% q1 = atan2(-L3*sin(q2)*x+ (L2 + L3*cos(q2))*y, (L2 + L3*cos(q2))*x+ L3*sin(q2)*y);
% 
% q1 = rad2deg(q1)
% q2 = rad2deg(q2)

q2_pos = acos((x^2 + z^2 - L2^2 - L3^2) / (2*L2*L3));  % Configuração cotovelo para cima
q2_neg = -acos((x^2 + z^2 - L2^2 - L3^2) / (2*L2*L3));  % Configuração cotovelo para baixo

% Agora calcular q1 para ambos os casos
q1_pos = atan2(-L3*sin(q2_pos)*x - (L2 + L3*cos(q2_pos))*z, (L2 + L3*cos(q2_pos))*x - L3*sin(q2_pos)*z);
q1_neg = atan2(-L3*sin(q2_neg)*x - (L2 + L3*cos(q2_neg))*z, (L2 + L3*cos(q2_neg))*x - L3*sin(q2_neg)*z);

% Converter para graus
q1_pos = rad2deg(q1_pos);
q2_pos = rad2deg(q2_pos);

q1_neg = rad2deg(q1_neg);
q2_neg = rad2deg(q2_neg);

q3 = y - L1;

% Exibir ambos para comparacao
disp(['q1 (cotovelo para cima): ', num2str(q1_pos), ', q2 (cotovelo para cima): ', num2str(q2_pos), ', q3 (cotovelo para cima): ', num2str(q3)]);
disp(['q1 (cotovelo para baixo): ', num2str(q1_neg), ', q2 (cotovelo para baixo): ', num2str(q2_neg), ', q3 (cotovelo para cima): ', num2str(q3)]);


