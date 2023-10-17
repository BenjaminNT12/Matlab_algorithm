function dxdt = quadrotor(t,x,u,omega)

% Parametros
m  = 2.85;
l  = 0.1969;
Jx = 0.0552; 
Jy = 0.0552;
Jz = 0.1104;
K_afx = 0.008;
K_afy = 0.008;
K_afz = 0.009;
Jm = 0.0001;
Kt = 0.1188;
Jx = 0.5522;

Control PD

tau = [tau_x; tau_y; tau_z]

dxdt(1,1) = x(2);
dxdt(2,1) =(1/Jy)*((Jz-Jx)*x(4)*x(6)+Jm*OMEGA+tau2-Kay*x(2));
% Modelo para roll
% phi2p=(Jy-Jz)/Jx*thetap*psip+Jm*omega/Jx+tau1/Jx-Kax*phip;
dxdt(3,1) = x(4);
dxdt(4,1) =(1/Jx)*((Jy-Jz)*x(2)*x(6)+Jm*OMEGA+tau1-Kax*x(4));
% Modelo para yaw
% yaw2p=(Jx-Jy)/Jz*phip*thetap+tau3/Jz-Kaz*psip;
dxdt(5,1) = x(6);
dxdt(6,1) = (1/Jz)*((Jx-Jy)*x(4)*x(2)+tau3-Kaz*x(6));

x1pp = x(2);
x2pp = ((Jy - Jz)*x(4)*x(6) + Jm*omega + u(1) - K_afx*x(2))/Jx;
x3pp = x(4);
x4pp = ((Jz - Jx)*x(2)*x(6) + Jm*omega + u(2) - K_afy*x(4))/Jy;
x5pp = x(6);
x6pp = ((Jx - Jy)*x(2)*x(4) + u(3) - K_afz*x(6))/Jz;

dxdt = [x1pp;
        x2pp;
        x3pp;
        x4pp;
        x5pp;
        x6pp];
end