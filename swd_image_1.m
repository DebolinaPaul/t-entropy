img = imread('baboon.png');
img = imread('lena_color_512.tif');
img=imread('cameraman.tif');
img=imread('mandril_gray.tif');
img=imread('lake.tif');
img=imread('kodim23.png');
img=imread('woman_darkhair.tif');
img = imread('nude.jpg');
img=imread('42049.jpg');
img=imread('8.gif');
img=imread('coins.png');
img=imread('camera.jpg');
img=imread('carriage.png');
img=imread('ladder.png');
img=imread('20.ras');
img=imread('crane.png');
img=imread('bream_in_basin.png');
img=imread('44.gif');
img=imread('plane.png');
img=imread('chain98.png');
img=imread('Brain1.pgm');
img=imread('tree.png');
img=imread('img_1965.png');
img=imread('baloon.png');
img=imread('dollar.tif');
img=imread('leafpav.png');
img=imread('osaka.png');
img=imread('peppers_color.tif');
img=imread('monarch.png');
img=imread('tulips.tif');
img=imread('girl.jpg');
img=imread('bikini.jpg');
img=rgb2gray(img);
imshow(img);
img=img(:,:,1);
img = imread('lena.png');
imhist(img);
f=img2freq(img);
img_Entropy(img,1)
t_Entropy([1/2,1/2],1)
t_Entropy([1,0],1)
t_Entropy(f(1:150)./sum(f(1:150)),1);
[A,t,f_val]=segment(img,1,50:200);
[A,t,f_val]=segment_shannon(img,10:250);
[A,t,s]=segment(img1,1,0:100);
[A,t,s]=segment_3(img1,1,10:250);
imshow(uint8(A));
plot(10:250,f_val)

[pixelCount, grayLevels] = imhist(grayImage);
bar(grayLevels, pixelCount);
windowWidth = 21;
kernel = ones(windowWidth)/windowWidth^2;
blurredImage = imfilter(img, kernel);
imshow(blurredImage);
tic
s=segment_hist_2d(img,7,1);
toc
imshow(s);
J = medfilt2(s,[7,7]);
imshow(J);
print('-bestfit','BestFitFigure','-dpdf')
E=Edge_t_entropy(img,4,1);
A=E/max(E(:));
A
w=3
[m,n]=size(img);
for i=(w+1):(m-w)
    for j= (w+1):(n-w)
        if(A(i-w,j-w)<0.9)
            A(i-w,j-w)=0;
        end
    end
end
imwrite(A,'osaka_0_1.png');
p=[0:0.01:1];
c=50;
y=p.*atan(1./p.^c)+(1-p).*atan(1./((1-p).^c))-pi/4;
plot(p,y)
hold on
c=5;
y=p.*atan(1./p.^c)+(1-p).*atan(1./((1-p).^c))-pi/4;
plot(p,y)
ylim([0,1])
hold on
c=1;
y=p.*atan(1./p.^c)+(1-p).*atan(1./((1-p).^c))-pi/4;
plot(p,y)
hold on
c=0.1;
y=p.*atan(1./p.^c)+(1-p).*atan(1./((1-p).^c))-pi/4;
plot(p,y)
c=0.1;
p1=p(2:100);
y=p1.*log(1./p1)+(1-p1).*log(1./((1-p1)));
y=[0,y,0];
plot(p,y)
ylim([0,1.25])
abc=rgb2xyz(img);
abc=rgb2ycbcr(img);
img=rgb2gray(img);
sum(sum(img==100))
img1=rgb2gray(img);
img2=seg2col(A,img);
img2=floor(uint8(img2));
img1=rgb2lab(img);
img1=floor(img1(:,:,1));
imshow(abc)
imshow(uint8(floor(abc(:,:,1))));
[A,t]=Segment_k(img1,4,0.1,200,0.8,50,0.8,40,200);
[A,t]=Segment_k_best(img1,5,1,100,0.8,120,0.8,30,230);
img2=seg2col(A,img);
img2=floor(uint8(img2));
imshow(img2)
B=seg2col(A,img);
imshow(B)
load handel
sound(y,Fs)
[A1,t]=Segment_k_best(img(:,:,1),2,1,100,0.8,20,0.8,0,255);
[A2,t]=Segment_k_best(img(:,:,2),2,1,100,0.8,20,0.8,0,255);
[A3,t]=Segment_k_best(img(:,:,3),2,1,100,0.8,20,0.8,0,255);
img2=seg2col3(A1,A2,A3,img);
img2=floor(uint8(img2));
imshow(img2)
imageFilenames = data.113009.imageFilename(1:2)
X=load('2018.mat')
X=readSeg('33039.seg');
img=imread('01_object.png');
img=imread('01.jpg');
img=imread('Semantic dataset100\image\246009.jpg');
Files=dir('*.*');
for k=1:length(Files)
   FileNames=Files(k).name
end
dinfo = dir('*.txt');
dinfo = dir('*.txt');

for K = 1 : length(dinfo)
  thisfilename = dinfo(K).name;  %just the name
  thisdata = load(thisfilename); %load just this file
  fprintf( 'File #%d, "%s", maximum value was: %g\n', K, thisfilename, max(thisdata(:)) );   %do something with the data
end

seg = readSeg('33039.seg');
bmap = seg2bmap(seg);
compare_image_boundary_error(A,A)
compare_segmentations(A1+1,A+1)
A=A+1