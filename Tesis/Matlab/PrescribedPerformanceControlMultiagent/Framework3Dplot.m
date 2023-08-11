function [F] = Framework3Dplot(q,E)

Pij = zeros(length(E),6);
F = zeros(length(E),1);
M = zeros(length(q(1,:)),1);
for i = 1: length(E)
    Pij(i,:) = [q(E(i,1)*3-2), q(E(i,2)*3-2), q(E(i,1)*3-1), q(E(i,2)*3-1), q(E(i,1)*3), q(E(i,2)*3)];
end

for i = 1:length(E)
    F(i) = line(Pij(i, 1:2), Pij(i, 3:4), Pij(i, 5:6),"Linewidth",2.3);
    view(3);
    hold on;
end


% for i = 1:length(q)/3
%     M(i) = plot3(q(i*3-2), q(i*3-1), q(i*3),"O",'LineWidth',2,'MarkerSize',15);
%     hold on;
% end
