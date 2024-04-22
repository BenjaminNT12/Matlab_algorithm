clc       
clear           
close all       

m = 1.4;        
g = 9.81;       

T = 0.01;       
t = 0:T:40;     

% Parámetros de control
kdpsi = 15;
kppsi = 40;

kdx = -15;

kdy = 80;
kpy = 70;

kptheta = 10;
kdtheta = 100.1;

kpphi = 8;
kdphi = 80.1;

kpz = 1.1;
kdz = 1.5; 

% Referencias para el control
xd = 0;
xdp = 0.3;

yd = 0;
ydp = 0;

zd = 0.7; 
zdp = 0;

psid = 0;
psidp = 0;

% Condiciones iniciales
x(1,1:2)    = 1;    x(2,1:2) = -0.5; 
y(1,1:2)    = 0.5;  y(2,1:2) = 0.01; 
z(1,1:2)    = 0.5;  z(2,1:2) = 0.1; 

theta(1,1:2) = 1;   theta(2,1:2) = 0;
phi(1,1:2)   = 2;   phi(2,1:2)   = 0;
psi(1,1:2)   = 1.5; psi(2,1:2)   = 0;

X(1:2,1:2) = x;
X(3:4,1:2) = y;
X(5:6,1:2) = z;
X(7:8,1:2) = psi;
X(9:10,1:2) = theta;
X(11:12,1:2) = phi;


% inicialización de variables
ez = zeros(1,length(t));
ezp = zeros(1,length(t));
thetad = zeros(1,length(t));
etheta = zeros(1,length(t));
ethetap = zeros(1,length(t));
phid = zeros(1,length(t));
ephi = zeros(1,length(t));
ephip = zeros(1,length(t));
U = zeros(6,length(t));

for i = 2:length(t)-1
     
    ez(i) = zd - z(1,i);
    ezp(i) = zdp - z(2,i);
    thetad(i) = kdx*(xdp - x(2, i-1));
    etheta(i) = thetad(i) - theta(1,i);
    ethetap(i) = (etheta(i) - etheta(i-1))/T;
    phid(i) = kdy*( ydp - y(2,i-1)) + kpy*(yd - y(1,i-1));
    ephi(i) = phid(i) - phi(1,i);
    ephip(i) = (ephi(i) - ephi(i-1))/T;

    ux = 1;
    uy = 1;
    uz = m*(-kdz*ezp(i) - kpz*ez(i) + g)/(cosd(theta(1,i))*cosd(phi(1,i)));
    tauTildePsi = kdpsi*(psidp - psi(2,i)) + kppsi*(psid - psi(1,i-1));
    tauTildeTheta = kptheta*etheta(i) + kdtheta*ethetap(i);
    tauTildePhi = kdphi*ephip(i) + kpphi*ephi(i);

    U(1,i) = ux;
    U(2,i) = uy;
    U(3,i) = uz;
    U(4,i) = tauTildePsi;
    U(5,i) = tauTildeTheta;
    U(6,i) = tauTildePhi;

    [tt,zz] = ode45(@quadCopterModel2Order, [t(i) t(i+1)], X(:,i), [], U(:,i));
    X(:, i+1) = zz(end, :)';
    x(1:2,i+1) = X(1:2,i+1);
    y(1:2,i+1) = X(3:4,i+1);
    z(1:2,i+1) = X(5:6,i+1);
    psi(1:2,i+1) = X(7:8,i+1);
    theta(1:2,i+1) = X(9:10,i+1);
    phi(1:2,i+1) = X(11:12,i+1);
end

x1dplot = ones(1,length(t))*xd;
figure(1)
plot(t,x(1,:),'b',t,x1dplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('x (m)')


y1dplot = ones(1,length(t))*yd;
figure(2)
plot(t,y(1,:),'b',t,y1dplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('y (m)')

z1dplot = ones(1,length(t))*zd;
figure(3)
plot(t,z(1,:),'b',t,z1dplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('z (m)')

x1dpplot = ones(1,length(t))*xdp;
figure(4)
plot(t,x(2,:),'b',t,x1dpplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('x (m/s)')

y1dpplot = ones(1,length(t))*ydp;
figure(5)
plot(t,y(2,:),'b',t,y1dpplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('y (m/s)')


z1dpplot = ones(1,length(t))*zdp;
figure(6)
plot(t,z(2,:),'b',t,z1dpplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('z (m/s)')

psi1dplot = ones(1,length(t))*psid;
figure(7)
plot(t,psi(1,:),'b',t,psi1dplot,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('psi (deg)')

figure(8)
plot(t,theta(1,:),'b',t,thetad,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('theta (deg)')

figure(9)
plot(t,phi(1,:),'b',t,phid,'r--','LineWidth',2)
xlabel('Time (s)')
ylabel('phi (deg)')
