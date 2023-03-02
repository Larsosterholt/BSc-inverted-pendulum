clc; clear; close all;
s = tf('s');
%sample time
Ts = 0.005;

%DC-motor, encoder and gearing parameters
motorKt =  0.089240515; %Tourqe constant
motorN = 19.225; % Gearing
La = 4.5e-3;
Ra = 5; % ohm

TfDCMotor = (1/Ra)/(La/Ra*s + 1) % Transfer function
frictionConstant = 0;
maxPWM = 255;

countsPerRev = 12; % motor side
timeConstantFilter = 1.0;
%margin(TfDCMotor)

%Current sensor
currentOffset = 512; % Bit
currentGain = (2.5)/(512*0.4); % A
currentFilterTimeConstant = 0.4; % S
%Tourqe regulator parameters
tourqeRegulatorKp = 100;
tourqeRegulatorKi = 0;
tourqeRegulatorKd = 0;
maxCurrent = maxPWM/(motorKt*motorN);

angularVelRegulatorKp = 10;
angularVelRegulatorKi = 2;
angularVelRegulatorKd = 0;
maxCurrentAngularVel = 2*pi; % rad/s

angleRegulatorKp = 10;
angleRegulatorKi = 0;
angleRegulatorKd = 0;

%Pendulum angle controller
KpPend = 100;
KiPend = 0.1;
KdPend = 0.1;

%Base angle controller
KpBase = 0.2;
KiBase = 0.0;
KdBase = 0.0;

%Swing up controller gain
kSwingUp = -0.0015;


%Encoder

%Value for setting zeroposition
pendDwnValues = load("pendDwnValues.mat")
pendDwnValue = mean(pendDwnValues.pendDownValues)
