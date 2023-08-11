function F = framework(q,E)

Pij = zeros(length(E),4);

for i = 1: length(E)
    Pij(i,:) = [q((E(i,1)*2)-1), q((E(i,2)*2)-1), q((E(i,1)*2)), q((E(i,2)*2))];
end

for i = 1:length(E)
    line(Pij(i,1:2), Pij(i,3:4),"Linewidth",1.7);
    hold on;
end

for i = 1:length(q)/2
    plot(q(i*2-1), q(i*2),"O");
    hold on;
end


 




