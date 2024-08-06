function [ESubK,ESubKIntervals] = ESubK(degree)
%ESUBK Generates an E_k function with a given degree.
%   Creates a function that satisfies the definition:
%   E_k(x) = kx + floor(kx)

    syms x;
    
    ESubK = cell(1,degree); %Empty array.
    ESubKIntervals = cell(1,degree); %Empty array.
    e(x) = x; %Default function.
    
    %Define E_k as a piecewise function instead of using the floor.
    for i = 1:degree
        e(x) = degree*x-(i-1);
        ESubK{i} = symfun(e,x);
        ESubKIntervals{i} = [(i-1)/degree,i/degree];
    end
end

