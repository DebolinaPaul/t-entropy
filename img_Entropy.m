function [ e ] = img_Entropy( img , a)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
f=img2freq(img);
f=f./sum(f);
e=0;
for i=1:256
    e=e+f(i)*atan(1/f(i)^a);
end
e=e-pi/4;
end

