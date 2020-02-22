function [z] = sub_mod_256(x,y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if(y==0)
    z=x;
else
    z=256-y;
    z=add_mod_256(x,z);
end

end

