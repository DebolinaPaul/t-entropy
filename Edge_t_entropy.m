function [ E ] = Edge_t_entropy( img,w,a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(img);
E=zeros(m-2*w,n-2*w);
for i=(w+1):(m-w)
    for j= (w+1):(n-w)
        I=img((i-w):(i+w),(j-w):(j+w));
        E(i-w,j-w)=img_Entropy(I,a);
    end
end
%E=E/max(E(:));
%for i=(w+1):(m-w)
%    for j= (w+1):(n-w)
%        if(E(i-w,j-w)<1)
%            E(i-w,j-w)=0;
%        end
%    end
%end
end

