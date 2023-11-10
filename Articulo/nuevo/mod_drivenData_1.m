function dxdt= mod_drivenData_1(t,x,u)
% Programa del Modelo

% k=10;
% 
% %control P
% x1_d=sin(t);
% x1_til=-x1_d+x(1);
% k_til=120;
% 
% %u1
% z=x(2)+x(1)^3;
% u1=-1*(1/(cos(2*x(1))+2))*(x(1)-0.5*x(1)-0.5*x(2)*(1-(cos(2*x(1))+2)^2)+3*x(1)^2*(-x(1)-x(1)^3+z)+k*z+k_til*x1_til);

%Ecuaciones en espacio de estado
dxdt(1,1)=-x(1)+x(2);%x
dxdt(2,1)=-0.5*x(1)-0.5*x(2)*(1-(cos(2*x(1))+2)^2)+(cos(2*x(1))+2)*u;%