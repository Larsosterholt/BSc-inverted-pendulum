clc; clear; close all;

%Loading and cleaning up test data
%load("data\PendTest.mat");
%pendTest.data_1.angle(1:round(0.12*250)) = [];
%pendTest.data_1.time(1:round(0.12*250)) = [];
%pendTest.data_1.angle = pendTest.data_1.angle(:) - pendTest.data_1.angle(1);
%pendTest.data_1.time = pendTest.data_1.time(:) - pendTest.data_1.time(1);

load("data\impulsTest100.mat");
disp(impulseTest.description)

%% Parameters for matematical model
l_B = 0.132; % [m] Base langth. 13.2cm measured.
l_P = 0.21; % [m] Pendulum length. 24cm measured.
I_B = 2.1*(1/12)*0.05*0.25^2; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
I_P = (1/3)*0.010*0.25^2*1; % [kg*m^2] Pendulum inertia (about mass centre). Estimated with mass = 10g
m_P = 0.026 * 1; % [kg] Pendulum mass. 26g measured
B_B = 0.00048*2;%0.01; % [Nm*rad/s] Motor friction.
B_P = 0.00025; % [Nm*rad/s] Penulum friction.
g = 9.81; % [m/s^2] gravity.

%Motor parameters
L = 1.3/1000 * 1; % [Henry] Motor inductance. From random data sheet
R = 5; % [Omh] Motor resistance.
K_t = 0.089240515 ; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515 * 0.7; % [V/(rad/s)] Motor back EMF constant.


%% Optimizing
%Creating initial guess vector
p0(1) = l_B; p0(2) = l_P; p0(3) = I_B; p0(4) = I_P; p0(5) = L;
p0(6) = m_P; p0(7) = B_B; p0(8) = B_P; p0(9) = R; p0(10) = K_t;
p0(11) = K_e;

% Lower and upper bounds
lb = p0*0.8;
ub = p0*1.2;

% Test data to compare
pendAngleMeasured = (-1)*impulseTest.pendAngle.signals.values + pi;
baseAngleMeasured = impulseTest.baseAngle.signals.values;

% Creaating function handler
fun = @(p) squareErrorFun(p, pendAngleMeasured, baseAngleMeasured);

% Starting paralell computing
parpool 
options = optimoptions('fmincon', 'UseParallel',true);

% Start optimizing
startTime = tic;
%[p, fval] = fminunc(fun, p0)
[p, fval] = fmincon(fun, p0, [], [], [], [], lb, ub)
fprintf('Parallel FMINCON optimization takes %g seconds.\n',time_fmincon_parallel);

%Save the vector and fval
save('p.mat', 'p');
save('fval.mat', 'fval');


%% Plotting befor with values before optimizing:
tspan = [0:1/250:16];

% Initial condition
x0 = [
    pi;
    0;
    0;
    0;
    0];

%  Runge-Kutta solver
odeFunHandler = @(t, x) odeFunSys(t, x, p0);
[t, x] = ode45(odeFunHandler, tspan, x0);


figure
plot(t, x(:, 1), LineWidth=2);
title('Pendulum angle'); ylabel('Angle [rad]'); xlabel('time [s]');

figure
plot(t, x(:, 3), LineWidth=2);
title('Base angle'); ylabel('Angle [rad]'); xlabel('time [s]');
figure

plot(t, x(:, 5), LineWidth=2);

%% Plotting befor with values after optimizing:
tspan = [0:1/250:16];

% Initial condition
x0 = [
    pi;
    0;
    0;
    0;
    0];

%  Runge-Kutta solver
odeFunHandler = @(t, x) odeFunSys(t, x, p);
[t, x] = ode45(odeFunHandler, tspan, x0);


figure
plot(t, x(:, 1), LineWidth=2);
title('Pendulum angle'); ylabel('Angle [rad]'); xlabel('time [s]');

figure
plot(t, x(:, 3), LineWidth=2);
title('Base angle'); ylabel('Angle [rad]'); xlabel('time [s]');
figure

plot(t, x(:, 5), LineWidth=2);