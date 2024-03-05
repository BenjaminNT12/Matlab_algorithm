function plotAnimation(P, v0, t, p, E, f)
    view([-45,-90,45]);
    f.Position = [500 500 1000 1250];
    grid on

    h1 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h2 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h3 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h4 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h5 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h6 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h7 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h8 = animatedline('LineStyle',"-.",'Color','#0072BD','LineWidth',0.8);
    h9 = animatedline('LineStyle',"-.",'Color','#FF0000','LineWidth',1.5);
    trajectory = animatedline('LineStyle',"-",'Color','#d95319','LineWidth',1.5);

    h = [h1, h2, h3, h4, h5, h6, h7, h8, h9];

    for i = 1:length(P(:,1,1))
        for j = 1:length(h)
            addpoints(h(j), P(i,j,1), P(i,j,2), P(i,j,3));
        end
        addpoints(trajectory,12.08-(1/0.35)*v0(2,i)', 9.4 + (1/0.35)*v0(1,i)', 3.5*1.0+t(i));

        [grf, points, num] = Framework3Dplot(p(:,i), E);
        drawnow limitrate;
        frames(i) = getframe();
        if i < length(P(:,1,1))
            delete(grf);
            delete(points);
            delete(num);
        end
    end

    title('Adquisición de la formación','FontSize',20)
    xlabel('Eje-X','FontSize',14)
    ylabel('Eje-Y','FontSize',14)
    zlabel('Eje-Z','FontSize',14)
end






