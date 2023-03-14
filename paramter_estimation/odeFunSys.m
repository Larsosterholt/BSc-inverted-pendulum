function dxdt = odeFunSys(t, x, p)
% This function is used to simulate the pendulum

% "Decoding" the guess vector
l_B = p(1);
l_P = p(2);
I_B = p(3);
I_P = p(4);
L = p(5);
m_P = p(6);
B_B = p(7);
B_P = p(8);
R = p(9);
K_t = p(10);
K_e = p(11);

g = 9.81; % Known value
B = [0 0 0 0 1/p(5)]'; % Known value


% Creating the impulse responce
if(t >= 0.5 & t <= 1)
    U = (100/255)*11;
else
    U = 0;
end

%Updating the vector
    dxdt = [
    x(2);
    -(g*m_P*sin(x(1)) - B_P*x(2) + l_P^2*m_P*cos(x(1))*sin(x(1))*x(4)^2 + ...
    (l_B*l_P*m_P*cos(x(1))*(m_P*sin(2*x(1))*x(4)*l_P^2*x(2) - l_B*m_P*sin(x(1))*l_P*x(2)^2 + ...
    B_B*x(4) - K_t*x(5)))/(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + ... 
    m_P*l_P^2 + I_B))/((m_P*l_P^2 + I_P)*((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 ... 
    + m_P*l_P^2 + I_B)) - 1));
    x(4);
    (B_B*x(4) - K_t*x(5) + l_P^2*m_P*sin(2*x(1))*x(4)*x(2) - l_B*l_P*m_P*sin(x(1))*x(2)^2 + ...
    (l_B*l_P*m_P*cos(x(1))*(m_P*cos(x(1))*sin(x(1))*l_P^2*x(4)^2 - ...
    B_P*x(2) + g*m_P*sin(x(1))))/(m_P*l_P^2 + I_P))/(((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 ... 
    + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B));
    -(K_e*x(4) - 0 + R*x(5))/L
    ];
dxdt = dxdt + B*U; % Controller input
end

