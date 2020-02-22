function [ e ] = tsalis_Entropy( p, q )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
e=0;
n=length(p);
p=p./sum(p);
for i=1:n
    e=e+p(i)^q;
end
e=(1-e)/(q-1);
end
