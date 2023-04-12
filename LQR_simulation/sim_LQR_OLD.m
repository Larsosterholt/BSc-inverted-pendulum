clc; clear; close all;

%% Parameters for matematical model

lB = 0.132; % [m] Base langth.
lP = 0.195; % [m] Pendulum length.
IB = 9.547e-04; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
IP = 2.96e-04; % [kg*m^2] Pendulum inertia (about mass centre).
mP = 0.026; % [kg] Pendulum mass.
bB = 1.3e-03;% [Nm*rad/s] Motor friction.
bP = 2.48e-04; % [Nm*rad/s] Penulum friction.
g = 9.81; % [m/s^2] gravity.

%Motor parameters
L = 0.0625; % [Henry] Motor inductance.
R = 5.0; % [Omh] Motor resistance.
K_t = 0.089240515; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515; % [V/(rad/s)] Motor back EMF constant.



%% Creating LQR gain matix
%{
% System matix
A = [0, 1, 0, 0, 0; 
    (g*mP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(bP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, (bB*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(K_t*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP); 
    0, 0, 0, 1, 0; 
    -(g*lB*lP*mP^2)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (bP*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, -(bB*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (K_t*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP); 
    0, 0, 0, -K_e/L, -R/L];

% Input vector
B = [0; 0; 0; 0; 1/L];

% Cost matrix
Q = [
    10 0 0 0 0;
    0 5 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
    0 0 0 0 1
    ];

R = 10;
kLqr = lqr(A, B, Q, R);

%}
% Controller gains
kSwingUp = -7;
U = 0;

A = [0, 1, 0, 0, 0; 
    (g*mP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(bP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, (bB*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(K_t*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP); 
    0, 0, 0, 1, 0; 
    -(g*lB*lP*mP^2)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (bP*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, -(bB*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (K_t*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP); 
    0, 0, 0, -K_e/L, -R/L];

% Input vector
B = [0; 0; 0; 0; 1/L];

% Cost matrix
Q = [
    10 0 0 0 0;
    0 5 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
    0 0 0 0 1
    ];

R = 10;
kLqr = lqr(A, B, Q, R);



odeFunHandler = @(t, x) odeFun(t, x, lB, lP, IB, IP, L, mP, bB, bP, R, g, K_t, K_e, B, U, kSwingUp, kLqr);

tspan = [0 12];
% Initial condition
x0 = [
    pi;
    -0.0001;
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