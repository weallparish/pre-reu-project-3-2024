function [ESubKFinal] = ESubK(degree)
%ESUBK Summary of this function goes here
%   Detailed explanation goes here
syms x;

ESubK = {degree};
e(x) = x;

for i = 1:degree
    e(x) = degree*x-(i-1);
    ESubK{i} = symfun(e,x);
end

ESubKFinal = ESubK;
end

