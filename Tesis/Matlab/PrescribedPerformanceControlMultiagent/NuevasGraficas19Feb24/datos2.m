load('errorV.mat')
load('vd.mat')
load('errorV2.mat')
load('vd2.mat')

t = 0:0.01:30-0.01;

for i=1: 3000
    vPPC(i) = norm(errorV(:,i));
    v(i) = norm(errorV2(:,i));
end

plot(t,vPPC, t,v)
legend('PPC', 'Vd')

semilogy(t,vPPC, t,v)
legend('PPC, semilogy', 'Vd, semilogy')