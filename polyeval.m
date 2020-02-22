function [f] = polyeval(a,x,M,A)
%THIS IS A FUNCTION TO EVALUATE A POLYNOMIAL WITH COEFFICIENTS a at the
%value x
%   INPUT a=[a_0,...,a_n], x
%   OUTPUT is the value a_0+a_1*x+...+a_n*x^n
[~,n]=size(a);
f=a(n);
for i=1:(n-1)
    f=M(f+1,x+1);
    f=A(f+1,a(n-i)+1);
end

end

