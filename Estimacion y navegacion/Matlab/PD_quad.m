t = [0 : 0.01 : 30];
m  = 2.85
l  = 0.1969
Jx = 0.0552 
Jy = 0.0552
Jz = 0.1104
K_afx = 0.008 
K_afy = 0.008
K_afz = 0.009
Jm = 0.0001 
Kt = 0.1188
Jx = 0.5522
Omega(1) = 0
% U = [0 -L*Kt 0 L*Kt; L*Kt 0 -L*Kt 0; Kt -Kt Kt -Kt];
% invU = pinv(U)

u   = [0 0 0] 
r0  = 0.5*cos(t);           
r0p = -0.5*sin(t);

kd2 = 20;
kp2 = 30;

kd1 = 20;
kp1 = 30;

kd3 = 20;
kp3 = 30;

ephi(1)  = 0;
ephip(1) = 0;
et(1)    = 0;
etp(1)   = 0;
epsi(1)  = 0;
epsip(1) = 0;


for i = 1: length(t)-1
    
    [tt, xx] = ode45(@quadrotor, [t(i) t(i+1)], x(i,:), [], u(i,:), omega(i));
    x(i+1,:) = xx(end,:);

    ephi(i+1)  = r0(i+1) -x(i+1,1);
    ephip(i+1) = r0p(i+1)-x(i+1,2);
    et(i+1)    = r0(i+1) -x(i+1,3);
    etp(i+1)   = r0p(i+1)-x(i+1,4);
    epsi(i+1)  = r0(i+1) -x(i+1,5);
    epsip(i+1) = r0p(i+1)-x(i+1,6);

    tau_x = Jx*(-(Jy-Jz)*x(i+1,4)*x(i+1,6)/Jx - Jm*omega(i) + K_afx*x(i+1,2)/Jx + kp1*ephi(i) + kd1*ephip(i)); 
    tau_y = Jy*(-(Jz-Jx)*x(i+1,2)*x(i+1,6)/Jy - Jm*omega(i) + K_afy*x(i+1,4)/Jy + kp2*et(i) + kd2*etp(i));
    tau_z = Jz*(-(Jx-Jy)*x(i+1,2)*x(i+1,4)/Jz - Jm*omega(i) + K_afz*x(i+1,6)/Jz + kp3*epsi(i) + kd3*epsip(i));

    u(i+1,:) = [tau_x; tau_y; tau_z];

    omgC = invU*tau;
    omg  = real(sqrt(omgC));
    omega(i+1) = omg(1)-omg(2)+omg(3)-omg(4);

end

plot(u)

figure(1)
subplot(311)
plot(t,r0,t,x(:,1))
legend('referencia','\phi')
ylabel('Orientacion roll[rad]')
subplot(312)
plot(t,r0,t,x(:,3))
legend('referencia','\theta')
ylabel('Orientacion pitch[rad]')
subplot(313)
plot(t,r0,t,x(:,5))
legend('referencia','\psi')
ylabel('Orientacion yaw[rad]')
xlabel('Tiempo[segundos]')