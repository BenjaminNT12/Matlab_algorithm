clc
%clear all
close all

T = 0.02;
t = [0:T:15];
z_ref(1:5/T+1) = 1;
z_ref(5/T:10/T+1) = 1.5;
z_ref(10/T:15/T+1) = 1;


v0 = 2;

a1 = 2;
a2 = 4;
a3 = 0.1;

o1 = 1.2;
o2 = 2;
o3 = 40;

psi1 = 1.4;
psi2 = 25;
psi3 = 0.38;


plot(t,z_ref)
z = [0 0 0.15 0.2 0];
z_est = [0 0 0];
kp = 8;
kd = 4;
g = 9.81;
u = 0;

c1 = 2;
k1 = 8; 
k2 = 4;
lam1 = 6;
lam2 = 11;
lam3 = 6;

% c1 = 6;
% k1 = 10; 
% k2 = 6;
% lam1 = 8;
% lam2 = 14;
% lam3 = 8;



int_sigS = 0;
int_sig_x1error = 0;
s = 0;

phi = 0.05*randn;
theta = 0.05*randn;

for i=1:length(t)-1
%    SISTEMA

    [tt,zz] = ode45(@modelo_observador_Z1,[t(i) t(i+1)],z(i,:),[],u(i),phi(i),theta(i));
    z(i+1,:) = zz(end,:);
    
    z(i+1,1) = z(i+1,1) + 0.000015*z(i+1,1)*randn;
    z(i+1,2) = z(i+1,2) + 0.000015*z(i+1,2)*randn;
    
    phi(i+1) = 0.05*randn;
    while (abs(phi(i+1))> 0.1)
        phi(i+1) = 0.03*randn;
    end
    theta(i+1) = 0.05*randn;
    while (abs(theta(i+1))> 0.1)
        theta(i+1) = 0.03*randn;
    end
    
    
    if (z(i+1,1) < 0)
        z(i+1,1) = 0;
        z(i+1,2) = 0;
    end                
      
 %   LEY DE CONTROL SUPER-TWISTING (CON OBSERVADOR)
    s(i+1) = z(i+1,4) + c1*(z(i+1,1) -  z_ref(i+1));
    x1_error = z(i+1,1) - z(i+1,3);
    if (i==1)
        int_sigS = 0;
        int_sig_x1error = 0;
    else
        int_sigS = int_sigS + (T/2)*(s(i+1) + s(i));
        int_sig_x1error = int_sig_x1error + (T/2)*(x1_error + x1_error_ant);
    end
    if(z_ref(i+1) <= 0)
        u(i+1) = 0;
    else
        u(i+1) = -c1*z(i+1,2) + g - k1*abs(s(i+1))^(1/2)*sign(s(i+1)) - k2*int_sigS - lam2*abs(x1_error)^(1/3)*sign(x1_error) - lam3*int_sig_x1error;   
    end   
    
    if (mod(i,50) == 0)
        fprintf('Tiempo: %d seg \n',i/50)
    end
    
    x1_error_ant = x1_error;
    v(i) = (v0 + a1*sin(o1*t(i) + psi1) + a2*sin(o2*t(i) + psi2) + a3*sin(o3*t(i) + psi3))*0.05;
    
end
i = i+1;
v(i) = (v0 + a1*sin(o1*t(i) + psi1) + a2*sin(o2*t(i) + psi2) + a3*sin(o3*t(i) + psi3))*0.05;
% 
% z      = x(1) = z1
% zp     = x(2) = z2
% z_est  = x(3) = z1_est
% zp_est = x(4) = z2_est
% pert   = x(5)


%% POSICI�N
% figure(1)
% plot(t,z(:,1),t,z(:,3),'r--','LineWidth',1.5)
% title('Position Z','FontSize', 14)
% xlabel('Time [s] ','FontSize', 12)
% ylabel('Amplitude[m]','FontSize', 12)
% legend('Real','Estimated','FontSize', 14)
% axis([0 15 0 1.6])
% grid
% figure(2)
% plot(t(1:36),z(1:36,1),t(1:36),z(1:36,3),'r--','LineWidth',1.5)
% xlabel('Time [s])')
% axis([0 0.7 0 0.6])
% grid
% 
% FFM = [	0 	      0 	1     1;
%     	0.38   0.18   0.4   0.4];
% fhv = [1:2];
% newFig = 101;
% hNew = lafig3(newFig, fhv, FFM);

figure(1)
plot(t,z(:,1),t,z(:,3),'r--','LineWidth',1.5)
%title('Position Z','FontSize', 14)
set(gca,'FontSize',12)
xlabel('Time [s] ')
ylabel('Amplitude[m]')
set(gca,'FontSize',14)
legend('Real','Estimated')
axis([0 15 0 1.6])
grid

figure(2)
plot(t(1:36),z(1:36,1),t(1:36),z(1:36,3),'r--','LineWidth',1.5)
%xlabel('Time [s])')
axis([0 0.7 0 0.6])
grid

figure(3)
plot(t(1:36),z(1:36,1),t(1:36),z(1:36,3),'r--','LineWidth',1.5)
%xlabel('Time [s])')
axis([0 0.7 0 0.6])
grid

% FFM = [	0 	      0 	1     1;
%     	0.38   0.18   0.4   0.4];
% fhv = [1:2];
% newFig = 101;
% hNew = lafig3(newFig, fhv, FFM);

FFM = [	0 	      0 	1     1;
    	0.38   0.18   0.4   0.4;
        0.2     0.2   0.1    0.1];
fhv = [1:3];
newFig = 101;
hNew = lafig3(newFig, fhv, FFM);


