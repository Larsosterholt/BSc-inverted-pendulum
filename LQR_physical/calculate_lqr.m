%clc; clear; close all;

%% Parameters for matematical model
lB = 0.132; % [m] Base langth.
lP = 0.195; % [m] Pendulum length.
IB = 9.547e-04; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
IP = 2.96e-04; % [kg*m^2] Pendulum inertia (about mass centre).
mP = 0.026; % [kg] Pendulum mass.
bB = 1.3e-03;% [Nm*rad/s] Motor friction.
bP = 2.48e-04; % [Nm*rad/s] Penulum friction.
g = 9.81; % [m/s^2] gravity.

% Motor parameters
L = 0.0625; % [Henry] Motor inductance.
R = 5.0; % [Omh] Motor resistance.
K_t = 0.089240515; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515; % [V/(rad/s)] Motor back EMF constant.

%% LQR

% Linear system matrix
A = [0, 1, 0, 0, 0;
    (g*mP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(bP*(mP*lB^2 + IB))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, (bB*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), -(K_t*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP);
    0, 0, 0, 1, 0;
    -(g*lB*lP*mP^2)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (bP*lB*lP*mP)/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), 0, -(bB*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP), (K_t*(mP*lP^2 + IP))/(IP*mP*lB^2 + IB*mP*lP^2 + IB*IP);
    0, 0, 0, -K_e/L, -R/L];

% Controller input matrix
B = [0 0 0 0 1/L]';

% Cost matrix
Q = [
    10 0 0 0 0;
    0 5 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
    0 0 0 0 1
    ];

% Actuation cost
RLQR = 100;



% Calculationg LQR gain
kLqr = lqr(A, B, Q, RLQR);