function [ A,t ] = Segment_k_best_Reni( img, k , a, tmax, F,n ,Cr,m1,m2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t=255/(k+1)*[1:k];
T=zeros(k,n);
T_new=zeros(k,n);
fval=zeros(1,n);
for i =1:n
    T(:,i)=datasample(m1:m2,k,'Replace',false);
    T(:,i)=sort(T(:,i));
    fval(i)=Reni_eval( img, (T(:,i))', a);
end


for j=1:tmax
    for i=1:n
        [~,pos]=min(fval);
        s = datasample(1:n,2,'Replace',false);
        T_new(:,i)= T(:,pos)+F*(T(:,s(1))-T(:,s(2)));
        if(sol_checker(T_new(:,i),m1,m2)==1)
            T_new(:,i)=T(:,i);
        end
            z=binom_crossover(T(:,i),T_new(:,i),Cr);
        
        z=floor(z);
        if (Reni_eval( img, z, a)>fval(i))
            T(:,i)=z;
        end
        
         fval(i)=Reni_eval( img, (T(:,i))', a);
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