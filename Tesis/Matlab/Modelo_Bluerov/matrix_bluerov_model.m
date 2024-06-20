clear 
close all
syms x y z 
syms phi theta psi
syms u v w real% velocidades lineales
syms p q r real% velocidades angulares
% syms x y z phi theta psi u v w p q r T1 T2 T3 T4

% solo se utilizan x y z 
% phi theta psi son posiciones angulares que se consideran estables
% u v w son velocidades lineales
% p q r son velocidades angulares
syms I_xx real
syms I_yy real
syms I_zz real
syms I_xy real
syms I_xz real
syms I_yx real
syms I_yz real
syms I_zx real
syms I_zy real

syms x_g y_g z_g real % centro de gravedad
syms m real

syms u_p v_p w_p p_p q_p r_p real % Declare symbolic variables
syms X_up Y_vp Z_wp K_pp M_qp N_rp real % Declare symbolic variables


% syms u_p v_p w_p real% aceleraciones lineales

% r_p = 0; 
% q_p = 0;
% p_p = 0;

% phi = 0;
% theta = 0;
% psi = 0;

% p = 0;
% q = 0;
% r = 0; 


eta = [x y z phi theta psi]';
nu = [u v w p q r]';

R_bn = [cos(theta)*cos(psi) -sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi) sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(theta);
        cos(theta)*sin(psi) cos(psi)*cos(phi)+sin(psi)*sin(theta)*sin(phi) -cos(psi)*sin(phi)+sin(theta)*sin(psi)*cos(phi);
        -sin(theta) cos(theta)*sin(phi) cos(theta)*cos(phi)];

T_theta = [1 sin(phi)*tan(theta) cos(phi)*tan(theta);
           0 cos(phi) -sin(phi);
           0 sin(phi)/cos(theta) cos(phi)/cos(theta)];

zero_3x3 = zeros(3,3);

J_eta = [R_bn zero_3x3;
         zero_3x3 T_theta];

J_11 = R_bn;
J_12 = zero_3x3;
J_21 = zero_3x3;
J_22 = T_theta;

J = [J_11 J_12;
     J_21 J_22];

J_inv = inv(J);

J_inv_11 = J_inv(1:3,1:3);
J_inv_12 = J_inv(1:3,4:6);
J_inv_21 = J_inv(4:6,1:3);
J_inv_22 = J_inv(4:6,4:6);

J_11_inv = inv(J_11);
J_22_inv = inv(J_22);
J_12_inv = inv(J_12);
J_21_inv = inv(J_21);

J_inv_m = [J_11_inv J_12_inv;
           J_21_inv J_22_inv];

if J_inv_22 == J_22_inv
    disp('J_inv == J_inv_m si son iguales')
else
    disp("no son iguales")
end


I_o = [I_xx  -I_xy -I_xz;
       -I_yx  I_yy -I_yz;
       -I_zx -I_zy  I_zz];

I_3x3 = eye(3);

r_bg = [x_g y_g z_g]';
% localizacion del centro de gravedad

S = Smtrx(r_bg);

M_rb = [m*I_3x3 -m*S;
        m*S      I_o];


M_A= [ X_up,      0,      0,      0,      0,      0;
       0,      Y_vp,      0,      0,      0,      0;
       0,      0,      Z_wp,      0,      0,      0;
       0,      0,      0,   K_pp,      0,      0;
       0,      0,      0,      0,   M_qp,      0;
       0,      0,      0,      0,      0,   N_rp];


% matriz de inercias
M = M_rb + M_A;


M11 = M(1:3,1:3);
M12 = M(1:3,4:6);
M21 = M(4:6,1:3);
M22 = M(4:6,4:6);

nu_1 = [u v w]';
nu_2 = [p q r]';


