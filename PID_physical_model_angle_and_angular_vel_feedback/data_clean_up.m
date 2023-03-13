testNumber = 'two';

%load('data/rmsTest.mat')

rmsTest.(testNumber).time = time;
rmsTest.(testNumber).timeTrigger = trigger;
rmsTest.(testNumber).Current = current;


rmsTest.(testNumber).pendAngleZeroUp = pendZeroUp;
rmsTest.(testNumber).pendAngleZeroDwn = pendZeroDwn;
rmsTest.(testNumber).baseAngle = base;
rmsTest.(testNumber).description = "Test on model with current feedback"

%save('data/rmsTest.mat', 'rmsTest')

