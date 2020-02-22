function [ seg, threshold,f_val ] = segment_shannon( img, I )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
f=img2freq(img);
f=f./sum(f);
I_len=length(I);
f_val=zeros(1,I_len);
for i=1:I_len
    t=I(i);
    f1=f(1:t)./sum(f(1:t));
    f2=f((t+1):256)./sum(f((t+1):256));
    H1=shannon_Entropy(f1);
    H2=shannon_Entropy(f2);
    f_val(i)=H1+H2;
end
    [~,threshold]=max(f_val);
    threshold=I(threshold);
    [m,n]=size(img);
    seg=zeros(m,n);
    for k=1:m
        for j=1:n
            if(img(k,j)<(threshold-1))
                seg(k,j)= 0;
            else
                seg(k,j)=255;
            end
        end
    end
    
end
