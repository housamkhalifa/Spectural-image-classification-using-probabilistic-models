clear all;
close all;
clc;
load theta_0_25comp.mat;
load theta_1_25comp.mat;
load theta_2_25comp.mat;
load theta_3_25comp.mat;
load theta_4_25comp.mat;
load theta_5_25comp.mat;
load theta_6_25comp.mat;
load theta_7_25comp.mat;
load theta_8_25comp.mat;
load theta_9_25comp.mat;
load cov_matrix_25.mat;
load prin_comp_25.mat;
load train_shifted_img_25.mat;
load train_eigen_vect_25.mat;
load train_mean_25.mat;
%% Theta 0
for x=1:length(Theta_0)
    for y=1:length(Theta_0)
        if (Theta_0(x,y)~=0)
            graph_theta_0(x,y) = 1; 
        else
            graph_theta_0(x,y) = 0;
        end
    end
end
G = graph(graph_theta_0,'OmitSelfLoops');
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_1');
%% %%Theta 1
for x=1:length(Theta_0)
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
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_1');
%% Theta 2
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_2(x,y)~=0)
            graph_theta_2(x,y) = 1; 
        else
            graph_theta_2(x,y) = 0;
        end
    end
end
G = graph(graph_theta_2,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_2');
%% Theta 2
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_3(x,y)~=0)
            graph_theta_3(x,y) = 1; 
        else
            graph_theta_3(x,y) = 0;
        end
    end
end
G = graph(graph_theta_3,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_3');
%% Theta 4
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_4(x,y)~=0)
            graph_theta_4(x,y) = 1; 
        else
            graph_theta_4(x,y) = 0;
        end
    end
end
G = graph(graph_theta_4,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_4');
%% Theta 5
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_5(x,y)~=0)
            graph_theta_5(x,y) = 1; 
        else
            graph_theta_5(x,y) = 0;
        end
    end
end
G = graph(graph_theta_5,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_5');
%% Theta 6
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_6(x,y)~=0)
            graph_theta_6(x,y) = 1; 
        else
            graph_theta_6(x,y) = 0;
        end
    end
end
G = graph(graph_theta_6,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_6');
%% Theta 7
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_7(x,y)~=0)
            graph_theta_7(x,y) = 1; 
        else
            graph_theta_7(x,y) = 0;
        end
    end
end
G = graph(graph_theta_7,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_7');
%% Theta 8
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_8(x,y)~=0)
            graph_theta_8(x,y) = 1; 
        else
            graph_theta_8(x,y) = 0;
        end
    end
end
G = graph(graph_theta_8,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_8');
%% Theta 9
for x=1:length(Theta_1)
    for y=1:length(Theta_1)
        if (Theta_9(x,y)~=0)
            graph_theta_9(x,y) = 1; 
        else
            graph_theta_9(x,y) = 0;
        end
    end
end
G = graph(graph_theta_9,'OmitSelfLoops');
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure,plot(G,'NodeColor','r','MarkerSize',6,'EdgeColor','b','LineWidth',0.3),title('Theta_9');
%%