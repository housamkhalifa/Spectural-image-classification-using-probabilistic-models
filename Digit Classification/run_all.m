clear all;
close all;
clc;
com = 5;
for k=1:1
loading_images;
[pca_train pca_test] = extract_principle_components(training_set, testing_set,25);
lambda = [0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1, 0.2,0.3,0.4,0.5];
for y=1:1
[prin_comp cov_matrxi Theta_0 Theta_1 Theta_2 Theta_3 Theta_4 Theta_5 Theta_6 Theta_7 Theta_8 Theta_9 A W] = LearnGraphStructureLasso(pca_train, train_lbls, pca_test, test_labels,0.07);
cur_res(y) = A;
end

%  figure,
%  plot(lambda,cur_res)
%  xlim([0 0.5])
% ylim([60 100]);
accuracy_comp(k,:) = cur_res;
nom_comp(k) = com;
com = com+1;
end

save cov_matrix_25 cov_matrxi;
save prin_comp_25 prin_comp;
save theta_2_25comp Theta_2;
save theta_1_25comp Theta_1;
save theta_0_25comp Theta_0;
save theta_4_25comp Theta_4;
save theta_5_25comp Theta_5;
save theta_6_25comp Theta_6;
save theta_7_25comp Theta_7;
save theta_8_25comp Theta_8;
save theta_9_25comp Theta_9;