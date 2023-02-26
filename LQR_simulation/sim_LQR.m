clc; clear; close all;

%Parameters for matematical model
l_B = 0.132; % [m] Base langth. 13.2cm measured.
l_P = 0.21; % [m] Pendulum length. 24cm measured.
I_B = 2.1*(1/12)*0.05*0.25^2; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
I_P = (1/3)*0.010*0.25^2*1; % [kg*m^2] Pendulum inertia (about mass centre). Estimated with mass = 10g
m_P = 0.026 * 1; % [kg] Pendulum mass. 26g measured
B_B = 0.00048*2;%0.01; % [Nm*rad/s] Motor friction.
B_P = 0.00025; % [Nm*rad/s] Penulum friction.
g = 9.81; % [m/s^2] gravity.

%Motor parameters
L = 1.3/1000 * 1;; % [Henry] Motor inductance. From random data sheet
R = 5; % [Omh] Motor resistance.
K_t = 0.089240515 ; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515 * 0.7; % [V/(rad/s)] Motor back EMF constant.

% Controller gains
kSwingUp = -5;
U = 0;

% For LQR
A = [0, 1, 0, 0, 0; 
    (g*m_P*(m_P*l_B^2 + I_B))/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), -(B_P*(m_P*l_B^2 + I_B))/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), 0, (B_B*l_B*l_P*m_P)/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), -(K_t*l_B*l_P*m_P)/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P); 
    0, 0, 0, 1, 0; 
    -(g*l_B*l_P*m_P^2)/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), (B_P*l_B*l_P*m_P)/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), 0, -(B_B*(m_P*l_P^2 + I_P))/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P), (K_t*(m_P*l_P^2 + I_P))/(I_P*m_P*l_B^2 + I_B*m_P*l_P^2 + I_B*I_P); 
    0, 0, 0, -K_e/L, -R/L];

B = [0; 0; 0; 0; 1/L];
QLQR = [
    10 0 0 0 0;
    0 5 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
    0 0 0 0 1
    ];
RLQR = 10;
kLqr = lqr(A, B, QLQR, RLQR);

odeFunHandler = @(t, x) odeFun(t, x, l_B, l_P, I_B, I_P, L, m_P, B_B, B_P, R, g, K_t, K_e, B, U, kSwingUp, kLqr);

tspan = [0 8];
% Initial condition
x0 = [
    pi;
    0.0001;
    0;
    0;
    0];

%  Runge-Kutta solver
[t, x] = ode45(odeFunHandler, tspan, x0);

% Plotting:
figure
plot(t, x(:, 1), LineWidth=2);
title('Pendulum angle'); ylabel('Angle [rad]'); xlabel('time [s]');

figure
plot(t, x(:, 3), LineWidth=2);
title('Base angle'); ylabel('Angle [rad]'); xlabel('time [s]');

figure
plot(t, x(:, 5), LineWidth=2);

function dxdt = odeFun(t, x, l_B, l_P, I_B, I_P, L, m_P, B_B, B_P, R, g, K_t, K_e, B, U, kSwingUp, kLqr)

if((x(1) <= 0.15) | (x(1) >= (2*pi - 0.15)))
    U = LQRController(x, kLqr);
else
    U = swingUp(x, kSwingUp);
end
    dxdt = [
    x(2);
    -(g*m_P*sin(x(1)) - B_P*x(2) + l_P^2*m_P*cos(x(1))*sin(x(1))*x(4)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*sin(2*x(1))*x(4)*l_P^2*x(2) - l_B*m_P*sin(x(1))*l_P*x(2)^2 + B_B*x(4) - K_t*x(5)))/(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B))/((m_P*l_P^2 + I_P)*((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1));
    x(4);
    (B_B*x(4) - K_t*x(5) + l_P^2*m_P*sin(2*x(1))*x(4)*x(2) - l_B*l_P*m_P*sin(x(1))*x(2)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*cos(x(1))*sin(x(1))*l_P^2*x(4)^2 - B_P*x(2) + g*m_P*sin(x(1))))/(m_P*l_P^2 + I_P))/(((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B));
    -(K_e*x(4) - 0 + R*x(5))/L
    ];
dxdt = dxdt + B*U;
end

function U = swingUp(x, kSwingUp)
    U = kSwingUp*(sign(x(2))*sign((cos(x(1)))));
end


function U = LQRController(x, kLqr)
    U = -kLqr*x;
end