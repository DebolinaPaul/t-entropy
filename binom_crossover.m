function [ z ] = binom_crossover( x,y,p )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n=length(x);
z=zeros(1,n);
for i=1:n
    a=binornd(1,p);
    z(i)=a*x(i)+(1-a)*y(i);
end
end