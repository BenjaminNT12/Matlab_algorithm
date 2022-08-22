function dxdt = modeloCUADRIROTOR(t,x,tau,f)

    Ixx = 0.1;
    Iyy = 0.1;
    Izz = 0.1;
    m = 1;
    g = 9.81;
    
    %phi = x(4);theta = x(5);psi = x(6);phip = x(10);thetap = x(11); psip = x(12);
    etap = [x(10) x(11) x(12)]';

    J = [Ixx,0,-Ixx*sin(x(5));0,Iyy*cos(x(4))^2+Izz*sin(x(4))^2,cos(x(4))*cos(x(5))*sin(x(4))*(Iyy-Izz);-Ixx*sin(x(5)),cos(x(4))*cos(x(5))*sin(x(4))*(Iyy-Izz),Ixx*sin(x(5))^2+Iyy*cos(x(5))^2*sin(x(4))^2+Izz*cos(x(4))^2*cos(x(5))^2];
    c11 = 0;
    c12 = (Iyy-Izz)*(x(11)*cos(x(4))*sin(x(4))+x(12)*sin(x(4))^2*cos(x(5)))+(Izz-Iyy)*x(12)*cos(x(4))^2*cos(x(5))-Ixx*x(12)*cos(x(5));
    c13 = (Izz-Iyy)*x(12)*cos(x(4))*sin(x(4))*cos(x(5))^2;
    c21 = (Iyy-Izz)*(x(11)*cos(x(4))*sin(x(4))+x(12)*sin(x(4))^2*cos(x(5)))+(Izz-Iyy)*x(12)*cos(x(4))^2*cos(x(5))-Ixx*x(12)*cos(x(5));
    c22 = (Izz-Iyy)*x(10)*cos(x(4))*sin(x(4));
    c23 = -Ixx*x(12)*cos(x(5))*sin(x(5))+Iyy*x(12)*sin(x(4))^2*cos(x(5))*sin(x(5))+Izz*x(12)*cos(x(4))^2*cos(x(5))*sin(x(5));
    c31 = (Iyy-Izz)*x(12)*cos(x(5))^2*cos(x(4))*sin(x(4))-Ixx*x(11)*cos(x(5));
    c32 = (Izz-Iyy)*(x(11)*cos(x(4))*sin(x(4))*sin(x(5))+x(10)*sin(x(4))^2*cos(x(5)))+(Iyy-Izz)*x(11)*cos(x(4))^2*cos(x(5))*-c23;
    c33 = (Iyy-Izz)*x(10)*cos(x(4))*sin(x(4))*cos(x(5))^2-Iyy*x(11)*sin(x(4))^2*cos(x(5))*sin(x(5))-Izz*x(11)*cos(x(4))^2*cos(x(5))*sin(x(5))-Ixx*x(11)*cos(x(5))*sin(x(5));
    C = [c11,c12,c13;c21,c22,c23;c31,c32,c33];
    
    dxdt(1,1) = x(7);
    dxdt(2,1) = x(8);
    dxdt(3,1) = x(9);
    dxdt(4,1) = x(10);
    dxdt(5,1) = x(11);
    dxdt(6,1) = x(12);
    
    dxdt(7,1) = (f/m)*(cos(x(4))*sin(x(5))*cos(x(6))+cos(x(6))+sin(x(4))*sin(x(6)));
    dxdt(8,1) = (f/m)*(cos(x(4))*sin(x(5))*sin(x(6))-sin(x(6))-sin(x(4))*cos(x(6)));
    dxdt(9,1) = (f/m)*cos(x(4))*cos(x(5))-g;
    inv(J);
    tau;
    dxdt(10:12,1) = inv(J)*(tau-C*etap);
end