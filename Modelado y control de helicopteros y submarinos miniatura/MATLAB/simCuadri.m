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
t = [0:T:20];
x = [0 0 0 0 0 0 0 0 0 0 0 0];

zd = 1+0.5*cos(t);
zdp = -0.5*sin(t);
zd2p = -0.5*cos(t);

k1z=70;
k2z=400;

k1 = 5*diag([1 1 2]);
k2 = 5*diag([2 2 5]);

phid = 0.5*cos(t);
phidp = -0.5*sin(t);
phid2p = -0.5*cos(t);

td = 0.5*cos(t);
tdp = -0.5*sin(t);
td2p = -0.5*cos(t);

psid = 0.5*cos(t);
psidp = -0.5*sin(t);
psid2p = -0.5*cos(t);
tau = [0 0 0]';


for i=1:length(t)-1
    [tt,xx] = ode45(@modeloCUADRIROTOR,[t(i) t(i+1)],x(i,:),[],tau(:,i),u(i));
    x(i+1,:) = xx(end,:);
    
    ez = x(i+1,3) - zd(i+1);
    ezp = x(i+1,9) -zdp(i+1);% esto porque la derivada de zd que es fija su derivada es cero
    
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
    
    etad2p = [phid2p(i+1) td2p(i+1) psid2p(i+1)]';
    error_eta = [phid(i+1) td(i+1) psid(i+1)]'-x(i+1,4:6)';
    error_etap = [phidp(i+1) tdp(i+1) psidp(i+1)]'-x(i+1,10:12)';
    tau(:,i+1) = C*etap + J*(etad2p+k2*error_eta + k1*error_etap);
    
end
subplot(311)
plot(t,phid,t,x(:,4))
legend('phi_d','phi')

subplot(312)
plot(t,phid,t,x(:,5))
legend('t_d','t')

subplot(313)
plot(t,phid,t,x(:,6))
legend('psi_d','psi')




figure
plot(t,zd,t,x(:,3))
legend('z_d','z')
