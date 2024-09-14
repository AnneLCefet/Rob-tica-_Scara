clc; clear all; close all;
% q1 = 0, q2 = 0, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.7 1 0] OK

% q1 = 45, q2 = 0, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.495 1 -0.495] OK
% q1 = 0, q2 = 45, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.6414    1.0000   -0.1414] OK
% q1 = 0, q2 = 45, q3 = -0.5, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.6414    0.5000   -0.1414] OK
% q1 = 90, q2 = -90, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.2000    1.0000   -0.5000] OK

% q1 = -45, q2 = 0, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.4950    1.0000    0.4950] OK
% q1 = 0, q2 = -45, q3 = 0, q4 = 0, L1 = 1, L2 = 0.5, L3 = 0.2, Lf = 0.2 | resultado esperado: [0.6414    1.0000    0.1414] OK

q1 = 90; % °
q2 = -90; % °
q3 = 0; % cm    
q4 = 0; % °
L1 = 1; % cm
L2 = .5; % cm
L3 = .2; % cm
%Lf = .2; % cm

q1 = deg2rad(q1); q2 = deg2rad(q2); q4 = deg2rad(q4);   
 
x = L3*cos(q1 + q2) + L2*cos(q1)
y = L1 + q3
z = -L3*sin(q1 + q2) - L2*sin(q1)

[x y z]
