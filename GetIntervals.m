function [FinalIntervals] = GetIntervals(F,steps)
%GETINTERVALS Summary of this function goes here
%   Detailed explanation goes here

degree = size(F,2);

G = {degree};

%Calculate inverses.
for i = 1:degree
    G{i} = finverse(F{i});
end

OneStepIntervals = [degree];

for i = 1:degree
    OneStepIntervals(i) = G{i}(0);
end

IntervalAmount = 0;

for i = 1:steps
    IntervalAmount = IntervalAmount + degree^i;
end

Intervals = cat(2,OneStepIntervals, zeros(1,IntervalAmount-degree));

row = 2;
movementsInRow = 0;

leftmostIndices = steps;

leftmostIndices(1) = 1;
leftmostIndices(2) = degree + 1;

for index = (degree+1):IntervalAmount
    nestedPoint = Intervals(leftmostIndices(row-1)+mod(movementsInRow,degree^(row-1)));

    correspondingInverse = G{RootParent(degree,index,row)};

    Intervals(index) = correspondingInverse(nestedPoint);

    movementsInRow = movementsInRow + 1;
    
    if movementsInRow >= degree^row 
        movementsInRow = 0;
        row = row +1;
        leftmostIndices(row) = index + 1;
    end
end

FinalIntervals = Intervals(floor(end/degree):end)
end

