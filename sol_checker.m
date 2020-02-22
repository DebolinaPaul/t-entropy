function [ flag ] = sol_checker( t,a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
k=length(t);
flag=0;
if (sum(t<a)>0)
    flag=1;
elseif (sum(t>b)>0)
    flag=1;
elseif (sum(sort(t)==t)<k)
    flag=1;
end
    
end

