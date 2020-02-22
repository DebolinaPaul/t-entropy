function [ seg ] = segment_hist_2d( img, windowWidth, a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(img);
kernel = ones(windowWidth)/windowWidth^2;
blurredImage = imfilter(img, kernel);

hist2d = zeros(256, 256);
for row = 1 : m
	for column = 1 : n	
		index1 = img(row, column);
		index2 = round(blurredImage(row, column));
		hist2d(index1 + 1, index2 + 1) = hist2d(index1 + 1, index2 + 1) + 1;
	end
end
I=10:250;
J=10:250;

I_len=length(10:250);
J_len=length(10:250);
grid=zeros(I_len,J_len);


for i= 1:I_len
    for j= 1:J_len
        s=I(i);
        t=J(j);
        im1= hist2d(1:s,1:t);
        im2= hist2d((s+1):256,(t+1):256);
        H1=t_Entropy_matrix(im1,a);
        H2=t_Entropy_matrix(im2,a);
        grid(i,j)=H1+H2;
        disp([I(i),J(j)])
    end
    
end

   
[~,i,j]=max_matrix(grid);
s=I(i);
t=J(j);
    seg=zeros(m,n);
 %   for k=1:m
 %       for j=1:n
 %           if(img(k,j)<(threshold-1))
 %               seg(k,j)= 0;
 %           else
 %               seg(k,j)=255;
 %           end
 %       end
 %   end
for i=1:m
    for j=1:n
        if((img(i,j)<(s-1))&(blurredImage(i,j)<(s-1)))
            seg(i,j)=0;
        else
            seg(i,j)=255;
        end
    end
end

end

