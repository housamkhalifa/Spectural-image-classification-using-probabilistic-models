

for x=1:length(Theta_0)
    for y=1:length(Theta_1)
        if (Theta_0(x,y)~=0)
            graph_theta_0(x,y) = 1; 
        else
            graph_theta_0(x,y) = 0;
        end
    end
end
G = graph(graph_theta_0,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Black');



for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_1(x,y)~=0)
            graph_theta_1(x,y) = 1; 
        else
            graph_theta_1(x,y) = 0;
        end
    end
end
G = graph(graph_theta_1,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Blue');