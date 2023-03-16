clc; clear; close all;

% Optimizing or not
optimizing = true;

% Load test data and creating varibles for comparing the model
testNumber = 2;
load("data\parEstTest.mat");
disp(parEstTest(testNumber).description)
pendAngleMeasured = -1*parEstTest(testNumber).pendAngleZeroDwn+pi;
baseAngleMeasured = parEstTest(testNumber).baseAngle;
currentMeasured = parEstTest(testNumber).Current+0.015;
timeMeasurement = parEstTest(testNumber).time;
pwmSignalMeasured = parEstTest(testNumber).PWM;

% Load the previous results
load("results.mat");
%% Parameters for matematical model
l_B = 0.132; % [m] Base langth. 13.2cm measured.
l_P = .7*0.24; % [m] Pendulum length. 24cm measured.
I_B = (1/12)*0.05*0.25^2; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
I_P = .7*(1/3)*0.010*0.25^2; % [kg*m^2] Pendulum inertia (about mass centre). Estimated with mass = 10g
m_P = 0.026*0.8; % [kg] Pendulum mass. 26g measured
B_B = 2*0.00048; % 0.01; % [Nm*rad/s] Motor friction.
B_P = 0.00025*.5; % [Nm*rad/s] Penulum friction.
g = 9.81; % [m/s^2] gravity.

% Motor parameters
L = 1.3/1000; % [Henry] Motor inductance. From random data sheet
R = 5; % [Omh] Motor resistance.
K_t = 0.089240515; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515; % [V/(rad/s)] Motor back EMF constant.

% Creating initial guess vector withe the parameters
p0(1) = l_B; p0(2) = l_P; p0(3) = I_B; p0(4) = I_P; p0(5) = L;
p0(6) = m_P; p0(7) = B_B; p0(8) = B_P; p0(9) = R; p0(10) = K_t;
p0(11) = K_e;

% If the optimizing shold start from a previous result:
p0 = results(numel(results)).p;
%% Optimizing

% Lower and upper bounds
%lb = p0*0.3;
%ub = p0*3;

lb = p0*.2;
ub = p0*4;

%lb(1:4) =lb(1:4)*0.3;
%lb(7:8) =lb(7:8)*0.3;

%ub(1:4) =ub(1:4)*3;
%ub(7:8) =ub(7:8)*3;



% Creaating function handler
costFunHandler = @(p) costFun(p, pendAngleMeasured, baseAngleMeasured, currentMeasured);

if(optimizing == true)
    % Starting paralell computing
%    if max(size(gcp)) == 0 % parallel pool needed
%        parpool % create the parallel pool
%    end
%    options = optimoptions('fmincon', 'UseParallel',true);
    % Start optimizing
    startTime = tic;
    [p, fval] = fmincon(costFunHandler, p0, [], [], [], [], lb, ub)
    time_fmincon_parallel = toc(startTime);
    fprintf('Parallel FMINCON optimization takes %g seconds.\n',time_fmincon_parallel);
    
    % Save the new results
    results(numel(results)+1).p = p; % New optimized paramters
    results(numel(results)).fval = fval; % Final error value
    results(numel(results)).p0 = p0; % Initial guess
    save('results.mat', 'results');
end

%% Simulating with before and after parameters
tspan = [0:1/200:16];

% Initial condition
x0 = [
    pi;
    0;
    0;
    0;
    0];

%  Simulate with parameters befor optimizing
odeFunHandler = @(t, x) odeFunSys(t, x, results(end).p0);
[t, xBefore] = ode45(odeFunHandler, tspan, x0);

%  Simulate with parameters after optimizing
odeFunHandler = @(t, x) odeFunSys(t, x, results(end).p);
[t, xAfter] = ode45(odeFunHandler, tspan, x0);
%% Plotting with the newest results

close all;
figure
hold on
plot(t, xBefore(:, 1), LineWidth=1);
plot(t, xAfter(:, 1), 'Color','r');
plot(timeMeasurement, pendAngleMeasured,'-.' , 'Color','k')
legend('Before optimizing', 'After optimizing', 'Real data');
title('Pend angle'); ylabel('Angle [rad]'); xlabel('time [s]');
hold off

figure
hold on
plot(t, xBefore(:, 3), LineWidth=1);
plot(t, xAfter(:, 3), 'Color','r');
plot(timeMeasurement, baseAngleMeasured,'-.' , 'Color','k')
legend('Before optimizing', 'After optimizing', 'Real data');
title('Base angle'); ylabel('Angle [rad]'); xlabel('time [s]');
hold off

% NB! No test data for current
figure
hold on
plot(t, xBefore(:, 5), LineWidth=1);
plot(t, xAfter(:, 5), 'Color','r');
plot(timeMeasurement,currentMeasured,'-.' , 'Color','k')
legend('Before optimizing', 'After optimizing', 'Real data');
title('Current'); ylabel('Current [A]'); xlabel('time [s]');
hold off