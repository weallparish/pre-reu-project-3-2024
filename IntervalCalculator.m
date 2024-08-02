clc, clearvars, close all

syms x;

steps = 10;

f1(x) = 2*x;
f2(x) = 2*x-1;

F = {f1, f2};
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

for index = (degree+1):IntervalAmount
    nestedPoint = Intervals(LeftMostIndexOfRow(degree,row-1)+mod(movementsInRow,degree^(row-1)));

    correspondingInverse = G{RootParent(degree,index,row)};

    Intervals(index) = correspondingInverse(nestedPoint);

    Point = [index, Intervals(index)];

    movementsInRow = movementsInRow + 1;
    
    if movementsInRow >= degree^row 
        movementsInRow = 0;
        row = row +1;
    end
end

Intervals

