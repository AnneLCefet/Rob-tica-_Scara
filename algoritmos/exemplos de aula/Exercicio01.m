clear all, close all, clc
%% Primeiro exercício
%
% Modelagem cinemática direta de um manipular, sem o pulso, do tipo
% esférico (R - Junta de revolução, R - Junta de revolução, P - Junta
% prismática).
%
% Autor:            Luciano S. C. Raptopoulos
% Revidor:  
% Data:             01/12/2021
% Data da revisão:

%% Definição de constantes:
syms L1 L2

%% Definição das variáveis:
syms q1 q2 q3

%% Referenciais e suas relações:
%
% Tranformação do referencial {1} para o referencial {0}
%
% Sendo: 
% - {0} o referencial inercial (base do manipulador);
% - {1} o referencial fixo ao final do Elo 1;
% - L1 o comprimemto do Elo 1;
% - q1(t) o grau de liberdade da junta de revolução 1.

R1_0 = [cos(q1) -sin(q1) 0 0; sin(q1) cos(q1) 0 0; 0 0 1 0; 0 0 0 1];
D1_0 = [1 0 0 0; 0 1 0 0; 0 0 1 L1; 0 0 0 1];
T1_0 = simplify(R1_0*D1_0);

% Tranformação do referencial {2} para o referencial {1}. E posteriormente
% para o referencial {0}.
%
% Sendo: 
% - {2} o referencial fixo ao final do Elo 2;
% - L2 o comprimemto do Elo 2;
% - q2(t) o grau de liberdade da junta de revolução 2.

R2_1 = [cos(q2) 0 sin(q2) 0; 0 1 0 0; -sin(q2) 0 cos(q2) 0; 0 0 0 1];
D2_1 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2_1 = simplify(R2_1*D2_1);
T2_0 = simplify(T1_0*T2_1);

% Tranformação do referencial {3} para o referencial {2}. E posteriormente
% para o referencial {0}.
%
% Sendo: 
% - {3} o referencial fixo ao final do Elo 3;
% - q3(t) o grau de liberdade da junta prismática 2.

D3_2 = [1 0 0 q3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T3_2 = D3_2;
T3_0 = simplify(T2_0*T3_2);

%% Posições, com relação ao referencial {0}, de cada junta e da extremidade do manipulador:
p1_0 = T1_0(1:3,4);
p2_0 = T2_0(1:3,4);
p3_0 = T3_0(1:3,4);

%% Simulação para estudo e validação das equações cinemáticas encontradas:

Q1 = linspace(-pi/4,pi/4,100);
%figure(1), plot(Q1,'k*'), grid on, ylabel('q1(t) [rad]')

Q2 = linspace(-pi/3,pi/3,100);
%figure(2), plot(Q2,'k*'), grid on, ylabel('q2(t) [rad]')

Q3 = linspace(0.1,0.5,100);
%figure(3), plot(Q3,'k*'), grid on, ylabel('q3(t) [m]')

L1 = 1;    % [m]
L2 = 0.25; % [m]

x0 = zeros(100,1);
y0 = zeros(100,1);
z0 = zeros(100,1);
x1 = zeros(100,1);
y1 = zeros(100,1);
z1 = zeros(100,1);
x2 = zeros(100,1);
y2 = zeros(100,1);
z2 = zeros(100,1);
x3 = zeros(100,1);
y3 = zeros(100,1);
z3 = zeros(100,1);

n = 1;
x1(n) = 0;
y1(n) = 0;
z1(n) = L1;
x2(n) = L2*cos(Q1(n))*cos(Q2(n));
y2(n) = L2*cos(Q2(n))*sin(Q1(n));
z2(n) = L1 - L2*sin(Q2(n));
x3(n) = cos(Q1(n))*cos(Q2(n))*(L2 + Q3(n));
y3(n) = cos(Q2(n))*sin(Q1(n))*(L2 + Q3(n));
z3(n) = L1 - L2*sin(Q2(n)) - Q3(n)*sin(Q2(n));

figure(7),
h1 = plot3(x0(n),y0(n),z0(n),'ko'); grid on, hold on
h2 = plot3(x1(n),y1(n),z1(n),'bo'); 
h3 = plot3(x2(n),y2(n),z2(n),'ro'); 
h4 = plot3(x3(n),y3(n),z3(n),'go'); 

h5 = line([x0(n) x1(n)],[y0(n) y1(n)],[z0(n) z1(n)]);
h6 = line([x1(n) x2(n)],[y1(n) y2(n)],[z1(n) z2(n)]);
h7 = line([x2(n) x3(n)],[y2(n) y3(n)],[z2(n) z3(n)]);
axis([-1.5 1.5 -1.5 1.5 0 2])

for n = 2:1:length(Q1),
    x1(n) = 0;
    y1(n) = 0;
    z1(n) = L1;
    x2(n) = L2*cos(Q1(n))*cos(Q2(n));
    y2(n) = L2*cos(Q2(n))*sin(Q1(n));
    z2(n) = L1 - L2*sin(Q2(n));
    x3(n) = cos(Q1(n))*cos(Q2(n))*(L2 + Q3(n));
    y3(n) = cos(Q2(n))*sin(Q1(n))*(L2 + Q3(n));
    z3(n) = L1 - L2*sin(Q2(n)) - Q3(n)*sin(Q2(n));
    
    pause(0.5)
    
    set(h1,'Visible','off')
    set(h2,'Visible','off')
    set(h3,'Visible','off')
    set(h4,'Visible','off')
    set(h5,'Visible','off')
    set(h6,'Visible','off')
    set(h7,'Visible','off')
    
    h1 = plot3(x0(n),y0(n),z0(n),'ko'); 
    h2 = plot3(x1(n),y1(n),z1(n),'bo'); 
    h3 = plot3(x2(n),y2(n),z2(n),'ro'); 
    h4 = plot3(x3(n),y3(n),z3(n),'go'); 
    
    h5 = line([x0(n) x1(n)],[y0(n) y1(n)],[z0(n) z1(n)]);
    h6 = line([x1(n) x2(n)],[y1(n) y2(n)],[z1(n) z2(n)]);
    h7 = line([x2(n) x3(n)],[y2(n) y3(n)],[z2(n) z3(n)]);
end

figure(4), 
subplot(3,1,1), plot(x1,'k'), grid on, ylabel('x1 [m]')
subplot(3,1,2), plot(y1,'k'), grid on, ylabel('y1 [m]')
subplot(3,1,3), plot(z1,'k'), grid on, ylabel('z1 [m]')

figure(5), 
subplot(3,1,1), plot(x2,'k'), grid on, ylabel('x2 [m]')
subplot(3,1,2), plot(y2,'k'), grid on, ylabel('y2 [m]')
subplot(3,1,3), plot(z2,'k'), grid on, ylabel('z2 [m]')

figure(6), 
subplot(3,1,1), plot(x3,'k'), grid on, ylabel('x3 [m]')
subplot(3,1,2), plot(y3,'k'), grid on, ylabel('y3 [m]')
subplot(3,1,3), plot(z3,'k'), grid on, ylabel('z3 [m]')









