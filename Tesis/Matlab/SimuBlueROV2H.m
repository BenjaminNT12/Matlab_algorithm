clc; 
clear all; 
close all;

T = 0.05;                        
t = [0:T:20];                   
deltaT = T;
x = [0 0 0 0 0 0 0 0 0 0 0 0];                                

%Referencias circulo
ts = 0.05;
Tp = 4;
t2 = [0:ts:20];

%yaw = linspace(pi/180);
cc = pi*(1/Tp);
xr = 2*cos(2*cc*t2);
yr = 2*sin(2*cc*t2);
zr = 10;
%
m = 11.5;
W = 112.8;
B = 114.8;
rb = [0; 0; 0];
rg = [0; 0; 0.02];

xg = 0;
yg = 0;
zg = 0.02;

Ixy = 0;
Ixz = 0;
Iyz = 0;
Iyx = 0;
Izx = 0;
Izy = 0;

Ix = 0.16;
Iy = 0.16;
Iz = 0.16;

Xup = -5.5;
Yvp = -12.7;
Zwp = -14.57;
Kpp = -0.12;
Mqp = -0.12;
Nrp = -0.12;

Xu = -4.03;
Yv = -6.22;
Zw = -5.18;
Kp = -0.07;
Mq = -0.07;
Nr = -0.07;

XuNL = -18.18;
YvNL = -21.66;
ZwNL = -36.99;
KpNL = -1.55;
MqNL = -1.55;
NrNL = -1.55;

KP = diag([16           8        28      30       10        50]);
KI = diag([11           25       10       1        5       100]);
KD = diag([41           26       18       0        1       55 ]);

TauPID = [0 0 0 0 0 0]';
eib = 0;

for i=1:length(t)-1            
    [tt, xx] = ode45(@modeloSubmarino,[t(i) t(i+1)],x(i,:),[],TauPID(:,i));
    x(i+1,:) = xx(end,:);

    xreal=x(i+1,1);
    yreal=x(i+1,2);
    zreal=x(i+1,3);
    phi = x(i+1,4);
    theta = x(i+1,5);
    psi = x(i+1,6);

    nu = x(i+1,7:12)';

    u = x(i+1,7);
    v = x(i+1,8);
    w = x(i+1,9);
    p = x(i+1,10);
    q = x(i+1,11);
    r = x(i+1,12);

    J = [cos(psi)*cos(theta)    -sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi)      sin(psi)*sin(phi)+cos(psi)*sin(theta)*cos(phi)     0           0                   0;  
        sin(psi)*cos(theta)    cos(psi)*cos(phi)+sin(psi)*sin(theta)*sin(phi)        -cos(psi)*sin(phi)+sin(psi)*sin(theta)*cos(phi)   0           0                   0;
        -sin(theta)                         cos(theta)*sin(phi)                                 cos(theta)*cos(phi)                    0           0                   0;
            0                                      0                                                       0                           1   tan(theta)*sin(phi)   tan(theta)*cos(phi);
            0                                      0                                                       0                           0   cos(phi)              -sin(phi);
            0                                      0                                                       0                           0   sin(phi)/cos(theta)   cos(phi)/cos(theta)]; 
    JT= transpose(J); 

    M_RB = [m,    0,    0,    0,   m*zg,  0;
            0,    m,    0,   -m*zg,   0,  0;
            0,    0,    m,    0,      0,  0;
            0,  -m*zg,  0,    Ix,     0,  0;
           m*zg,  0,    0,    0,      Iy, 0;
            0,    0,    0,    0,      0,  Iz];
    
    M_A = -[Xup 0   0   0   0   0;
            0   Yvp 0   0   0   0;
            0   0  Zwp  0   0   0;
            0   0   0   Kpp 0   0;
            0   0   0   0   Mqp 0;
            0   0   0   0   0   Nrp];    
    
    C_RB = [0    0    0     0    m*w   0;
            0    0    0   -m*w   0     0;
            0    0    0    m*v  -m*u   0;
            0    m*w -m*v   0    Iz*r -Iy*q;
          -m*w   0   -m*u -Iz*r   0    Ix*p;
           m*v -m*u   0    Iy*q -Ix*p  0];
    
    C_A = [0     0      0       0   Zwp*w  0;
           0     0      0    -Zwp*w  0    -Xup*u;
           0     0      0    -Yvp*v Xup*u  0;
           0    -Zwp*w Yvp*v   0   -Nrp*r -Mqp*q;
          Zwp*w 0    -Xup*u  Nrp*r  0    -Kpp*p
         -Yvp*v Xup*u  0    -Mqp*q Kpp*p  0];
    
%     D = [Xu+XuNL    0       0   0       0       0;
%             0   Yv+YvNL     0   0       0       0;
%             0       0   Zw+ZwNL 0       0       0;
%             0       0       0   Kp+KpNL 0       0;
%             0       0       0   0       Mq+MqNL 0;
%             0       0       0   0       0       Nr+NrNL];
        
    D = -[Xu+XuNL*abs(u)     0               0                  0                 0                 0;
            0                Yv+YvNL*abs(v)  0                  0                 0                 0;
            0                0               Zw+ZwNL*abs(w)     0                 0                 0;
            0                0               0                  Kp+KpNL*abs(p)    0                 0;
            0                0               0                  0                 Mq+MqNL*abs(q)    0;
            0                0               0                  0                 0                 Nr+NrNL*abs(r)];

    g = [(W-B)*sin(theta);
         -(W-B)*cos(theta)*sin(phi);
         -(W-B)*cos(theta)*cos(phi);
         zg*W*cos(theta)*sin(phi);
         zg*W*sin(theta);
         0];

    etad = [xr(i); yr(i); 10; 0; 0; 0];
    
    M = M_RB + M_A;
    C = C_RB + C_A;
    
    JT = transpose(J);

    eeta = etad - x(i+1,1:6)';                   
    eetab(:,i+1) = JT*eeta;

    etap = J*x(i+1,7:12)';
    eetap =  - etap;                              
    eetapb(:,i+1) = JT*eetap;

    %eib =  eib + T*eb;
    ebi(:,i+1) = eetab(:,i) + T*eetapb(:,i);
    %TauPID(:,i+1) = kp*eb + ki*eib + kd*epb;
    TauPID(:,i+1) = KP*eetab(:,i+1) + KI*ebi(:,i+1) + KD*eetapb(:,i+1);
    
end

%Graficas
figure(1)
plot(xr,yr, x(:,1), x(:,2))
legend('Trayectoria real','Trayectoria deseada')
ylabel('Posición en x[m]')
xlabel('Posición en y[m]')

figure(2)
plot(t2,xr,t2,x(:,1))
legend('Trayectoria real','Trayectoria deseada')
ylabel('Posición en x[m]')
xlabel('Posición en y[m]')

figure(3)
plot(t2,yr,t2,x(:,2))
legend('Trayectoria real','Trayectoria deseada')
ylabel('Posición en x[m]')
xlabel('Posición en y[m]')





