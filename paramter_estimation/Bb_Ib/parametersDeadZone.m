clc; clear; close all;
% parameters
L = 0.0625;
Ke = 0.089240515;
Kt = 0.089240515;
R = 5.0;
Ib = 3.6458e-4; % inital
Bb = 1e-4; % inital
StictionB = 1e-4; % inital
%% 

% Simulate
simulationBefore = sim("BbIb_parameter_estimation.slx");

%%

% Load optimized varibles
load("IbNew.mat"); 
load("BbNew.mat");

%Simulate with optimized varibles
StictionB = 0;
simulationAfter = sim("BbIb_parameter_estimation.slx");

% Load optimized varibles with stiction
load("IbStiction.mat");
load("BbStiction.mat");
load("StictionB.mat");
simulationAfterStiction = sim("BbIb_parameter_estimation.slx");

% Load test tata
load("baseTest.mat");
testNumber = 3;
disp(baseTest(testNumber).description)
%{

figure
title('Base angle vel. No pendulum')
ylabel('Angle vel [rad/s]');
xlabel('time [s]');
hold on
%plot(BaseTest.baseAngleVelRaw.time, BaseTest.baseAngleVelRaw.signals.values,LineWidth=2)
plot(baseTest(testNumber).time, baseTest(testNumber).baseAngleVel)
plot(baseTest(2).time, baseTest(2).baseAngleVel)

plot(simulationBefore.time, simulationBefore.out)
plot(simulationAfter.time, simulationAfter.out)
legend('Physical model');
hold off
%}




%{
%tab.time = baseTest(testNumber).time;
%tab.baseVel = baseTest(testNumber).baseAngleVel;
%tab.volts = baseTest(testNumber).PWM*10/255;

%T = struct2table(tab)
%writetable(T, "testDataGaussian2.csv")
%}

%%
%Plotting paramters 
W_frame = 16;     % Final width of the frame [cm] of the plot in your document
H_frame = 8;      % Final height of the frame [cm] of the plot in your document
LLC_frame = [5,5];% Position of lower left corner of the frame on the screen [cm]
W_axis = 14.5;    % Width of axis [cm]
H_axis = 6.7;     % Height of axis [cm]
LLC_axis = [1.25, 1.1]; % Position of lower left corner of the axes on the frame [cm]
xlabel_x = W_axis/2;% x-position of the x-label
xlabel_y = -0.6;  % y-position of the x-label [cm]
ylabel_x = -0.6;  % x-position of the y-label [cm]
ylabel_y = H_axis/2;% y-position of the y-label
AxisFontSize = 11;% Font size for axis text in the final plot in your document
LW1 = 1;          % Line width of lines on plot
LW2 = 2;          % Line width of lines on plot
%Plotting 
fig = figure;           % Handle for the figure
ax = gca;               % Handle for the axis

%Data Point Formatting
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame H_frame];
% Specifying the position of the lower left corner + the width and height of the frame

hold on
%plt1 = plot(baseTest(testNumber).time, baseTest(testNumber).baseAngleVel);
%plt1.Color = '#00695c';    % y, m, c, r, g, b, w, k,
%plt1.LineStyle ='-';% '-', '--', ':', '-.'
%plt1.LineStyleMode = "manual"
%plt1.LineWidth  = LW1;

plt2 = plot(baseTest(3).time, baseTest(2).baseAngleVel);
plt2.Color = 'r';
plt2.LineStyle = '-';
plt2.LineWidth = LW1;

plt3 = plot(simulationBefore.time, simulationBefore.out);
plt3.Color = '#2196f3';
plt3.LineWidth  = LW1;
plt3.LineStyle = '-.';

plt4 = plot(simulationAfterStiction.time, simulationAfterStiction.out);
plt4.Color = '#5f0000';
plt4.LineWidth  = LW1;

%plt4 = plot(simulationAfter.time, simulationAfter.outFirstOrder);
%plt4.Color = '#5f0000';
%plt4.LineWidth  = LW1;



ax.Units = 'centimeters';
ax.GridLineStyle = '--';                % '-' '--' ':' '-.'
ax.Position = [LLC_axis W_axis H_axis];
ax.FontName = 'Times New Roman';
ax.FontSize = AxisFontSize;             % Specified above
ax.XTick = [0:5:40];                    % Divisions on axes
ax.YTick = [-50:10:50];                    % Divisions on axes
%axis([tmin, tmax, -5, 5]);              % lower and upper limit
%Axis Labels and Legend
label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Base angle [rad]');
label_y.Units = "centimeters";
label_y.Position = [ylabel_x, ylabel_y];

yaxis([ax.YTick(1) ax.YTick(end)]);

%leg = legend('Test data', 'i = k*U*(1-exp(1/tau*t)) ');
%leg = legend('Test data', '$i(t) = k \cdot U(t) \cdot (1-e^{-\frac{1}{\tau}t})$','Interpreter','latex')
leg = legend('Test data 1 (Exp)', 'Before optimizing', 'After optimizing' );
leg.Location = "north";

hold off
grid on
box on


%% Comparing results
%Plotting 
fig = figure;           % Handle for the figure
ax = gca;               % Handle for the axis

%Data Point Formatting
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame H_frame];
% Specifying the position of the lower left corner + the width and height of the frame

hold on
%plt1 = plot(baseTest(testNumber).time, baseTest(testNumber).baseAngleVel);
%plt1.Color = '#00695c';    % y, m, c, r, g, b, w, k,
%plt1.LineStyle ='-';% '-', '--', ':', '-.'
%plt1.LineStyleMode = "manual"
%plt1.LineWidth  = LW1;

plt2 = plot(baseTest(3).time, baseTest(2).baseAngleVel);
plt2.Color = 'r';
plt2.LineStyle = '-';
plt2.LineWidth = LW1;

plt3 = plot(simulationAfterStiction.time, simulationAfterStiction.out);
plt3.Color = '#5f0000';
plt3.LineWidth  = LW1;
plt3.LineStyle = '-';

plt4 = plot(simulationAfter.time, simulationAfter.out);
plt4.Color = '#2196f3';
plt4.LineWidth  = LW1;

plt5 = plot(simulationAfter.time, simulationAfter.outFirstOrder);
%plt5.Color = '#070070';
plt5.LineWidth  = LW1;



ax.Units = 'centimeters';
ax.GridLineStyle = '--';                % '-' '--' ':' '-.'
ax.Position = [LLC_axis W_axis H_axis];
ax.FontName = 'Times New Roman';
ax.FontSize = AxisFontSize;             % Specified above
ax.XTick = [0:5:40];                    % Divisions on axes
ax.YTick = [-50:10:50];                    % Divisions on axes
%axis([tmin, tmax, -5, 5]);              % lower and upper limit
%Axis Labels and Legend
label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Base angle [rad]');
label_y.Units = "centimeters";
label_y.Position = [ylabel_x, ylabel_y];

yaxis([ax.YTick(1) ax.YTick(end)]);

%leg = legend('Test data', 'i = k*U*(1-exp(1/tau*t)) ');
%leg = legend('Test data', '$i(t) = k \cdot U(t) \cdot (1-e^{-\frac{1}{\tau}t})$','Interpreter','latex')
leg = legend('Test data 1 (Exp)', 'With stiction', 'Without stiction', 'First order approximation');
leg.Location = "north";

hold off
grid on
box on
