clc
clear all
close all

u = 0
m = 1;
g = 9.81;
Ixx = 0.1;
Iyy = 0.1;
Izz = 0.1;

T = 0.01;
t = [0:T:1];
x = [0 0 0 0 0 0 0 0 0 0 0 0];

zd = 1+0.5*cos(t);
zdp = -0.5*sin(t);
zd2p = -0.5*cos(t);

k1x=50;
k2x=250;

k1y=50;
k2y=250;

k1z=70;
k2z=400;

k1 = 5*diag([1 1 2]);
k2 = 5*diag([2 2 5]);

phid = 0;
phidp = 0;
phid2p = 0;

td = 0;
tdp = 0;
td2p = 0;

psid = 0*cos(t);
psidp = 0*sin(t);
psid2p = 0*cos(t);

tau = [0 0 0]';

%x y z phi = x(4);theta = x(5);psi = x(6); xp yp zp phip = x(10);thetap = x(11); psip = x(12);

xd = 0.5*cos(t);
xdp = -0.5*sin(t);
xd2p = -0.5*cos(t);
yd = 0.5*cos(t);
ydp = -0.5*sin(t);
yd2p = -0.5*cos(t);


xd = 0.5*cos(t);
xdp = -0.5*sin(t);
xd2p = -0.5*cos(t);

yd = 0.5*cos(t);
ydp = -0.5*sin(t);
yd2p = -0.5*cos(t);

for i=1:length(t)-1
    [tt,xx] = ode45(@modeloCUADRIROTOR,[t(i) t(i+1)],x(i,:),[],tau(:,i),u(i));
    x(i+1,:) = xx(end,:);
    
    ez = x(i+1,3) - zd(i+1);
    ezp = x(i+1,9) -zdp(i+1);
    
    u(i+1)=(m/cos(x(i+1,4))*cos(x(i+1,5)))*(zd2p(i+1)-k1z*ezp-k2z*ez+g);


    
	etap = [x(i+1,10) x(i+1,11) x(i+1,12)]';

    J = [Ixx,0,-Ixx*sin(x(i+1,5));0,Iyy*cos(x(i+1,4))^2+Izz*sin(x(i+1,4))^2,cos(x(i+1,4))*cos(x(i+1,5))*sin(x(i+1,4))*(Iyy-Izz);-Ixx*sin(x(i+1,5)),cos(x(i+1,4))*cos(x(i+1,5))*sin(x(i+1,4))*(Iyy-Izz),Ixx*sin(x(i+1,5))^2+Iyy*cos(x(i+1,5))^2*sin(x(i+1,4))^2+Izz*cos(x(i+1,4))^2*cos(x(i+1,5))^2];
    c11 = 0;
    c12 = (Iyy-Izz)*(x(i+1,11)*cos(x(i+1,4))*sin(x(i+1,4))+x(i+1,12)*sin(x(i+1,4))^2*cos(x(i+1,5)))+(Izz-Iyy)*x(i+1,12)*cos(x(i+1,4))^2*cos(x(i+1,5))-Ixx*x(i+1,12)*cos(x(i+1,5));
    c13 = (Izz-Iyy)*x(i+1,12)*cos(x(i+1,4))*sin(x(i+1,4))*cos(x(i+1,5))^2;
    c21 = (Iyy-Izz)*(x(i+1,11)*cos(x(i+1,4))*sin(x(i+1,4))+x(i+1,12)*sin(x(i+1,4))^2*cos(x(i+1,5)))+(Izz-Iyy)*x(i+1,12)*cos(x(i+1,4))^2*cos(x(i+1,5))-Ixx*x(i+1,12)*cos(x(i+1,5));
    c22 = (Izz-Iyy)*x(i+1,10)*cos(x(i+1,4))*sin(x(i+1,4));
    c23 = -Ixx*x(i+1,12)*cos(x(i+1,5))*sin(x(i+1,5))+Iyy*x(i+1,12)*sin(x(i+1,4))^2*cos(x(i+1,5))*sin(x(i+1,5))+Izz*x(i+1,12)*cos(x(i+1,4))^2*cos(x(i+1,5))*sin(x(i+1,5));
    c31 = (Iyy-Izz)*x(i+1,12)*cos(x(i+1,5))^2*cos(x(i+1,4))*sin(x(i+1,4))-Ixx*x(i+1,11)*cos(x(i+1,5));
    c32 = (Izz-Iyy)*(x(i+1,11)*cos(x(i+1,4))*sin(x(i+1,4))*sin(x(i+1,5))+x(i+1,10)*sin(x(i+1,4))^2*cos(x(i+1,5)))+(Iyy-Izz)*x(i+1,11)*cos(x(i+1,4))^2*cos(x(i+1,5))*-c23;
    c33 = (Iyy-Izz)*x(i+1,10)*cos(x(i+1,4))*sin(x(i+1,4))*cos(x(i+1,5))^2-Iyy*x(i+1,11)*sin(x(i+1,4))^2*cos(x(i+1,5))*sin(x(i+1,5))-Izz*x(i+1,11)*cos(x(i+1,4))^2*cos(x(i+1,5))*sin(x(i+1,5))-Ixx*x(i+1,11)*cos(x(i+1,5))*sin(x(i+1,5));
    C = [c11,c12,c13;c21,c22,c23;c31,c32,c33];

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %x y z phi = x(4);theta = x(5);psi = x(6); xp yp zp phip = x(10);thetap = x(11); psip = x(12);
    ex = x(i+1,1) - xd(i+1);
    exp = x(i+1,7) - xdp(i+1);

    ey = x(i+1,2) - yd(i+1);
    eyp = x(i+1,8) - ydp(i+1);

    ux = (xd2p(i+1) - k1x*exp - k2x*ex);
    uy = (yd2p(i+1) - k1y*eyp - k2y*ey);

    phid_c = asin((m/u(i+1))*(sin(x(6))*ux-cos(x(6))*uy));
    td_c = asin(((m/u(i+1))*(cos(x(6))*ux-sin(x(6))*uy))/cos(x(4)));

    td(i+1) = td_c;
    phid(i+1) = phid_c;
    
    tdp(i+1) = 0;
    phidp(i+1) = 0;
    
    td2p(i+1) = 0;
    phid2p(i+1) = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
    etad2p = [phid2p(i+1) td2p(i+1) psid2p(i+1)]';
    
    error_eta = [phid(i+1) td(i+1) psid(i+1)]'-x(i+1,4:6)';
    error_etap = [phidp(i+1) tdp(i+1) psidp(i+1)]'-x(i+1,10:12)';
    
    tau(:,i+1) = C*etap + J*(etad2p+k2*error_eta + k1*error_etap);
    
end
%x y z phi = x(4);theta = x(5);psi = x(6); xp yp zp phip = x(10);thetap = x(11); psip = x(12);
subplot(511)
plot(t,xd,t,x(:,1))
legend('x_d','x')

subplot(512)
plot(t,yd,t,x(:,2))
legend('y_d','y')

subplot(513)
plot(t,phid,t,x(:,4))
legend('phi_d','phi')

subplot(514)
plot(t,td,t,x(:,5))
legend('theta_d','theta')

subplot(515)
plot(t,psid,t,x(:,6))
legend('psi_d','psi')


figure
plot(t,zd,t,x(:,3))
legend('z_d','z')
