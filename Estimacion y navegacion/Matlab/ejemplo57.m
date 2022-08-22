lambda = exp(-T*omega*zeta);
psi    = 1 - zeta^2;
xi     = sqrt(psi);
theta  = xi*omega*T;
c      = cos(theta);
s      = sin(theta);
Phi    = zeros(2);
%
% The exact solution for exp(T*F) is
%
Phi(1,1) = lambda*(c + zeta*s)/xi;
Phi(1,2) = lambda*s/(omega*xi);
Phi(2,1) = -omega*lambda*s/xi;
Phi(2,2) = lambda*(c - zeta*s)/xi;
%
% and the exact forcing term is (check this)
%
w = f(2)*[(1 - lambda*(c-zeta*s*xi/psi))/omega^2;
              lambda*s/(omega*xi)];
%
% discrete time process noise covariance
%
l1  = zeta^2;
l4  = exp(-2*omega*zeta*T);
l6  = sqrt(1-l1);
l8  = l6*omega*T;
l9  = cos(2*l8);
l11 = l4*l9*l1;
l15 = l4*sin(2*l8)*l6*zeta;
l19 = 1/(l1-1);
l20 = omega^2;
l24 = 1/zeta;
l32 = l4*(l9-1)*l19/l20;
Qd  = (qc/4)*[(l1-l11+l15-1+l4)*l19*l24,l32;
             l32,(l1-l11-l15-1+l4)*l19*l24/omega];

H = [1,0]; 
P = [2 0;
     0 2]


for k=1 : 101
    K = P*H'/(H*P*H'+R);
    xh = xh + K*(zn - H*xh);
    P = P - K*H*P;


   x     = Phi*x + w;
   xh    = Phi*xh + w;
   P     = Phi*P*Phi' + Qd;
   P     = .5*(P+P'); % preserve symmetry of P
end

subplot(2,1,1),plot(t,x1);
legend('True','Est.');
subplot(2,1,2),plot(t,x2,tm,xh2);
legend('True','Est.');
