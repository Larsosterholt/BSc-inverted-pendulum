clc; clear; close all;

% Optimizing or not
optimizing = false; %true/false

% Load test data and creating varibles for comparing the model
testNumber = 2;
load("data\parEstTest.mat");
disp(parEstTest(testNumber).description)
pendAngleMeasured = -1*parEstTest(testNumber).pendAngleZeroDwn+pi;
baseAngleMeasured = parEstTest(testNumber).baseAngle;
currentMeasured = parEstTest(testNumber).Current+0.015; % Adding offset from current sensor
timeMeasurement = parEstTest(testNumber).time;
pwmSignalMeasured = parEstTest(testNumber).PWM;

% Load the previous results
load("results.mat");
%% Parameters for matematical model
l_B = 0.132; % [m] Base langth.
l_P = 0.195; % [m] Pendulum length.
I_B = 2*(1/12)*0.05*0.25^2; % [kg*m^2]Base, motor ang gerbox inertia (about mass centre)
I_P = 2.96e-04; % [kg*m^2] Pendulum inertia (about mass centre).
m_P = 0.026; % [kg] Pendulum mass.
B_B = 0.0005;% [Nm*rad/s] Motor friction. inital guess
B_P = 0.00025; % [Nm*rad/s] Penulum friction. Inital guess
g = 9.81; % [m/s^2] gravity.

% Motor parameters
L = 1.3/1000; % [Henry] Motor inductance. Intial guess
R = 5.0; % [Omh] Motor resistance.
K_t = 0.089240515; % [Nm/A] Motor tourqe constant.
K_e = 0.089240515; % [V/(rad/s)] Motor back EMF constant.

% Creating initial guess vector withe the parameters
p0(1) = l_B; p0(2) = l_P; p0(3) = I_B; p0(4) = I_P; p0(5) = L;
p0(6) = m_P; p0(7) = B_B; p0(8) = B_P; p0(9) = R; p0(10) = K_t;
p0(11) = K_e;

% If the optimizing shold start from a previous result:
%p0 = results(numel(results)).p*2;
%% Optimizing

% Lower and upper bounds
lb = p0; % Setting lower bound to p0
ub = p0; % Setting upper bound to p0;

%lb = p0*.2; % Uncomment for optimizin all of the parameters
%ub = p0*4; % Uncomment for optimizin all of the parameters

% Changing the statesof lb and ub who is gong to be optimized
lb(3) = p0(3)*0.2; % Lower bound for I_B base/motor inertia
lb(5) = p0(5)*0.2; % Lower bound for L inductance
lb(7:8) = p0(7:8)*0.2; % Lower bound for B_B and B_P base and pendulum friction

ub(3) = p0(3)*4; % Upper bound for I_B base/motor inertia
ub(5) = p0(5)*4; % Upper bound for L inductance
ub(7:8) = p0(7:8)*4; % Upper bound for B_B and B_P base and pendulum friction

% Creaating function handler for cost function
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
    time_fmincon = toc(startTime);
    fprintf('FMINCON optimization takes %g seconds.\n',time_fmincon);
    
    % Append the new results and save it
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
[~, xBefore] = ode45(odeFunHandler, tspan, x0);

%  Simulate with parameters after optimizing
odeFunHandler = @(t, x) odeFunSys(t, x, results(end).p);
[t, xAfter] = ode45(odeFunHandler, tspan, x0);
%% Plotting with the newest results (simple plots)
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

figure
hold on
plot(t, xBefore(:, 5), LineWidth=1);
plot(t, xAfter(:, 5), 'Color','r');
plot(timeMeasurement,currentMeasured,'-.' , 'Color','k')
legend('Before optimizing', 'After optimizing', 'Real data');
title('Current'); ylabel('Current [A]'); xlabel('time [s]');
hold off

figure
hold on
plot(timeMeasurement,pwmSignalMeasured, 'Color','k')
legend('Real data');
title('Impulse signal. Voltage = (140/255)*10.5V'); ylabel('PWM signal'); xlabel('time [s]');
hold off

%% Plotting with the newest results for the report
%Plotting paramters 
W_frame = 16;     % Final width of the frame [cm] of the plot in your document
H_frame = 8*2;      % Final height of the frame [cm] of the plot in your document
LLC_frame = [5/2,5/2];% Position of lower left corner of the frame on the screen [cm]
W_axis = 14.5;    % Width of axis [cm]
H_axis = 4.0;%6.7;     % Height of axis [cm]
LLC_axis = [1.25, 1.1]; % Position of lower left corner of the axes on the frame [cm]
xlabel_x = W_axis/2;% x-position of the x-label
xlabel_y = -0.6;  % y-position of the x-label [cm]
ylabel_x = -0.6;  % x-position of the y-label [cm]
ylabel_y = H_axis/2;% y-position of the y-label
AxisFontSize = 11;% Font size for axis text in the final plot in your document
LW1 = 1;          % Line width of lines on plot
LW2 = 2;          % Line width of lines on plot


