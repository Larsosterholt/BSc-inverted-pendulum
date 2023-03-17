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

%load('data/currentStepTest.mat');

testNumber = 3;
currentStepTest(testNumber).time = time;
currentStepTest(testNumber).timeTrigger = trigger;
currentStepTest(testNumber).Current = current;
currentStepTest(testNumber).PWM = PWM;

currentStepTest(testNumber).pendAngleZeroUp = pendZeroUp;
currentStepTest(testNumber).pendAngleZeroDwn = pendZeroDwn;
currentStepTest(testNumber).baseAngle = base;
currentStepTest(testNumber).description = "Current step test amplitude = 255."

%save('data/currentStepTest.mat', 'currentStepTest')