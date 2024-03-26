%Sliding Mode Control- CICLO

clc       
clear           % You can clear all variables
close all          % Is used to close all open figure windows

m = 1.4;           %masa del UAS
g = 9.81;          %fuerza gravitatoria (9.81 m/s^2)  

T = 0.01;          % Paso de integración 
t = 0:T:50;     % Vector de similitud

x = [0;
     0];
y = [0;
     0];
z = [0;
     0];    % Condiciones Iniciales


psi = [0;
       0];
theta = [0;
         0];
phi = [0;
       0];

X(1:2,1) = x;
X(3:4,1) = y;
X(5:6,1) = z;
X(7:8,1) = psi;
X(9:10,1) = theta;
X(11:12,1) = phi;

% z1d = (0.5 * square(pi*0.0333*t, 50)) + 1.5; % Control de entrada
% z1dp = zeros(1,length(t));  % Derivada de z1 deseado
% z1dpp = zeros(1,length(t)); 


kdpsi = 1;
kppsi = 1;

kdx = 1;

kdy = 5;
kpy = 2;

kptheta = 1;
kdtheta = 1.1;

kpphi = 1;
kdphi = 1.1;

kpz = 1;
kdz = 1; 




x1d = 0;
x1dp = 0.3;

y1d = 0;
y1dp = 0;

z1d = 0.7; 
z1dp = 0;

psi1d = 0;
psi1dp = 0;

theta1d = 0;
theta1dp = 0;   

phi1d = 0;
phi1dp = 0;

x(1,1) = 1; 
x(2,1) = -0.5; 
y(1,1) = 0.5; 
y(2,1) = 0.01; 
z(1,1) = 0.5; 
z(2,1) = 0.1; 

theta(1,1) = 1;
theta(2,1) = 0;
phi(1,1) = 2;
phi(2,1) = 0;
psi(1,1) = 1.5;
psi(2,1) = 0;

X(1:2,1) = x;
X(3:4,1) = y;
X(5:6,1) = z;
X(7:8,1) = psi;
X(9:10,1) = theta;
X(11:12,1) = phi;

for i = 1:length(t)-1
     ex(i) = x(1,i) - x1d;         
     exp(i) = x(2,i) - x1dp;

     ey(i) = y(1,i) - y1d;         
     eyp(i) = y(2,i) - y1dp;
     
    ez(i) = z(1,i) - z1d;         
    ezp(i) = z(2,i) - z1dp;



    epsi(i) = psi(1,i) - psi1d;       
    epsip(i) = psi(2,i) - psi1dp;

    etheta(i) = theta(1,i) - theta1d;
    ethetap(i) = theta(2,i) - theta1dp;

    ephi(i) = phi(1,i) - phi1d;
    ephip(i) = phi(2,i) - phi1dp;


    ux = 0;
    uy = 0;
    uz = m*(-kdz*z(2,i) - kpz*ez(i) + g)/(cos(theta(1,i))*cos(phi(1,i)));
    utheta = kdtheta*ethetap(i) + kptheta*etheta(i);
    upsi = kdpsi*epsip(i) + kppsi*epsi(i);
    uphi = kdphi*ephip(i) + kpphi*ephi(i);

    U(1,i) = ux;
    U(2,i) = uy;
    U(3,i) = uz;
    U(4,i) = upsi;
    U(5,i) = utheta;
    U(6,i) = uphi;

    [tt,zz] = ode45(@quadCopterModel2Order, [t(i) t(i+1)], X(:,i), [], U(:,i));
    X(:, i+1) = zz(end, :)';
    x(1:2,i+1) = X(1:2,i+1);
    y(1:2,i+1) = X(3:4,i+1);
    z(1:2,i+1) = X(5:6,i+1);
    psi(1:2,i+1) = X(7:8,i+1);
    theta(1:2,i+1) = X(9:10,i+1);
    phi(1:2,i+1) = X(11:12,i+1);
end

figure(1)
plot(t,x(1,:),'b',t,x1d,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('x (m)')
figure(2)
plot(t,y(1,:),'b',t,y1d,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('y (m)')
figure(3)
plot(t,z(1,:),'b',t,z1d,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('z (m)')

figure(4)
plot(t,x(2,:),'b',t,x1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('x (m/s)')
figure(5)
plot(t,y(2,:),'b',t,y1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('y (m/s)')
figure(6)
plot(t,z(2,:),'b',t,z1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('z (m/s)')

figure(7)
plot(t,psi(1,:),'b',t,psi1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('psi (rad)')
figure(8)
plot(t,theta(1,:),'b',t,theta1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('theta (rad)')
figure(9)
plot(t,phi(1,:),'b',t,phi1dp,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('phi (rad)')