%% VELOCIDAD
figure(3)
plot(t,z(:,2),t,z(:,4),'r--','LineWidth',1.5)
title('Velocity Z','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Amplitude[m/s]','FontSize', 12)
legend('Real','Estimated')
axis([0 15 -0.8 1.8])
grid
figure(4)
plot(t(1:36),z(1:36,2),t(1:36),z(1:36,4),'r--','LineWidth',1.5)
xlabel('Time [s]')
axis([0 0.7 -0.4 1.4])
grid

FFM = [	0 	      0 	1     1;
    	0.345   0.6   0.335   0.32];
fhv = [3:4];
newFig = 102;
hNew = lafig3(newFig, fhv, FFM);


%% PERTURBACI�N
figure(5)
plot(t,v,t,z(:,5),'r--','LineWidth',1.5)
title('Disturbance','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Amplitude','FontSize', 12)
legend('Real','Estimated')
axis([0 15 -1 1])
grid
figure(6)
plot(t(1:36),v(1:36),t(1:36),z(1:36,5),'r--','LineWidth',1.5)
xlabel('Time [s]','FontSize', 12)
axis([0 0.7 -1 1])
grid

FFM = [	0 	      0 	1     1;
    	0.345   0.17   0.335   0.32];
% FFM = [	0 	      0 	1     1;
%     	0.345   0.59   0.335   0.32];
fhv = [5:6];
newFig = 103;
hNew = lafig3(newFig, fhv, FFM);

%% SE�AL DE CONTROL
figure(7)
plot(t,u*1e-3,'LineWidth',1.5)
title('Control Signal','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Control signal [Nm]','FontSize', 12)
grid

%% ERROR ESTIMATION
figure(8)
subplot(2,1,1)
plot(t,z(:,1)-z(:,3),'b','LineWidth',1.5)
title('Estimation error of x_1','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Amplitude[m]','FontSize', 12)
grid
subplot(2,1,2)
plot(t,z(:,2)-z(:,4),'r','LineWidth',1.5)
title('Estimation error of x_2','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Amplitude[m/s]','FontSize', 12)
grid


figure(9)
[hAx,hLine1,hLine2] = plotyy(t,z(:,1)-z(:,3),t,z(:,2)-z(:,4));
title('Estimation error','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
set(hLine1,'Color','b')
set(hLine1,'LineWidth',1.5)
set(hLine1,'LineStyle','-')
set(hLine2,'Color','r')
set(hLine2,'LineWidth',1.5)
set(hLine2,'LineStyle','-')
ylabel(hAx(1),'Amplitude[m]','FontSize', 12) % left y-axis
ylabel(hAx(2),'Amplitude[m/s]','FontSize', 12) % right y-axis
set(hAx,{'ycolor'},{'b';'r'})
h = legend('$\tilde{x}_1$','$\tilde{x}_2$');
set(h,'Interpreter','latex')
grid

figure(10)
plot(t,s,'LineWidth',1.5)
title('Sliding manifold','FontSize', 14)
xlabel('Time [s]','FontSize', 12)
ylabel('Amplitude','FontSize', 12)
grid


figure(11)
subplot(211)
plot(t,phi,'b--','LineWidth',1.5)
%title('Position Z','FontSize', 14)
xlabel('Time [s] ','FontSize', 12)
ylabel('Roll Angle [rad]','FontSize', 12)
axis([0 15 -0.2 0.2])
grid
subplot(212)
plot(t,theta,'b--','LineWidth',1.5)
%title('Position Z','FontSize', 14)
xlabel('Time [s] ','FontSize', 12)
ylabel('Pitch Angle [rad]','FontSize', 12)
axis([0 15 -0.2 0.2])
grid
%legend('Real','Estimated','FontSize', 14)


% figure(10)
% [hAx,hLine1,hLine2] = plotyy(t(1:36),z(1:36,1)-z(1:36,3),t(1:36),z(1:36,2)-z(1:36,4));
% %title('Estimation error')
% xlabel('Time (seconds)')
% set(hLine1,'Color','b')
% set(hLine1,'LineWidth',1.5)
% set(hLine1,'LineStyle','-')
% set(hLine2,'Color','r')
% set(hLine2,'LineWidth',1.5)
% set(hLine2,'LineStyle','--')
% %ylabel(hAx(1),'Amplitude[m]') % left y-axis
% %ylabel(hAx(2),'Amplitude[m/s]') % right y-axis
% set(hAx,{'ycolor'},{'b';'r'})
% grid

% x = 0:0.01:20;
% y1 = 200*exp(-0.05*x).*sin(x);
% y2 = 0.8*exp(-0.5*x).*sin(10*x);
% [AX,H1,H2] = plotyy(x,y1,x,y2,'plot');
% set(get(AX(1),'Ylabel'),'String','Slow Decay')
% set(get(AX(2),'Ylabel'),'String','Fast Decay')
% xlabel('Time (\musec)')
% title('Multiple Decay Rates')
% set(H1,'LineStyle','--')
% set(H2,'LineStyle',':')


% x1_error = z(:,1) - z(:,3);
% 
% figure
% subplot(2,2,1);
% plot(t,z(:,1))
% title('Posici�n Real')
% subplot(2,2,2);
% plot(t,z(:,3))
% title('Posici�n Estimada')
% subplot(2,2,[3,4]);
% plot(t,z(:,1),t,z(:,3))
% legend('Real','Estimada')
% title('Posicion Z')





% hf=figure(1);
% ax2=axes('parent',hf,'position',[0.3 0.25 0.12 0.15]); % se usan medidas normalizadas para la posicion y tama�o% recuadro [left bottom width height]
% ax2 = gca; % obtiene los ejes
% set(ax2,'XColor','k','YColor','k','XTick',[0],'YTick',[0],'XTickLabel',[0],'YTickLabel',[0])%,'FontName','Times New Roman','FontSize',24);
% 
