clear all;
close all;
load trainingSet;
load trainingLabel;
% load testSet;
% load testLabel;
sum_res = 0;

for k=1:10
indxs = randperm(190);
for y=1:152
    trainS(:,y) = trainingSet(indxs(y),:);
    trainL(y) = trainingLabel(indxs(y));
end
cnt =1;
for y=153:190
    testS(:,cnt) = trainingSet(indxs(y),:);
    testL(cnt) = trainingLabel(indxs(y));
    cnt = cnt+1;
end
% trainS = trainS';
% testS = testS';
% trainS = compute_zero_mean(trainS);
% testS = compute_zero_mean(testS);
[pca_train pca_test] = extract_principle_components(trainS, testS,45);
[prin_comp cov_matrxi Theta_0 Theta_1 A W] = LearnGraphStructureLasso(pca_train, trainL, pca_test, testL,0.01);
sum_res = sum_res+A;
end
acc = sum_res/10;
fprintf('\n Cross Validation Result : %d', acc);