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


     zg = 0.02;
     
    
   % Variables de estado
    x = X(1); y = X(2); z = X(3); phi = X(4);  theta = X(5);  psi = X(6);
    u = X(7); v = X(8); w = X(9);   p = X(10);     q = X(11);   r = X(12);
    
    % Entradas de control
    F_x = U(1); F_y = U(2); F_z = U(3); tau_phi = U(4); tau_theta = U(5); tau_psi = U(6);
    
    eta  = [x; y; z; phi; theta; psi];               
    nu   = [u; v; w; p; q; r];
    tau  = [F_x; F_y; F_z; tau_phi; tau_theta; tau_psi];
    

    %% Matrices modelo

   % Modelo cinematico
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

        % Matriz de inercia (cuerpo rigido)
        M_RB = [m, 0, 0, 0, m*zg, 0;
                0, m, 0, -m*zg,0, 0;
                0 ,0 ,m ,0 ,0 ,0;
                0, -m*zg,0, Ixx, 0, 0;
                m*zg,0, 0, 0,Iyy,0;
                0, 0, 0, 0, 0, Izz];

    % Matriz de inercia (masa anadida)
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
        
           C = C_RB+C_A;
    
    % Amortiguamiento
    D = diag([Xu+Xu_u, Yv+Yv_v, Zw+Zw_w, Kp+Kp_p, Mq+Mq_q, Nr+Nr_r]);
    
    % fuerzas de restauracion
    
    
    g_n = [  (W-B)*sin(theta);
           -(W-B)*cos(theta)*sin(phi);
           -(W-B)*cos(theta)*cos(phi);
         zg*W*cos(theta)*sin(phi);
         zg*W*sin(theta);
                    0];
               

 %% Ecuaciones de estado
    dxdt(1:6,1)  = J*nu;
    dxdt(7:12,1) = inv(M)*(tau - C*nu - D*nu - g_n);


end