%% plotting pendulum angle the test data before and after optimizing
fig = figure;           % Handle for the figure
%ax = gca;               % Handle for the axis
ax = subplot(3, 1, 1);
%Data Point Formatting
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame H_frame];
hold on

% Plotting test data
plt2 = plot(t, xBefore(:, 1));
plt2.Color = 'r';
plt2.LineStyle = '-';
plt2.LineWidth = LW1;

% Plotting before optimizing
plt3 = plot(t, xAfter(:, 1));
plt3.Color = '#2196f3';
plt3.LineWidth  = LW1;

% Plotting after optimizing
plt4 = plot(timeMeasurement, pendAngleMeasured);
plt4.Color = '#5f0000';
plt4.LineWidth  = LW1;
plt4.LineStyle = '-.';

ax.Units = 'centimeters';
ax.GridLineStyle = '--';                % '-' '--' ':' '-.'
%ax.Position = [LLC_axis W_axis H_axis];
ax.FontName = 'Times New Roman';
ax.FontSize = AxisFontSize;             % Specified above
ax.XTick = [0:1:40];                    % Divisions on axes
ax.YTick = [-50:1:50];                    % Divisions on axes
ax.XLim = [0 7];

label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
%label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Pendulum angle [rad]');
label_y.Units = "centimeters";
%label_y.Position = [ylabel_x, ylabel_y];

leg = legend('Before optimizing', 'After optimizing', 'Test data');
leg.Location = "northeast";
hold off
grid on
box on
%% plotting base angle test data before and after optimizing

%fig1 = figure;           % Handle for the figure
%ax1 = gca;               % Handle for the axis
ax1 = subplot(3, 1, 2);

%Data Point Formatting
%fig1.Units = 'centimeters';
%fig1.Position = [LLC_frame W_frame H_frame];
hold on

% Plotting test data
plt2 = plot(t, xBefore(:, 3));
plt2.Color = 'r';
plt2.LineStyle = '-';
plt2.LineWidth = LW1;

% Plotting before optimizing
plt3 = plot(t, xAfter(:, 3));
plt3.Color = '#2196f3';
plt3.LineWidth  = LW1;

% Plotting after optimizing
plt4 = plot(timeMeasurement, baseAngleMeasured);
plt4.Color = '#5f0000';
plt4.LineWidth  = LW1;
plt4.LineStyle = '-.';


ax1.Units = 'centimeters';
ax1.GridLineStyle = '--';                % '-' '--' ':' '-.'
%ax1.Position = [1.2500+4 1.1000+4 14.5000 4]
ax1.FontName = 'Times New Roman';
ax1.FontSize = AxisFontSize;             % Specified above
ax1.XTick = [0:1:40];                    % Divisions on axes
ax1.YTick = [-50:10:90];                    % Divisions on axes
ax1.XLim = [0 7];

label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
%label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Base angle [rad]');
label_y.Units = "centimeters";
%label_y.Position = [ylabel_x, ylabel_y];

leg = legend('Before optimizing', 'After optimizing', 'Test data');
leg.Location = "northeast";

hold off
grid on
box on
%% plotting base anglethe test data before and after optimizing

%fig2 = figure;           % Handle for the figure
%ax2 = gca;               % Handle for the axis
ax2 = subplot(3, 1, 3);

%Data Point Formatting
%fig2.Units = 'centimeters';
%fig2.Position = [LLC_frame W_frame H_frame];
hold on

% Plotting test data
plt2 = plot(t, xBefore(:, 5));
plt2.Color = 'r';
plt2.LineStyle = '-';
plt2.LineWidth = LW1;

% Plotting before optimizing
plt3 = plot(t, xAfter(:, 5));
plt3.Color = '#2196f3';
plt3.LineWidth  = LW1;

% Plotting after optimizing
plt4 = plot(timeMeasurement, currentMeasured);
plt4.Color = '#5f0000';
plt4.LineWidth  = LW1;
plt4.LineStyle = '-.';


ax2.Units = 'centimeters';
ax2.GridLineStyle = '--';                % '-' '--' ':' '-.'
%ax2.Position = [1.2500 1.1000 14.5000 4];
ax2.FontName = 'Times New Roman';
ax2.FontSize = AxisFontSize;             % Specified above
ax2.XTick = [0:1:40];                    % Divisions on axes
ax2.YTick = [-50:0.2:90];                    % Divisions on axes
ax2.XLim = [0 7];

label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
%label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Motor current [A]');
label_y.Units = "centimeters";
%label_y.Position = [ylabel_x, ylabel_y];

leg = legend('Before optimizing', 'After optimizing', 'Test data');
leg.Location = "northeast";

hold off
grid on
box on

