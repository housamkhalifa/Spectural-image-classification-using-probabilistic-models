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
com = 5;

for k=1:10
loading_images;
train_out=training_set'; % save original data
test_out=testing_set';
mn = mean(train_out);
train_out = bsxfun(@minus,train_out,mn); % substract mean
test_out = bsxfun(@minus,test_out,mn);
[coefs,scores,variances] = princomp(train_out );
pervar = cumsum(variances) / sum(variances);
dims = 25;
pca_train = train_out*coefs(:,1:dims); % dims - keep this many dimensions
pca_test = test_out*coefs(:,1:dims); % result is in train_out and test_out
for y=1:length(pca_test)
    cur_test = pca_test(y,:);
    %cur_test = ((compute_zero_mean(cur_test)));
    
    pcm0 = mean(cell2mat(prin_comp(1)),1);
    pcm1 = mean(cell2mat(prin_comp(2)),1);
    pcm2 = mean(cell2mat(prin_comp(3)),1);
    pcm3 = mean(cell2mat(prin_comp(4)),1);
    pcm4 = mean(cell2mat(prin_comp(5)),1);
    pcm5 = mean(cell2mat(prin_comp(6)),1);
    pcm6 = mean(cell2mat(prin_comp(7)),1);
    pcm7 = mean(cell2mat(prin_comp(8)),1);
    pcm8 = mean(cell2mat(prin_comp(9)),1);
    pcm9 = mean(cell2mat(prin_comp(10)),1);
p(1) = multi_Gaussian_dist(cell2mat(cov_matrxi(1)),cur_test',pcm0',Theta_0);
p(2) = multi_Gaussian_dist(cell2mat(cov_matrxi(2)),cur_test',pcm1',Theta_1);
p(3) = multi_Gaussian_dist(cell2mat(cov_matrxi(3)),cur_test',pcm2',Theta_2);
p(4) = multi_Gaussian_dist(cell2mat(cov_matrxi(4)),cur_test',pcm3',Theta_3);
p(5) = multi_Gaussian_dist(cell2mat(cov_matrxi(5)),cur_test',pcm4',Theta_4);
p(6) = multi_Gaussian_dist(cell2mat(cov_matrxi(6)),cur_test',pcm5',Theta_5);
p(7) = multi_Gaussian_dist(cell2mat(cov_matrxi(7)),cur_test',pcm6',Theta_6);
p(8) = multi_Gaussian_dist(cell2mat(cov_matrxi(8)),cur_test',pcm7',Theta_7);
p(9) = multi_Gaussian_dist(cell2mat(cov_matrxi(9)),cur_test',pcm8',Theta_8);
p(10) = multi_Gaussian_dist(cell2mat(cov_matrxi(10)),cur_test',pcm9',Theta_9);
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
%fprintf('Current Accuray = %d, Lambda = %.5f\n',100*(cnt/length(test_labels)),lambda);
fprintf('Unique Values = %d\n',unique(cur_result));
A = 100*(cnt/length(test_labels));
%  figure,
%  plot(lambda,cur_res)
%  xlim([0 0.5])
% ylim([60 100]);
accuracy_comp(k,:) = A;
%nom_comp(k) = com;
%com = com+1;
end
figure,plot(accuracy_comp);
fprintf('Average Cross Validation = %d\n',mean(accuracy_comp(:)));