C = [zero_3x3                         -Smtrx((M11*nu_1 + M12*nu_2)');
     -Smtrx((M11*nu_1 + M12*nu_2)')   -Smtrx((M21*nu_1 + M22*nu_2)')];

% X = m*(u_p - v*r + w*q - x_g*(q^2 + r^2) + y_g*(p*q - r_p) + z_g*(p*r + q_p));
% Y = m*(v_p - w*p + u*r - y_g*(r^2 + p^2) + z_g*(q*r - p_p) + x_g*(q*p + r_p));
% Z = m*(w_p - u*q + v*p - z_g*(p^2 + q^2) + x_g*(r*p - q_p) + y_g*(r*q + p_p));
% K = I_xx*p_p + (I_zz - I_zz)*q*r - (r_p + p*q)*I_xz + (r^2 - q^2)*I_yz + (p*r - q_p)*I_xy + m*(y_g*(w_p - u*q + v*p) - z_g*(v_p - w*p + u*r));
% M = I_zz*q_p + (I_xx - I_zz)*r*p - (p_p + q*r)*I_xy + (p^2 - r^2)*I_zx + (q*p - r_p)*I_yz + m*(z_g*(u_p - v*r + w*q) - x_g*(w_p - u*q + v*p));
% N = I_zz*r_p + (I_zz - I_xx)*p*q - (q_p + r*p)*I_yz + (q^2 - p^2)*I_xy + (r*q - p_p)*I_zx + m*(x_g*(v_p - w*p + u*r) - y_g*(u_p - v*r + w*q));

% letters = [X Y Z K M N];
% accelerations = [u_p v_p w_p p_p q_p r_p];
% M_A_jacobian = jacobian(letters, accelerations)


% X_up =      m;
% Y_up =      0;
% Z_up =      0;
% K_up =      0;
% M_up =  m*z_g;
% N_up = -m*y_g;

% X_vp =      0;
% Y_vp =      m;
% Z_vp =      0;
% K_vp = -m*z_g;
% M_vp =      0;
% N_vp =  m*x_g;
 
% X_wp =      0;
% Y_wp =      0;
% Z_wp =      m;
% K_wp =  m*y_g;
% M_wp = -m*x_g;
% N_wp =      0;

% X_pp =       0;
% Y_pp =  -m*z_g;
% Z_pp =   m*y_g;
% K_pp =    I_xx;
% M_pp =   -I_xy;
% N_pp =   -I_zx;


% X_qp =  m*z_g;
% Y_qp =      0;    
% Z_qp = -m*x_g;  
% K_qp =  -I_xy;   
% M_qp =   I_zz;    
% N_qp =  -I_yz;   

% X_rp = -m*y_g;
% Y_rp =  m*x_g;
% Z_rp =      0;
% K_rp =  -I_xz;
% M_rp =  -I_yz;
% N_rp =   I_zz;   

C_rb = [zero_3x3                                     -m*Smtrx(nu_1) - m*Smtrx(Smtrx(nu_2)*r_bg);
        -m*Smtrx(nu_1) - m*Smtrx(Smtrx(nu_2)*r_bg)  m*Smtrx(Smtrx(nu_1)*r_bg) - Smtrx(I_o*nu_2)];

% C_A = [0 0 0 0 -Z_wp*w Y_vp*v;
%        0 0 0 Z_wp*w 0 -X_up*u;
%        0 0 0 -Y_vp*v X_up*u 0;
%        0 -Z_wp*w Y_vp*v 0 -N_rp*r M_qp*q;
%        Z_wp*w 0 -X_up*u N_rp*r 0 -K_pp*p;
%        -Y_vp*v X_up*u 0 -M_qp*q K_pp*p 0];
       
% C_2 = C_rb + C_A;


% D = diag([X_up, Y_vp, Z_wp, K_pp, M_qp, N_rp])

% % W = m*g
% % B = 


function S=Smtrx(r)

    S = [0,-r(3),r(2);...
        r(3),0,-r(1);...
        -r(2),r(1),0];
end




















% M_A= [     m,      0,      0,      0,  m*z_g, -m*y_g;
%            0,      m,      0, -m*z_g,      0,  m*x_g;
%            0,      0,      m,  m*y_g, -m*x_g,      0;
%            0, -m*z_g,  m*y_g,   I_xx,  -I_xy,  -I_xz;
%        m*z_g,      0, -m*x_g,  -I_xy,   I_zz,  -I_yz;
%       -m*y_g,  m*x_g,      0,  -I_zx,  -I_yz,   I_zz];


