function [ESubKFinal,ESubKIntervals] = ESubK(degree)
%ESUBK Summary of this function goes here
%   Detailed explanation goes here
syms x;

ESubK = {degree};
ESubKIntervals = {degree};
e(x) = x;

for i = 1:degree
    e(x) = degree*x-(i-1);
    ESubK{i} = symfun(e,x);
    ESubKIntervals{i} = [(i-1)/degree,i/degree];
end

ESubKFinal = ESubK;
end

