function [ H ] = Reni_eval( img, t,a)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t=[0,t,255];
L=length(t);
f=img2freq(img);
f=f./sum(f);
H=zeros(1,L-1);
for i=1:(L-1)
        f1 = f((t(i)+1):t(i+1))./sum(f((t(i)+1):t(i+1)));
        H(i)= Reni_Entropy(f1,a);
end
H=sum(H);

end