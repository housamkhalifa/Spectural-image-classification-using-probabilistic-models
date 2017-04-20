function [prin_comp cov_matrxi Theta_0 Theta_1 A W] = LearnGraphStructureLasso(pca_train, train_lbls, pca_test, test_labels,lambda)

%% Thanks to Author: Xiaohui Chen (xiaohuic@ece.ubc.ca)
% % for providing GLASSO


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE  
%% pca_0
cnt = 1;
for y=1:length(pca_train)
    if (train_lbls(y)==0)
        pca_0(cnt,:) = pca_train(y,:);
        cnt = cnt+1;
    end
end

%% pca_1
cnt = 1;
for y=1:length(pca_train)
    if (train_lbls(y)==1)
        pca_1(cnt,:) = pca_train(y,:);
        cnt = cnt+1;
    end
end
% %% pca_2
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==2)
%         pca_2(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_3
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==2)
%         pca_3(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_4
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==4)
%         pca_4(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_5
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==5)
%         pca_5(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_6
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==6)
%         pca_6(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_7
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==7)
%         pca_7(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_8
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==8)
%         pca_8(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
% %% pca_9
% cnt = 1;
% for y=1:length(pca_train)
%     if (train_lbls(y)==9)
%         pca_9(cnt,:) = pca_train(y,:);
%         cnt = cnt+1;
%     end
% end
%% learn Glasso 0
%pca_0 = compute_zero_mean(pca_0);
pca_0_cov = (cov(pca_0));
prin_comp{1} = pca_0;
[Theta_0 W] = graphicalLasso(pca_0_cov, lambda);
cov_matrxi{1} = pca_0_cov;
Theta_0(abs(Theta_0) < 1e-4) = 0;
%% learn Glasso 1
%pca_1 = compute_zero_mean(pca_1);
pca_1_cov = (cov(pca_1));
prin_comp{2} = pca_1;
cov_matrxi{2} = pca_1_cov;
[Theta_1 W] = graphicalLasso(pca_1_cov, lambda);
Theta_1(abs(Theta_1) < 1e-4) = 0;
% %% learn Glasso 2
% %pca_2 = compute_zero_mean(pca_2);
% pca_2_cov = (cov(pca_2));
% cov_matrxi{3} = pca_2_cov;
% prin_comp{3} = pca_2;
% [Theta_2 W] = graphicalLasso(pca_2_cov, lambda);
% 
% Theta_2(abs(Theta_2) < 1e-4) = 0;
% %% learn Glasso 3
% %pca_3 = compute_zero_mean(pca_3);
% pca_3_cov = (cov(pca_3));
% prin_comp{4} = pca_3;
% cov_matrxi{4} = pca_3_cov;
% [Theta_3 W] = graphicalLasso(pca_3_cov, lambda);
% 
% Theta_3(abs(Theta_3) < 1e-4) = 0;
% %% learn Glasso 4
% %pca_4 = compute_zero_mean(pca_4);
% pca_4_cov = (cov(pca_4));
% prin_comp{5} = pca_4;
% cov_matrxi{5} = pca_4_cov;
% [Theta_4 W] = graphicalLasso(pca_4_cov, lambda);
% 
% Theta_4(abs(Theta_4) < 1e-4) = 0;
% %% learn Glasso 5
% %pca_5 = compute_zero_mean(pca_5);
% pca_5_cov = (cov(pca_5));
% prin_comp{6} = pca_5;
% cov_matrxi{6} = pca_5_cov;
% [Theta_5 W] = graphicalLasso(pca_5_cov,lambda);
% 
% Theta_5(abs(Theta_5) < 1e-4) = 0;
% %% learn Glasso 6
% %pca_6 = compute_zero_mean(pca_6);
% pca_6_cov = (cov(pca_6));
% prin_comp{7} = pca_6;
% [Theta_6 W] = graphicalLasso(pca_6_cov, lambda);
% cov_matrxi{7} = pca_6_cov;
% Theta_6(abs(Theta_6) < 1e-4) = 0;
% %% learn Glasso 7
% %pca_7 = compute_zero_mean(pca_7);
% pca_7_cov = (cov(pca_7));
% prin_comp{8} = pca_7;
% cov_matrxi{8} = pca_7_cov;
% [Theta_7 W] = graphicalLasso(pca_7_cov, lambda);
% 
% Theta_7(abs(Theta_7) < 1e-4) = 0;
% %% learn Glasso 8
% %pca_8 = compute_zero_mean(pca_8);
% pca_8_cov = (cov(pca_8));
% prin_comp{9} = pca_8;
% cov_matrxi{9} = pca_8_cov;
% [Theta_8 W] = graphicalLasso(pca_8_cov, lambda);
% 
% Theta_8(abs(Theta_8) < 1e-4) = 0;
% %% learn Glasso 8
% %pca_9 = compute_zero_mean(pca_9);
% pca_9_cov = (cov(pca_9));
% prin_comp{10} = pca_9;
% cov_matrxi{10} = pca_9_cov;
% [Theta_9 W] = graphicalLasso(pca_9_cov, lambda);
% 
% Theta_9(abs(Theta_9) < 1e-4) = 0;
%% classification
for y=1:length(pca_test(:,1))
    cur_test = pca_test(y,:);
    %cur_test = ((compute_zero_mean(cur_test)));
    
    pcm0 = mean(pca_0,1);
    pcm1 = mean(pca_1,1);

p(1) = multi_Gaussian_dist(pca_0_cov,cur_test',pcm0',Theta_0);
p(2) = multi_Gaussian_dist(pca_1_cov,cur_test',pcm1',Theta_1);

p = p/sum(p);
[v idx] = max(p);
cur_result(y) = idx-1;
               
end
cnt = 0;
for y=1:length(test_labels)
    if (cur_result(y)==test_labels(y))
        cnt = cnt+1;
    end
end
%cnt/length(test_labels)
%unique(cur_result)
fprintf('Current Accuray = %d, Lambda = %.5f\n',100*(cnt/length(test_labels)),lambda);
fprintf('Unique Values = %d\n',unique(cur_result));
A = 100*(cnt/length(test_labels));
w=1;
