clear
clc
close all

load('errorV.mat')
load('vd.mat')
load('errorV2.mat')
load('vd2.mat')

t = 0:0.01:30-0.01;

for i=1: 3000
    vPPC(i) = norm(errorV(:,i));
    v(i) = norm(errorV2(:,i));
end

plot(t,vPPC, t,v,'Linewidth',2)
legend('PPC', 'Vd')

semilogy(t,vPPC, t,v,'Linewidth',2)


legend('Control proposed with PPF', 'Control without PPF')

set(gca,'FontSize',14)
xlabel('Time [sec]');
ylabel({'\fontsize{14}{21}$||\sigma_{ij}||$'},'Interpreter','latex');
grid on