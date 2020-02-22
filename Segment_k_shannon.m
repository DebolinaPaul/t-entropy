function [ A,t ] = Segment_k_shannon( img, k, tmax, F,n ,Cr,m1,m2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t=255/(k+1)*[1:k];
T=zeros(k,n);
T_new=zeros(k,n);
fval=zeros(1,n);
for i =1:n
    T(:,i)=datasample(m1:m2,k,'Replace',false);
    T(:,i)=sort(T(:,i));
    fval(i)=shannon_eval( img, (T(:,i))');
end


for j=1:tmax
    for i=1:n
        s = datasample(1:n,3,'Replace',false);
        T_new(:,i)= T(:,s(1))+F*(T(:,s(2))-T(:,s(3)));
        if(sol_checker(T_new(:,i),m1,m2)==1)
            T_new(:,i)=T(:,i);
        end
            z=binom_crossover(T(:,i),T_new(:,i),Cr);
        
        z=floor(z);
        if (shannon_eval( img, z)>fval(i))
            T(:,i)=z;
        end
          fval(i)=shannon_eval( img, (T(:,i))');
    end
   % disp(j)
end
[~,pos]=min(fval);
t=T(:,pos);
t=floor(t);
[m,n]=size(img);
A=zeros(m,n);
for i=1:m
    for j=1:n
        A(i,j)=sum(img(i,j)>t);
    end
end
end