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

save('data/rmsTest.mat', 'rmsTest')

