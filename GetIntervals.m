function [FinalIntervals] = GetIntervals(F,FDomains,steps)
%GETINTERVALS Summary of this function goes here
%   Detailed explanation goes here
syms x;

degree = size(F,2);

G = cell(1,degree);

for i = 1:degree
    G{i} = InverseApproximation(F{i},FDomains{i}(1),FDomains{i}(2));
end

OneStepIntervals = zeros(1,degree);

for i = 1:degree
    OneStepIntervals(i) = G{i}.Inverse(0);
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
    if mod(index,degree) == 1
        Intervals(floor((index-1)/degree));
        Intervals(index) = Intervals(floor((index-1)/degree));
    else       
        nestedPoint = Intervals(leftmostIndices(row-1)+mod(movementsInRow,degree^(row-1)));
    
        correspondingInverse = G{RootParent(degree,index,row)};
    
        Intervals(index) = correspondingInverse.Inverse(nestedPoint);
    end

    movementsInRow = movementsInRow + 1;
    
    if movementsInRow >= degree^row 
        movementsInRow = 0;
        row = row +1;
        leftmostIndices(row) = index + 1;
    end
end

FinalIntervals = Intervals(floor(end/degree):end);
end

