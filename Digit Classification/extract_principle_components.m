function [pca_train pca_test] = extract_principle_components(training_set, testing_set,p_components)
train_size = length(training_set(1,:));
test_size = length(testing_set(1,:));
%% mean image and mean-shifted image
mean_digits = mean(training_set,2);
shifted_images = training_set-repmat(mean_digits, 1,train_size);
%% ordered eigenvectors and eigenvalues
[eigen_vectors, score, eigen_values] = princomp(training_set');
%% return the top eigenvectors i.e. principle components
eigen_vectors = eigen_vectors(:,1:p_components);
 save train_eigen_vect_25 eigen_vectors;
 save train_shifted_img_25 shifted_images;
 save train_mean_25 mean_digits;
%% project images into subspace to generate feature vectors
train_features = eigen_vectors'*shifted_images;
pca_train = train_features;
%% test features
pca_test = [];
for y=1:test_size
   cur_img = testing_set(:,y);
   test_feature = eigen_vectors' *(cur_img-mean_digits);
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
