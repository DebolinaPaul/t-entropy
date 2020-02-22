function [ e ] = t_Entropy_matrix( M, a )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(M);
M=M/sum(sum(M));
e=0;
for i=1:m
    for j= 1:n
    e=e+M(i,j)*atan(1/M(i,j)^a);
    end
end
e=e-pi/4;

end

