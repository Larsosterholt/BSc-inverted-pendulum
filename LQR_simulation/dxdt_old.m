function dxdt = dxdt_old(t, x, l_B, l_P, I_B, I_P, L, m_P, B_B, B_P, R, g, K_t, K_e, B, U)
dxdt = [
    x(2);
    -(g*m_P*sin(x(1)) - B_P*x(2) + l_P^2*m_P*cos(x(1))*sin(x(1))*x(4)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*sin(2*x(1))*x(4)*l_P^2*x(2) - l_B*m_P*sin(x(1))*l_P*x(2)^2 + B_B*x(4) - K_t*x(5)))/(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B))/((m_P*l_P^2 + I_P)*((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1));
    x(4);
    (B_B*x(4) - K_t*x(5) + l_P^2*m_P*sin(2*x(1))*x(4)*x(2) - l_B*l_P*m_P*sin(x(1))*x(2)^2 + (l_B*l_P*m_P*cos(x(1))*(m_P*cos(x(1))*sin(x(1))*l_P^2*x(4)^2 - B_P*x(2) + g*m_P*sin(x(1))))/(m_P*l_P^2 + I_P))/(((l_B^2*l_P^2*m_P^2*cos(x(1))^2)/((m_P*l_P^2 + I_P)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B)) - 1)*(m_P*l_B^2 - m_P*l_P^2*cos(x(1))^2 + m_P*l_P^2 + I_B));
    -(K_e*x(4) - 0 + R*x(5))/L
    ];
dxdt = dxdt + B*U;

end
