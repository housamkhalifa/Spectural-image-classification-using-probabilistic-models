 clear all;
% clc;

close all;
addpath('Project/dataset/');
folder_name=['dataset/','blue2/'];
dest_folder = ['cropped_dataset/blue2/'];
filePattern = fullfile(folder_name, '/*.*');
ImageFiles = dir(filePattern);
for k=1:35
    disp('current image');
    k
        %         close all
        picGray=(imread([folder_name,num2str(k,'%d'),'.jpeg']));
%        [ri,ci,di]=size(curr_slice);
%picGray = imread('dataset/black0/1.jpeg');
picGray = imresize(picGray, [250 250]);

org = uint8(picGray);

I1 = picGray;
   radius =21;
   
   I1_ = fftshift(fft2(double(I1)));
   [m n z] = size(I1);
   h = fspecial('gaussian', [m n], radius);
   h = h./max(max(h));
   for colorI = 1:1
      J_(:,:,colorI) = I1_(:,:,colorI).*(2-h)-I1_(:,:,colorI).*(h);
   end
   J = uint8(real(ifft2(ifftshift(J_))));


picGray = J;

IM = picGray;



winSize = ceil(26 * 17);
params.eye.gaussian = fspecial('gaussian', [winSize winSize], 26);

winSize = ceil(26 * 17);
params.out.gaussian = fspecial('gaussian', [winSize winSize], 17);
    map = imfilter(picGray, params.eye.gaussian, 0);

I = map;
%%%%%%%%%%%%%%%EDGE DETECTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     [~, threshold] = edge(I, 'canny');
% fudgeFactor = .5;
% BWs = edge(I,'canny', threshold * fudgeFactor);
level = graythresh(picGray);
BWs = imbinarize(picGray,level);
 %BWs = picGray>mean(picGray(:));

 %figure, imshow(BWs), title('binary gradient mask');
    %%%%%%Dilate Image%%%%%%%%%%%%%%%%%%%%%
% se90 = strel('line', 3, 90);
% se0 = strel('line', 3, 0);
%     BWsdil = imdilate(BWs, [se90 se0]);
% figure, imshow(BWsdil), title('dilated gradient mask');


%%%%%%%%%%%5FILL INTERIOR GAPS%%%%%%%%%%%%%%%%%%%
    BWs = imfill(BWs, 'holes');
BWs = bwmorph(BWs,'remove');
% figure, imshow(BWdfill);
% title('binary image with filled holes');
se = strel('disk',6);
BWs = imclose(BWs,se);
%%%%%%%REMOVE CONNECTED OBJECTS ON BORDER%%%%%%%%%%%%%
% BWs = xor(BWs , bwareaopen(BWs , 1)) ;
% figure,imshow(BWs),title('REMOVE LINE');
BWnobord = imclearborder(BWs, 1);
%BWnobord = bwareaopen(BWnobord, 1);
figure, imshow(BWnobord), title('cleared border image');

BWnobord = imresize(BWnobord, [250 250]);
%%%%%%%%%%%%%%SMOOTH OBJECT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% seD = strel('diamond',1);
% BWfinal = imerode(BWnobord,seD);
% BWfinal = imerode(BWfinal,seD);
% figure, imshow(BWfinal), title('segmented image');


%%%%%%%%%%%%%%%%%%%%%FINAL RESULT%%%%%%%%%%%%%%%%
BWoutline = bwperim(BWnobord);
SegoutR = org(:,:,1);
SegoutG = org(:,:,2);
SegoutB = org(:,:,3);
SegoutR(BWoutline) = 250;
SegoutG(BWoutline) = 10;
SegoutB(BWoutline) = 0;
Segout = cat(3, SegoutR, SegoutG, SegoutB);
figure, imshow(Segout), title('outlined original image');
% visboundaries(BWnobord,'Color','r');
% title('Blue - Initial Contour, Red - Final Contour');

disp('Cropping Image');
stats = regionprops(BWnobord,'BoundingBox','Area');
area = cat(1,stats.Area);
[~,maxAreaIdx] = max(area);
bb = round(stats(maxAreaIdx).BoundingBox);

%# note that regionprops switches x and y (it's a long story)
croppedImage = org(bb(2):bb(2)+bb(4),bb(1):bb(1)+bb(3),:);
croppedImage = imresize(croppedImage(:,:,1),[18 18]);
figure,imshow(org);
disp('Done Cropping');
img_name = strcat(dest_folder,int2str(k));
img_name = strcat(img_name,'.png');
imwrite(croppedImage,img_name)
disp('Done writting');
end
