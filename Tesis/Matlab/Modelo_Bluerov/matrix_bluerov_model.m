clear 
close all
syms x y z phi theta psi u v w p q r T1 T2 T3 T4
syms I_x I_y I_z I_xy I_xz I_yz I_yx I_zx I_zy
syms x_g y_g z_g 
syms m u_p r_p q_p

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


I_o = [I_x -I_xy -I_xz;
       -I_yx I_y -I_yz;
       -I_zx -I_zy I_z];

I_3x3 = eye(3);

r_bg = [x_g y_g z_g]';

S = Smtrx(r_bg);

M_rb = [m*I_3x3 -m*S;
        m*S      I_o];


X = m*(u_p - v*r + w*q - x_g*(q^2 + r^2) + y_g*(p*q - r_p) + z_g*(p*r + q_p));
Y = m*(v_p - w*p + u*r - y_g*(r^2 + p^2) + z_g*(q*r - p_p) + x_g*(q*p + r_p));
Z = m*(w_p - u*q + v*p - z_g*(p^2 + q^2) + x_g*(r*p - q_p) + y_g*(r*q + p_p));
K = I_x*p_p + (I_z - I_y)*q*r - (r_p + p*q)*I_xz + (r^2 - q^2)*I_yz + (p*r - q_p)*I_xy + m*(y_g*(w_p - u*q + v*p) - z_g*(v_p - w*p + u*r));
M = I_y*q_p + (I_x - I_z)*r*p - (p_p + q*r)*I_xy + (p^2 - r^2)*I_zx + (q*p - r_p)*I_yz + m*(z_g*(u_p - v*r + w*q) - x_g*(w_p - u*q + v*p));
N = I_z*r_p + (I_y - I_x)*p*q - (q_p + r*p)*I_yz + (q^2 - p^2)*I_xy + (r*q - p_p)*I_zx + m*(x_g*(v_p - w*p + u*r) - y_g*(u_p - v*r + w*q));













function S=Smtrx(r)
    S=[0,-r(3),r(2);...
        r(3),0,-r(1);...
        -r(2),r(1),0];
end






