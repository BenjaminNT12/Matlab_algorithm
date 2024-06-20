);
% Y = m*(v_p - w*p + u*r - y_g*(r^2 + p^2) + z_g*(q*r - p_p) + x_g*(q*p + r_p));
% Z = m*(w_p - u*q + v*p - z_g*(p^2 + q^2) + x_g*(r*p - q_p) + y_g*(r*q + p_p));
% K = I_x*p_p + (I_z - I_y)*q*r - (r_p + p*q)*I_xz + (r^2 - q^2)*I_yz + (p*r - q_p)*I_xy + m*(y_g*(w_p - u*q + v*p) - z_g*(v_p - w*p + u*r));
% M = I_y*q_p + (I_x - I_z)*r*p - (p_p + q*r)*I_xy + (p^2 - r^2)*I_zx + (q*p - r_p)*I_yz + m*(z_g*(u_p - v*r + w*q) - x_g*(w_p - u*q + v*p));
% N = I_z*r_p + (I_y - I_x)*p*q - (q_p + r*p)*I_yz + (q^2 - p^2)*I_xy + (r*q - p_p)*I_zx + m*(x_g*(v_p - w*p + u*r) - y_g*(u_p - v*r + w*q));
