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

load('data/parEstTest.mat');

testNumber = 2;
parEstTest(testNumber).time = time;
parEstTest(testNumber).timeTrigger = trigger;
parEstTest(testNumber).Current = current;
parEstTest(testNumber).PWM = PWM;

parEstTest(testNumber).pendAngleZeroUp = pendZeroUp;
parEstTest(testNumber).pendAngleZeroDwn = pendZeroDwn;
parEstTest(testNumber).baseAngle = base;
parEstTest(testNumber).description = "Impolse test, positive signal. Amplitude = 140."

save('data/parEstTest.mat', 'parEstTest')