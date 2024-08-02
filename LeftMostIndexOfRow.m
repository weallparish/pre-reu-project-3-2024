function [outIndex] = LeftMostIndexOfRow(degree, row)
%LEFTMOSTINDEXOFROW Summary of this function goes here
%   Detailed explanation goes here
rowLengths = 0;

for i = 1:row-1
    rowLengths = rowLengths + degree^i;
end

outIndex = rowLengths + 1;
end

