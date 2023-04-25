%{
testNumber = 'one';

%load('data/rmsTest.mat')

rmsTest.(testNumber).time = time;
rmsTest.(testNumber).timeTrigger = trigger;
rmsTest.(testNumber).Current = current;
rmsTest.(testNumber).PWM = PWM;

rmsTest.(testNumber).pendAngleZeroUp = pendZeroUp;
rmsTest.(testNumber).pendAngleZeroDwn = pendZeroDwn;
rmsTest.(testNumber).baseAngle = base;
rmsTest.(testNumber).description = "Test on model without current feedback"

%save('data/rmsTest.mat', 'rmsTest')

%}

load('data/baseTest.mat');

testNumber = 5;
baseTest(testNumber).time = time;
baseTest(testNumber).timeTrigger = trigger;
baseTest(testNumber).Current = current;
baseTest(testNumber).PWM = PWM;

baseTest(testNumber).pendAngleZeroUp = pendZeroUp;
baseTest(testNumber).pendAngleZeroDwn = pendZeroDwn;
baseTest(testNumber).baseAngle = base;
baseTest(testNumber).baseAngleVel = baseVel;
baseTest(testNumber).description = "Base vel filter tau = 0.05. Gaussian2";

%save('data/baseTest.mat', 'baseTest')