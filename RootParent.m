function [rootIndex] = RootParent(degree, index, row)
    arguments
        degree; %Degree of function.
        index; %Index of item in tree.
        row; %Row of item in tree.
    end

%ROOTPARENT Finds the highest parent of an item in an n-ary tree.

    lastIndex = index;
    
    for i = 1:row-1
        lastIndex = floor((lastIndex-1)/degree);
    end
    
    rootIndex = lastIndex;
end

