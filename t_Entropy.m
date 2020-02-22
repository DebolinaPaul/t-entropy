function [ e ] = t_Entropy( p, a )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
e=0;
n=length(p);
p=p./sum(p);
for i=1:n
    e=e+p(i)*atan(1/p(i)^a);
end
e=e-pi/4;
end

