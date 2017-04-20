input_dir = 'cropped_dataset/black0/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
images = [];
cnt = 1;
labels = [];
cnt_lbl = 1;
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    if n == 1
        images = zeros(prod(image_dims), 600);
    end
    %figure,imshow(img);
    images(:, cnt) = img(:);
    a = images(:,1);
%     w = reshape(a,[18,18]);
%     figure,imshow(w);
    labels(cnt_lbl,1) = 0;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue0/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 0;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

%% load image 1
input_dir = 'cropped_dataset/black1/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 1;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue1/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);

    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 1;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 2
input_dir = 'cropped_dataset/black2/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);

    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 2;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue2/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);

    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 2;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 3
input_dir = 'cropped_dataset/black3/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 3;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue3/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 3;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 4
input_dir = 'cropped_dataset/black4/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 4;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue4/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);

    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 4;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 5
input_dir = 'cropped_dataset/black5/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 5;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue5/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 5;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 6
input_dir = 'cropped_dataset/black6/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 6;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue6/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 6;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 7
input_dir = 'cropped_dataset/black7/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 7;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue7/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 7;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 8
input_dir = 'cropped_dataset/black8/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 8;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue8/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 8;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% load image 9
input_dir = 'cropped_dataset/black9/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 9;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end

input_dir = 'cropped_dataset/blue9/';
image_dims = [18, 18];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);
for n = 1:30
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    images(:, cnt) = img(:);
    labels(cnt_lbl,1) = 9;
    cnt_lbl = cnt_lbl+1;
    cnt = cnt+1;
end
%% divide dataset 80,20 
indxs = randperm(600);
training_set = [];
images = compute_zero_mean(images);
for y=1:(480)
    cur_img = images(:,indxs(y));
    cur_img = reshape(cur_img,[18,18]);
    % cur_img = imresize(cur_img,[27 27]);
    %cur_img = getHighPassFilter(cur_img,2);
    training_set(:,y) = cur_img(:);
    train_lbls(y,1) = labels(indxs(y));
end
testing_set = [];
cnt = 1;
for yy=481:600
 
    cur_img = images(:,indxs(yy));
    cur_img = reshape(cur_img,[18,18]);
    %cur_img = imresize(cur_img,[27 27]);
   %figure,imshow(cur_img,[]);
    %cur_img = getHighPassFilter(cur_img,1);
    %figure,imshow(cur_img,[]);
    testing_set(:,cnt) = cur_img(:);
    test_labels(cnt,1) = labels(indxs(yy));
    cnt = cnt+1;
end

%save dataset images
save training_set training_set;
save testing_set testing_set;
disp('Done loading')