function theta = pendFunk(t, theta_0, phi, g, l, m_p, B_p);

%PENDFUNK Summary of this function goes here
%   Detailed explanation goes here
l = x0(1);
m_p = x0(2);
B_p = x0(3);

wn = sqrt(g/l);
zeta = B_p/(2*l^2*m_p*sqrt(g/l));
theta = theta_0.*exp(-zeta.*wn.*t).*cos(sqrt(1-zeta^2).*wn.*t-phi);
end

