function F = framework3D(q,E)

Pij = zeros(length(E),4);

for i = 1: length(E)
    Pij(i,:) = [q(E(i,1)*3-2), q(E(i,2)*3-2), q(E(i,1)*3-1), q(E(i,2)*3-1)];
end

for i = 1:length(E)
    line(Pij(i,1:2), Pij(i,3:4),"Linewidth",1.3);
    hold on;
end

for i = 1:length(q)/3
    plot(q(i*3-2), q(i*3-1),"O");
    hold on;
end