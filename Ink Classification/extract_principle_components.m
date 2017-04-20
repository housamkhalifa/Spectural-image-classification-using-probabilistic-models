function [pca_train pca_test] = extract_principle_components(training_set, testing_set,num_com)
kk = training_set-repmat(mean(training_set,2), 1,length(training_set(1,:)));
[eigen_vectors, score, eigen_values] = princomp(training_set');
eigen_vectors = eigen_vectors(:,1:num_com);

 save train_eigen_vect_25 eigen_vectors;
 save train_shifted_img_25 shifted_images;
 save train_mean_25 mean_digits;
 
train_features = eigen_vectors'*kk;
pca_train = train_features;
pca_test = [];
for y=1:length(testing_set(1,:))
   cur_img = testing_set(:,y);
   test_feature = eigen_vectors' *(cur_img-mean(training_set,2));
   pca_test(:,y) = test_feature;
end
pca_train = pca_train';
pca_test = pca_test';
normplot(pca_train(:))
[U,S,V] = svd(training_set);
diag_res  = diag(S);
var_res = sum(diag_res(1:p_components))/sum(diag_res);
fprintf('Variance : %d', var_res);
end
