D = 'C:\Users\User-PC\Desktop\swd image\New folder\images';
S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.
D1 = 'C:\Users\User-PC\Desktop\swd image\New folder\ground truth';
S1 = dir(fullfile(D1,'*.mat')); % pattern to match filenames.
segm=groundTruth{1}.Segmentation;
R=zeros(1,500);
CGE=zeros(1,500);
VOI=zeros(1,500);
R1=zeros(1,500);
CGE1=zeros(1,500);
VOI1=zeros(1,500);
% t-Entropy
for i = 250:500
    F = fullfile(D,S(i).name);
    F1 = fullfile(D1,S1(i).name);
    img = imread(F);
    I1=load(F1);
    seg=I1.groundTruth{1}.Segmentation;
    k=max(seg(:));
    img1=rgb2lab(img);
    img1=floor(img1(:,:,1));
    A=Segment_k_best(img1,k-1,50,200,0.8,20,0.8,0,255);
    [R(i),CGE(i),VOI(i)]=compare_segmentations(seg,A+1);    
    disp(i)
end
% Shannon's Entropy

for i = 1:61
    F = fullfile(D,S(i).name);
    F1 = fullfile(D1,S1(i).name);
    img = imread(F);
    I1=load(F1);
    seg=I1.groundTruth{1}.Segmentation;
    k=max(seg(:));
    img1=rgb2lab(img);
    img1=floor(img1(:,:,1));
%    compare_segmentations(seg,A+1)
    [A,~]=Segment_k_shannon(img1,k-1,200,0.8,20,0.8,0,255);
    [R1(i),CGE1(i),VOI1(i)]=compare_segmentations(seg,A+1); 
    disp(i)
end
mean(R)
mean(R1)

mean(CGE)
mean(CGE1)

mean(VOI)
mean(VOI1)

Voi=VOI';
296059
189080
86016 
img=imread('C:\Users\User-PC\Desktop\swd image\New folder\images\78004.jpg');
img=imread('C:\Users\User-PC\Desktop\swd image\New folder\images\296059.jpg');
imshow(img)
img1=rgb2lab(img);
img1=rgb2gray(img);
img1=floor(img(:,:,1));
B=imgaussfilt(img1,2);
[A,~]=Segment_k_best(img1,16,0.1,100,0.8,20,0.8,0,100);
[A2,~]=Segment_k_shannon(img1,16,100,0.8,10,0.8,0,100);
[A,~]=Segment_k_best_tsalis(img1,16,2,100,0.8,20,0.8,0,100);
[A,~]=Segment_k_best_Reni(img1,16,2,100,0.8,20,0.8,0,100);
img2=seg2col(A,img);
img2=floor(uint8(img2));
imshow(img2)
bmap = seg2bmap(A);
imshow(bmap);
I1=load('C:\Users\User-PC\Desktop\swd image\New folder\ground truth\78004.mat');
seg=I1.groundTruth{1}.Segmentation;
[r,g,v]=compare_segmentations(seg,A)
[r1,g1,v1]=compare_segmentations(seg,A1)
imwrite(img2,'hati_Reni.png');

