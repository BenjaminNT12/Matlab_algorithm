clear 
close all
syms x y z phi theta psi u v w p q r T1 T2 T3 T4
syms I_x I_y I_z I_xy I_xz I_yz I_yx I_zx I_zy
syms x_g y_g z_g

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

S = Smtrx(r_bg)

function S=Smtrx(r)
    % S=SMTRX(r) computes the 3x3 vector cross product matrix S=-S'
    % such that rxt=S(r)t is true for all 3x1 vectors r and t
    %
    % Author:   Thor I. Fossen
    % Date:     14th June 2001
    % Revisions:
    S=[0,-r(3),r(2);...
        r(3),0,-r(1);...
        -r(2),r(1),0];
end






