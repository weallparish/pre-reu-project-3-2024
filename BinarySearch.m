function [index1, index2] = BinarySearch(ySpace, y)
%BINARYSEARCH Summary of this function goes here
%   Detailed explanation goes here
% Assume array passed in is sorted and non-zero
left = 1;
right = length(ySpace);

while left < right
    
    middle = floor((right + left)/2);
    if y > ySpace(middle) % Interval is to the left
        left = middle + 1;
    else % Interval is to the right
        right = middle;
    end
end

if (x == left)
    index1 = left;
    index2 = left;
else
    index1 = left;
    index2 = left - 1;
end
end