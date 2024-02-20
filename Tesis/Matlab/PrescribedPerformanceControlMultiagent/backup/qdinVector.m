function [qdin] = qdinVector(Edges, qt, leader,l, m)
    agent = 1;
    for k = 1:l
        for j = 1:2
            if Edges(k,j) == leader % leader
                % E(k,:)
                qdin(agent*m-2:agent*m,1) = qt(k*m-2:k*m,1);
                agent = agent + 1;
            end
        end
    end
    qdin(agent*m-2:agent*m,1) = zeros(3,1);
end