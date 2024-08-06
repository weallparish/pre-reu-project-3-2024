function [index] = BinarySearch(ySpace, y)
    arguments
        ySpace; %Space to search.
        y; %Point to find index of in space.
    end
    
%BINARYSEARCH Finds the index of the closest point in ySpace to y.
%   Assume array passed in is sorted and non-zero

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

    index = left;
end