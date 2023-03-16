function obj = costFun(p, pendAngleMeasured, baseAngleMeasured, currentMeasured)


ts = [0:1/200:16];

x0 = [
    pi;
    0;
    0;
    0;
    0];

% Simulate with the curren values of p
odeFunHandler = @(t, x) odeFunSys(t, x, p);
[~, x] = ode45(odeFunHandler, ts, x0);


% Cost function
A = ((x(:,1) - pendAngleMeasured).^2);
B = ((x(:,3)-baseAngleMeasured).^2);
C = ((x(:,5)-currentMeasured).^2);
obj = sum(A+B+C);

% Return the cost
obj = sum(obj);
end

