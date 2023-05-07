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

%% For LQR
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

% Swing-up controller gain
kSwingUp = -4.7;
U = 0;
%% Simulate the system and controllers

% Creating a function handler for odeFun
odeFunHandler = @(t, x) odeFun(t, x, lB, lP, IB, IP, L, mP, bB, bP, R, g, K_t, K_e, B, U, kSwingUp, kLqr);

tspan = [0 8];

% Initial condition
x0 = [
    pi; % pi = pendulum down
    -0.0001;
    0;
    0;
    0];

%  Simulate
[t, x] = ode45(odeFunHandler, tspan, x0);

%% Plotting the pendulum
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

fig = figure;           % Handle for the figure
ax = gca;               % Handle for the axis

fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame H_frame];
% Specifying the position of the lower left corner + the width and height of the frame

hold on
plt1 = plot(t, x(:, 1), LineWidth=2);
plt1.Color = '#5f0000';    % y, m, c, r, g, b, w, k,
plt1.LineStyle ='-';% '-', '--', ':', '-.'
plt1.LineWidth  = LW2;

ax.Units = 'centimeters';
ax.GridLineStyle = '--';                % '-' '--' ':' '-.'
ax.Position = [LLC_axis W_axis H_axis];
ax.FontName = 'Times New Roman';
ax.FontSize = AxisFontSize;             % Specified above
ax.XTick = [0:1:8];                    % Divisions on axes
ax.YTick = [-1:1:6];                    % Divisions on axes

label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Pendulum angle [rad]');
label_y.Units = "centimeters";
label_y.Position = [ylabel_x, ylabel_y];

triggerTime = 4.0122;
lengthOfPltTime = ax.XTick(end);
yl = [ax.YTick(1) ax.YTick(end)];

patch([0 0 triggerTime triggerTime],[yl(1) yl(2) yl(2) yl(1)],'k',...
    'facecolor',[.4 .6 .4],'edgecolor',[.4 .6 .4],...
    'facealpha',0.3,'edgealpha',0.3)

patch([triggerTime triggerTime lengthOfPltTime lengthOfPltTime] ,[yl(1) yl(2) yl(2) yl(1)],'k',...
    'facecolor',[.1 .2 .4],'edgecolor',[.1 .2 .4],...
    'facealpha',0.3,'edgealpha',0.3)

leg = legend('Simulation', 'Swing-up controller', 'LQR');
leg.Location = "northeast";

hold off
grid on
box on

%% Plotting the base 
fig = figure;           % Handle for the figure
ax = gca;               % Handle for the axis

%Data Point Formatting
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame H_frame];

hold on
plt1 = plot(t, x(:, 3), LineWidth=2);
plt1.Color = '#5f0000';    % y, m, c, r, g, b, w, k,
plt1.LineStyle ='-';% '-', '--', ':', '-.'
plt1.LineWidth  = LW2;

ax.Units = 'centimeters';
ax.GridLineStyle = '--';                % '-' '--' ':' '-.'
ax.Position = [LLC_axis W_axis H_axis];
ax.FontName = 'Times New Roman';
ax.FontSize = AxisFontSize;             % Specified above
ax.XTick = [0:1:8];                    % Divisions on axes
ax.YTick = [-6:1:0];                    % Divisions on axes

label_x = xlabel('Time, [s]');
label_x.Units = "centimeters";
label_x.Position = [xlabel_x, xlabel_y];

label_y = ylabel('Base angle [rad]');
label_y.Units = "centimeters";
label_y.Position = [ylabel_x, ylabel_y];

triggerTime = 4.0122;
lengthOfPltTime = ax.XTick(end);
yl = [ax.YTick(1) ax.YTick(end)];
patch([0 0 triggerTime triggerTime],[yl(1) yl(2) yl(2) yl(1)],'k',...
    'facecolor',[.4 .6 .4],'edgecolor',[.4 .6 .4],...
    'facealpha',0.3,'edgealpha',0.3)

patch([triggerTime triggerTime lengthOfPltTime lengthOfPltTime] ,[yl(1) yl(2) yl(2) yl(1)],'k',...
    'facecolor',[.1 .2 .4],'edgecolor',[.1 .2 .4],...
    'facealpha',0.3,'edgealpha',0.3)

leg = legend('Simulation', 'Swing-up controller', 'LQR');
leg.Location = "north";

hold off
grid on
box on

%% Functions
function dxdt = odeFun(t, x, l_B, l_P, I_B, I_P, L, m_P, B_B, B_P, R, g, K_t, K_e, B, U, kSwingUp, kLqr)

% Chosing between swing-up controller and LQR
if((x(1) <= 0.15) || (x(1) >= (2*pi - 0.15)))
    U = LQRController(x, kLqr);
else
    U = swingUp(x, kSwingUp);
end

% Updating the system state
dxdt = [
    x(2);
    -(g*m_P*sin(x(1)) - B_P*x(2) + l_P^2*m_P*cos(x(1))*sin(x(1))*x(4)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*sin(2*x(1))*x(4)*l_P^2*x(2) - l_B*m_P*sin(x(1))*l_P*x(2)^2 + B_B*x(4) - K_t*x(5)))/(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B))/((m_P*l_P^2 + I_P)*((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1));
    x(4);
    (B_B*x(4) - K_t*x(5) + l_P^2*m_P*sin(2*x(1))*x(4)*x(2) - l_B*l_P*m_P*sin(x(1))*x(2)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*cos(x(1))*sin(x(1))*l_P^2*x(4)^2 - B_P*x(2) + g*m_P*sin(x(1))))/(m_P*l_P^2 + I_P))/(((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B));
    -(K_e*x(4) - 0 + R*x(5))/L
    ];
% Adding a controller input
dxdt = dxdt + B*U;
end


function U = swingUp(x, kSwingUp)
% Swing up controller
U = kSwingUp*sign(x(2)*sign(cos(x(1))));
end


function U = LQRController(x, kLqr)
% LQR pendulum-up controller
U = -kLqr*x;
end