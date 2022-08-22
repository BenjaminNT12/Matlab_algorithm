function [phi2p, theta2p, psi2p,omg] = quadrotor(phi, theta, psi,omg)

% Parametros
m = 2.85
l = 0.1969
Jx = 0.0552 
Jy = 0.0552
Jz = 0.1104
K_afx = 0.008 
K_afy = 0.008
K_afz = 0.009
Jm = 0.0001 
Kt =0.1188
Jx = 0.5522

omega = omg(1)-omg(2)+omg(3)-omg(4)

% Control PD
tau_x = (-(Jy - Jz)*q*r - Jm*omega + K_afx*p)
tau_y = (-(Jy - Jz)*p*r - Jm*omega + K_afy*p)
tau_z = -(Jx - Jy)*p*q + K_afz*r

tau = [tau_x; tau_y; tau_z]

x1pp = x2
x2pp = ((Jy - Jz)*x4*x6 + Jm*omega + tau_x - K_afx*x2)/Jx
x3pp = x4
x4pp = ((Jz - Jx)*x2*x6 + Jm*omega + tau_y - K_afy*x4)/Jy
x5pp = x5
x6pp = ((Jx - Jy)*x2*x4 + tau_z - K_afz*x6)/Jz


U = [0 -L*Kt 0 L*Kt; L*Kt 0 -L*Kt 0; Kt -Kt Kt -Kt] 
omg = inv(U)*tau;
end