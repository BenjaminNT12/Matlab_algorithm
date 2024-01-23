function dxdt = mod_submaDOF6(t, X, U) 

%% Parámetros
    m = 11.5;       
    W = 112.8;     
    B = 114.8;
    Ixx = 0.16;
    Iyy = 0.16;
    Izz = 0.16;   
    
    
    
    Xu = 3.03;      
    Yv = 3.21;        
    Zw = 8.18;        
    Kp = 0.07;       
    Mq = 0.07;        
    Nr = 0.07;       


    Xup = 5.5;        
    Yvp = 12.7;        
    Zwp = 14.57;
    Kpp = 0.12;
    Mqp = 0.12;
    Nrp = 0.12;        


    Xu_u = 18.18;        
    Yv_v = 21.66;        
    Zw_w = 36.99;
    Kp_p = 1.55;
    Mq_q = 1.55;
    Nr_r = 1.55;        
    
   %% Variables de estado

    x = X(1); y = X(2); z = X(3); phi=X(4); theta=(5); psi = X(6);  
    u = X(7); v = X(8); w = X(9); p = (10); q = (11); r = X(12);

   % 
    f1_x = U(1); f2_y = U(2); f3_z = U(3); f4_phi = U(4); f5_theta = U(5); f6_psi = U(6);
    

    eta  = [x; y; z; phi; theta; psi];               
    nu   = [u; v; w; p; q; r];
    tau  = [f1_x; f2_y; f3_z; f4_phi; f5_theta; f6_psi];


    %% Matrices modelo

    %Cinematico
    % R1 = [cos(psi)*cos(theta); sin(psi)*cos(theta); -sin(theta)];
    % R2 = [-sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi); cos(psi)*cos(phi)+sin(phi)*sin(theta)*sin(psi); cos(theta)*sin(phi)];
    % R3 = [sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(theta); -cos(psi)*sin(phi)+sin(theta)*sin(psi)*cos(phi); cos(theta)*cos(phi)];
    % 
    % R = [R1,R2,R3];
    % 
    % T = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);...
    %      0, cos(phi), -sin(phi); ...
    %      0, sin(phi)/cos(theta), cos(phi)/cos(theta)];
    % 
    % J = [R,0*eye(3); 0*eye(3),T];


     J1 = [cos(psi)*cos(theta), cos(psi)*sin(theta)*sin(phi) - sin(psi)*cos(phi), cos(psi)*sin(theta)*cos(phi) + sin(psi)*sin(phi);
          sin(psi)*cos(theta), sin(psi)*sin(theta)*sin(phi) + cos(psi)*cos(phi), sin(psi)*sin(theta)*cos(phi) - cos(psi)*sin(phi);
          -sin(theta),         cos(theta)*sin(phi),                              cos(theta)*cos(phi)];
      
    J2 = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);
          0, cos(phi),            -sin(phi);
          0, sin(phi)*sec(theta), cos(phi)*sec(theta)];
      
    J = [J1, zeros(3,3);
         zeros(3,3), J2];     
     

    %Dinamico
        %Inercia

        M_RB = diag([m, m, m, Ixx, Iyy, Izz]);
        M_A = diag([Xup, Yvp, Zwp, Kpp, Mqp, Nrp]);
        M = M_RB + M_A;

        %Coriolis
        C_RB1 = 0*eye(3);
        C_RB2 = [0,m*w,0; -m*w,0,0; m*v,-m*u,0];
        C_RB3 = [0,m*w,-m*v; -m*w,0,-m*u; m*v,-m*u,0];
        C_RB4 = [0,Izz*r,-Iyy*q; -Izz*r,0,Ixx*p; Iyy*q,-Ixx*p,0];

        C_RB = [C_RB1,C_RB2; C_RB3,C_RB4];

        C_A1 = 0*eye(3);
        C_A2 = [0,Zwp*w,0; -Zwp*w,0,-Xup*u; -Yvp*v, Xup*u,0];
        C_A3 = [0,-Zwp*w,Yvp*v; Zwp*w,0,-Xup*u;-Yvp*v,Xup*u,0];
        C_A4 = [0,-Nrp*r,Mqp*q; Nrp*r,0,-Kpp*p; -Mqp*q,Kpp*p,0];

        C_A = [C_A1,C_A2; C_A3, C_A4];
        
            C = C_RB + C_A;

        %Damping
        D = diag([Xu + Xu_u, Yv + Yv_v, Zw + Zw_w, Kp + Kp_p, Mq + Mq_q, Nr + Nr_r]);
        
        %Fuerzas de restauración
        zg = 0.02;

        g_n = [(W-B)*sin(theta);...
              -(W-B)*cos(theta)*sin(phi);...
              -(W-B)*cos(theta)*cos(phi);...
               zg*W*cos(theta)*sin(phi);...
               zg*W*sin(theta);...
               0];


 %% Ecuaciones de estado
    dxdt(1:6,1)  = J*nu;
    dxdt(7:12,1) = inv(M)*(tau - C*nu - D*nu - g_n);


end