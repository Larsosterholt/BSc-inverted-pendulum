clc; clear; close all;


load("raw_data\baseAngleVelRaw.mat")
temp(1:length(baseAngleVelRaw.time)) = baseAngleVelRaw.signals.values( :, :, 1:end);
baseAngleVelRaw.signals.values = [];
baseAngleVelRaw.signals.values = temp;




load("raw_data\baseAngleVelFilterd.mat")
temp(1:length(baseAngleVelFilterd.time)) = baseAngleVelFilterd.signals.values( :, :, 1:end);
baseAngleVelFilterd.signals.values = [];
baseAngleVelFilterd.signals.values = temp;


load("raw_data\baseAngle.mat")
temp(1:length(baseAngle.time)) = baseAngle.signals.values( :, :, 1:end);
baseAngle.signals.values = [];
baseAngle.signals.values = temp;

voltage.PWM(1:25)= 0;
voltage.PWM(5:10) = 100; voltage.PWM(15:20) = -100;
voltage.time = [1:25]

BaseTest.baseAngleVelRaw = baseAngleVelRaw;
BaseTest.baseAngleVelFilterd = baseAngleVelFilterd;
BaseTest.baseAngle = baseAngle;
BaseTest.voltage = voltage;

figure
plot(baseAngleVelRaw.time, baseAngleVelRaw.signals.values)
figure
plot(baseAngleVelFilterd.time, baseAngleVelFilterd.signals.values)
figure
plot(baseAngle.time, baseAngle.signals.values)
figure
plot(voltage.time, voltage.PWM)
