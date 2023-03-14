function obj = squareErrorFun(p, pendAngleMeasured, baseAngleMeasured)

% Simulate with the curren values of p
ts = [0:1/250:16];

x0 = [
    pi;
    0;
    0;
    0;
    0];

odeFunHandler = @(t, x) odeFunSys(t, x, p);
[t, x] = ode45(odeFunHandler, ts, x0);


% Cost function
A = ((x(:,1)-pendAngleMeasured).^2);
B = ((x(:,3)-baseAngleMeasured).^2);
obj = sum(A+B);

%Return the cost
obj = sum(obj);
end

