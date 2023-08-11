function dxdt = modeloSubmarino(t,x,tauPID)

W=112.8; 
B=114.8;    
m=11.5;  
%rb=[0;0;0];
%rg=[0;0;0.02]   Vector de posición del centro de gravedad
%xg=0;
%yg=0;
zg=0.02;
Ix = 0.16;  
Iy = 0.16; 
Iz = 0.16;  

Xup=-5.5;   
Yvp=-12.7;   
Zwp=-14.57; 
Kppunto=-0.12;   
Mqp=-0.12;   
Nrp=-0.12;   

Xu=-4.03;   
Yv=-6.22;    
Zw=-5.18;    
Kp=-0.07;    
Mq=-0.07;    
Nr=-0.07;    

Xuu=-18.18;    
Yvv=-21.66;   
Zww=-36.99;   
Kpp=-1.55;     
Mqq=-1.55;     
Nrr=-1.55;     

phi = x(4);
theta = x(5);
psi = x(6);
u = x(7);
v = x(8);
w = x(9);
p = x(10);
q = x(11);
r = x(12);

M_RB=[ m      0       0      0      m*zg   0;
      0      m       0      -m*zg  0      0;
      0      0       m      0      0      0;
      0      -m*zg   0      Ix     0      0;
      m*zg   0       0      0      Iy     0;
      0      0       0      0      0      Iz];
C_RB=[0      0       0       0       m*w     0;
     0      0       0       -m*w    0       0;
     0      0       0       m*v     -m*u    0;
     0      m*w     -m*v    0       Iz*r    -Iy*q;
     -m*w   0       -m*u    -Iz*r   0       Ix*p;
     m*v    -m*u    0       Iy*q    -Ix*p   0 ];
M_A=-[Xup 0  0  0  0  0;
     0  Yvp 0  0  0  0;
     0   0 Zwp 0  0  0;
     0   0  0 Kpp 0  0;
     0   0  0  0 Mqp 0;
     0   0  0  0  0  Nrp];
C_A=[0          0       0        0         Zwp*w    0;
    0          0       0        -Zwp*w    0        -Xup*u;
    0          0       0        -Yvp*v    Xup*u    0;
    0          -Zwp*w  Yvp*v    0         -Nrp*r   Mqp*q;
    Zwp*w      0       -Xup*u   Nrp*r     0        -Kppunto*p;
    -Yvp*v     Xup*u   0        -Mqp*q    Kppunto*p    0];
D=-[Xu+Xuu*abs(u)   0               0                  0                 0                 0;
    0                Yv+Yvv*abs(v)  0                  0                 0                 0;
    0                0                Zw+Zww*abs(w)    0                 0                 0;
    0                0                0                  Kp+Kpp*abs(p)   0                 0;
    0                0                0                  0                 Mq+Mqq*abs(q)   0;
    0                0                0                  0                 0                 Nr+Nrr*abs(r)];
g=[(W-B)*sin(theta);
    -(W-B)*cos(theta)*sin(phi);
    -(W-B)*cos(theta)*cos(phi);
    zg*W*cos(theta)*sin(phi);
    zg*W*sin(theta);
    0];
M=M_RB+M_A;
C=C_RB+C_A;
% Rnb=[cos(psi)*cos(theta)    -sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi)      sin(psi)*sin(phi)+cos(psi)*sin(theta)*cos(phi);  
%      sin(psi)*cos(theta)    cos(psi)*cos(phi)+sin(psi)*sin(theta)*sin(phi)        -cos(psi)*sin(phi)+sin(psi)*sin(theta)*cos(phi);
%      -sin(theta)                         cos(theta)*sin(phi)                                 cos(theta)*cos(phi)]
% 
% T=[1    tan(theta)*sin(phi)   tan(theta)*cos(phi)
%    0         cos(phi)             -sin(phi)
%    0    sin(phi)/cos(theta)   cos(phi)/cos(theta)] 
J = [cos(psi)*cos(theta)    -sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi)      sin(psi)*sin(phi)+cos(psi)*sin(theta)*cos(phi)     0           0                   0;  
     sin(psi)*cos(theta)    cos(psi)*cos(phi)+sin(psi)*sin(theta)*sin(phi)        -cos(psi)*sin(phi)+sin(psi)*sin(theta)*cos(phi)   0           0                   0;
     -sin(theta)                         cos(theta)*sin(phi)                                 cos(theta)*cos(phi)                    0           0                   0;
         0                                      0                                                       0                           1   tan(theta)*sin(phi)   tan(theta)*cos(phi);
         0                                      0                                                       0                           0   cos(phi)              -sin(phi);
         0                                      0                                                       0                           0   sin(phi)/cos(theta)   cos(phi)/cos(theta)]; 
%Ecuaciones representación de estado
%x y z phi theta psi u v w p q r 
%etap=J*nu
%M*nup+C*nu+D*nu*g=tau
%nu=[ u; v;  w; p;  q;  r]
nu = [x(7);x(8);x(9);x(10);x(11);x(12)];

dxdt(1:6,1) = J*nu; % x y z phi theta psi
dxdt(7:12,1) = inv(M)*(tauPID-C*nu-D*nu-g); % u v w p q r
