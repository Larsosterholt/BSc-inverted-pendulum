function obj = squareErrorFun(p, pendAngleMeasured, baseAngleMeasured)




ts = [0:1/250:16];
% Initial condition
x0 = [
    pi;
    0;
    0;
    0;
    0];

%  Runge-Kutta solver
odeFunHandler = @(t, x) odeFunSys(t, x, p);
[t, x] = ode45(odeFunHandler, ts, x0);

%pendAngleMeasured = (-1)*impulseTest.pendAngle.signals.values + pi;
%baseAngleMeasured = impulseTest.baseAngle.signals.values;

A = ((x(:,1)-pendAngleMeasured).^2);
B = ((x(:,3)-baseAngleMeasured).^2);
obj = sum(A+B);
obj = sum(obj);
end

