function [FinalIntervals] = GetIntervals(fPiecewise,fDomains,steps)
arguments
    fPiecewise; %Functions that make up the piecewise.
    fDomains; %Domains of each piecewise function.
    steps; %Number of coding intervals to calculate. (degree^steps)
end

%GETINTERVALS Calculates the left-hand endpoints of coding intervals.
%   Uses the approximate inverse of each piecewise function to find
%   endpoints.

    degree = size(fPiecewise,2); %Second argument: size of array in columns.
    
    fInverses = cell(1,degree); %Empty cell array.
    
    %Calculate inverse approximation for each piecewise function on its
    %defined domain.
    for i = 1:degree
        fInverses{i} = InverseApproximation(fPiecewise{i},fDomains{i}(1),fDomains{i}(2));
    end
    
    oneStepIntervals = zeros(1,degree); %Empty array
    
    %Calculate the left-hand endpoints of the one-step intervals of f using
    %the inverses at x=0.
    for i = 1:degree
        oneStepIntervals(i) = fInverses{i}.InverseOf(0);
    end
    
    %Determine how many intervals need to be calculated.
    intervalAmount = 1;
    for i = 1:steps
        intervalAmount = intervalAmount + degree^i;
    end
    
    %Create an array of size intervalAmount to store all left-hand
    %endpoints of the intervals, fill the first degree endpoints with the
    %oneStepIntervals calculated earlier.
    intervals = cat(2,oneStepIntervals, zeros(1,intervalAmount-degree));
    
    %Since the one-step intervals were already calculated, we can start
    %calculating the two-step intervals.
    row = 2;
    movementsInRow = 0;
    
    leftmostIndices = zeros(1,steps); %Empty array.
    
    %Define the first 2 leftmost indices of their respective rows.
    leftmostIndices(1) = 1;
    leftmostIndices(2) = degree + 1;
    
    for index = (degree+1):intervalAmount
        %If the interval that needs to be calculated is the left-most child
        %of its parent, it has the same value as its parent. 
        %(Assuming f(0)=0)
        if mod(index,degree) == 1
            intervals(index) = intervals(floor((index-1)/degree));

        %If the interval is not the left-most child of its parent,
        %apply an inverse to whichever interval is nested in this
        %interval's definition.
        else       
            nestedPoint = intervals( ...
                leftmostIndices(row-1) ...
                +mod(movementsInRow,degree^(row-1)));
        
            correspondingInverse = fInverses{RootParent(degree,index,row)};
        
            intervals(index) = correspondingInverse.InverseOf(nestedPoint);
        end
    
        movementsInRow = movementsInRow + 1;
        
        %When the end of a row is reached, move to the next row.
        if movementsInRow >= degree^row 
            movementsInRow = 0;
            row = row +1;
            leftmostIndices(row) = index + 1;
        end
    end

    %Add the right-most endpoint: 1.
    intervals(end) = 1;
    
    %Return only the last row of the tree, the previous rows are only
    %important for calculations.
    FinalIntervals = intervals(floor(end/degree):end);
end

