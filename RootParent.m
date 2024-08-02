function [rootIndex] = RootParent(degree, index, row)
%ROOTPARENT Summary of this function goes here
%   Detailed explanation goes here
lastIndex = index;

for i = 1:row-1
    lastIndex = floor((lastIndex-1)/degree);
end

rootIndex = lastIndex;
end

