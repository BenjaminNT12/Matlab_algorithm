function [lines,points] = Framework3Dplot(q, E)
    % M = zeros(length(q(1,:)),1);
    
    lE = length(E);
    nP = length(q(:,1))/3;

    Pij = zeros(lE,6);
    lines = zeros(lE,1);
    points = zeros(nP,1);

    for i = 1: lE
        Pij(i,:) = [q(E(i,1)*3-2), q(E(i,2)*3-2), q(E(i,1)*3-1), q(E(i,2)*3-1), q(E(i,1)*3), q(E(i,2)*3)];
        lines(i) = line(Pij(i, 1:2), Pij(i, 3:4), Pij(i, 5:6),"Linewidth",0.5,'Color','#241468','LineStyle','--');
        hold on
        if i <= nP
            points(i) = scatter3(q(i*3-2),q(i*3-1),q(i*3),'filled','SizeData',90, 'MarkerFaceColor', '#77037B', 'MarkerEdgeColor', '#77037B');
            text(q(i*3-2)+0.5,q(i*3-1)+0.5,q(i*3),num2str(i),'Color','#02315E','FontWeight','bold','FontSize',14)
        end
        hold on
    end
end

