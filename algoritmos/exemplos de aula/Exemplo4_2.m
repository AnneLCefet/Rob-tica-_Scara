%% Exemplo 4.2 (página 121 do Niku)

syms m1 m2
syms x dx d2x q dq d2q
syms k 
syms L
syms g

M(1,1) = m1 + m2;
M(1,2) = m2*L*cos(q);
M(2,1) = M(1,2);
M(2,2) = m2*L^2;

H(1,1) = -m2*L*sin(q)*dq^2;
H(2,1) = 0;

G(1,1) = k*x;
G(2,1) = m2*g*L*sin(q);

%   T = M*d2q + H + G; => Dinâmica inversa
%   T - H - G = M*d2q
%   d2q = inv(M)*(T - H - G); => Dinâmica direta

open_system('Exemplo4_2Simulink');
       matlabFunctionBlock('Exemplo4_2Simulink/M',M);