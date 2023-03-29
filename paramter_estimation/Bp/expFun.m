function zetaOmegan = expFun(zetaOmegan0, xData, theta0)
    % expFun: Function to fit data to an exponential decay function
    %
    % Inputs:
    %   zetaOmegan0: Initial guess for the optimization parameter (zeta * omega_n)
    %   xData: Time steps at which the function should be evaluated
    %   theta0: Initial condition of the pendulum
    %
    % Output:
    %   zetaOmegan: Optimized parameter (zeta * omega_n) for the exponential decay function

    zetaOmegan = theta0 * exp(zetaOmegan0 * xData);
end