testNumber = 'one';

%load('data/rmsTest.mat')

rmsTest.testNumber.time = simout_time;
rmsTest.testNumber.timeTrigger = simout_trigger;

rmsTest.testNumber.pendAngleZeroUp = simout_pendAngleZeroUp;
rmsTest.testNumber.pendAngleZeroDwn = simout_pendAngleZeroDwn;
rmsTest.testNumber.pendAngleVel = simout_pendAngleVel;
rmsTest.testNumber.pendAngleTrigger = simout_pendAngleTrigger;

rmsTest.testNumber.baseAngle = simout_baseAngle;
rmsTest.testNumber.baseAngleVel = simout_baseAngleVel;
rmsTest.testNumber.baseAngleTrigger = simout_baseAngleTrigger;

rmsTest.testNumber.PWM = simout_PWM;
rmsTest.testNumber.Current = simout_Current;

save('data/rmsTest.mat', 'rmsTest')



