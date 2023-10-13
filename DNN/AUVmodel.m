function dxdt = AUVmodel(x,y,z,psi)

    % Parameters
    X_u = 3.03 % kg/s;
    Y_v = 3.21 % kg/s;
    Z_w = 8.18 % kg/s;
    N_r = 0.07 % kgm/s;
    X_uABSu = 4.03 % kg/s;
    Y_vABSv = 6.21 % kg/s;
    Z_wABSw = 5.18 % kg/s;
    N_rABSr = 0.07 % kgm/s;

    J = [cos(psi)   -sin(psi)   0   0;
         sin(psi)   cos(psi)    0   0;
         0              0       1   0;
         0              0       0   1];
 
    M = [(m-X_up)   0       0       0;
         0      (m-Y_vp)    0       0;
         0          0   (m-Z_wp)    0;
         0          0       0   (Izz-N_rp)];

    C = [     0            0        0     -(m-Y_vp)*v;
              0            0        0      (m-X_up)*u;
              0            0        0               0;
         (m-Y_vp)*v   -(m-X_up)*u   0               0];

    D = [X_u+X_uABSu    0           0           0;
            0       Y_v+Y_vABSv     0           0;
            0           0       Z_w+Z_wABSw     0;
            0           0           0       N_r+N_rABSr];

    G = [   0;
            0;
         -(W-B);
            0];

    tau = [
        tau_x;
        tau_y;
        tau_z;
        tau_psi];
            
    tau_d = [
        tau_x_d;
        tau_y_d;
        tau_z_d;
        tau_psi_d];

    M_eta = J_eta*M
    dxdt = zeros(6,1);
end