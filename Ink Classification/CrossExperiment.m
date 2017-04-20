clear all;
clc;
close all;
% configEnviroment()
cross_res = 0;
for epoch=1:5
numOfTraining = 210;
numOfTesting = 175;
trainingSet = cell(1,numOfTraining);
testingSet = cell(1,numOfTesting);
groups=[];
class = 1;
count = 1;
strFolder = 'Brodatz32/c01/t (';
dividingSet = 1;
countTest = 1;
countTrain = 1;
result = [];
kappa             =   [0.01]; 
featRSize = 60;
featCSize = 60;
warning off;
for e=1:210;
    disp('Reading from Faces:');
    disp(e);
    strFolder=     strcat('CroppedFaces/',int2str(e));
    str = strcat(strFolder,'.png');
    eval('img = imread(str);');
    image = (img);
    orgIm = image;
    image = imresize(orgIm, [30, 30]);

image = image(:,:,1);
        disp('Saving Training Feature!');
     
         trainingSet {1,countTrain} =  image(:);

         countTrain = countTrain+1;
        result = [];
 
    
end


%% Prepare Lables for SVM
disp('Creating Labels for SVM')
% lblName = 1;
% 
% data = ['An';'Di';'Fe'; 'Ha';'Ne';'Sa';'Su'];
% lbls = cellstr(data);
% for i=1:210
%     if (mod(i,30)==0)
%         categories1(i) =lblName;
%         labels1(i) = lbls(lblName);
%         lblName = lblName+1;
%     else
%         labels1(i) = lbls(lblName);
%         categories1(i)=lblName;
%     end
% end
% labels1 = labels1;

disp('Adjusting Matrices for SVM');
trainingSet = cell2mat(trainingSet);
clear trainForSVM;
for i=1:numOfTraining
    
    b = trainingSet(:,i);
    w = b;
   % w = w(:);
    trainForSVM(i,:) = w;
end
indxs = randperm(210);
training_set = [];
trainForSVM = trainForSVM';
trainForSVM = double(trainForSVM);
images = compute_zero_mean(trainForSVM);
lblName = 0;
for i=1:210
    if (mod(i,30)==0)
        categories11(i) =lblName;
        lblName = lblName+1;
    else
        categories11(i)=lblName;
    end
end
kLap = [-1, -1, -1;
        -1,  8, -1;
        -1, -1, -1];


for y=1:(210)
    cur_img = images(:,indxs(y));
    cur_img = reshape(cur_img,[30, 30]);
    % cur_img = imresize(cur_img,[27 27]);
   
    %cur_img = getHighPassFilter(cur_img,15);
     %cur_img = NSLGS(cur_img, 4);
    cur_img = imfilter(cur_img,kLap,'replicate');
   % cur_img = imhist(cur_img);
  %  figure,imshow(cur_img);
 % cur_img = cur_img1+cur_img;
    training_set(:,y) = cur_img(:);
    train_lbls(y,1) = categories11(indxs(y));
end
testing_set = [];
cnt = 1;
for yy=169:210
 
    cur_img = images(:,indxs(yy));
    cur_img = reshape(cur_img,[30, 30]);
    %cur_img = imresize(cur_img,[27 27]);
   %figure,imshow(cur_img,[]);
    %cur_img = getHighPassFilter(cur_img,1);
    %figure,imshow(cur_img,[]);
   
     %cur_img = NSLGS(cur_img, 4);
     cur_img = imfilter(cur_img,kLap,'replicate');
    %cur_img = imhist(cur_img);
      %cur_img = cur_img1+cur_img;
    testing_set(:,cnt) = cur_img(:);
    test_labels(cnt,1) = categories11(indxs(yy));
    cnt = cnt+1;
end
[pca_train pca_test] = extract_principle_components(training_set, testing_set,15);
[cur_result prin_comp cov_matrxi Theta_0 Theta_1 Theta_2 Theta_3 Theta_4 Theta_5 Theta_6 A W] = LearnGraphStructureLasso(pca_train, train_lbls, pca_test, test_labels,0.01);
% save training_set training_set;
% save testing_set testing_set;
cross_res = cross_res+A;
disp('Done loading')
end
fprintf('Hold out cross validation Result = %d\n',cross_res/5);
% Tr_DAT = double(trainForSVM);
% M=mean(Tr_DAT,2);
% 
% % [Eigenfaces] = PCA_Core(Tr_DAT,M,90); 
% crossExperimentValidation;