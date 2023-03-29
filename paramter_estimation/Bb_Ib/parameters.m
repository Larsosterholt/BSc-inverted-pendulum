clc; clear; close all;
% parameters


L = 0.0625;
Ke = 0.089240515;
Kt = 0.089240515;
R = 5.0;
Ib = 3.6458e-4;
Bb = 1e-4;

load("baseTest.mat");
testNumber = 2;
disp(baseTest(testNumber).description)


figure
title('Base angle vel. No pendulum')
ylabel('Angle vel [rad/s]');
xlabel('time [s]');
hold on
%plot(BaseTest.baseAngleVelRaw.time, BaseTest.baseAngleVelRaw.signals.values,LineWidth=2)
plot(baseTest(testNumber).time, baseTest(testNumber).baseAngleVel)
legend('Physical model');
hold off


%{
tab.time = baseTest(testNumber).time;
tab.baseVel = baseTest(testNumber).baseAngleVel;
tab.volts = baseTest(testNumber).PWM*10/255;

T = struct2table(tab)
writetable(T, "testData.csv")
%}
