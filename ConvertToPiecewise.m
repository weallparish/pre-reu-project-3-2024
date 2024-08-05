function [fPiecewise,fDomains] = ConvertToPiecewise(f, increment)
arguments
    f;
    increment = 0.01;
end

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms x;

xValue = 0;
lowerBound = 0;
domainNumber = 1;

fPiecewise = {};
fDomains = {};

while xValue <= (1+increment)
    yValue = f(xValue);

    if (yValue >= 1)
        fPiecewise{domainNumber} = f(x);
        fDomains{domainNumber} = (lowerBound <= x & x < xValue);

        lowerBound = xValue;
        domainNumber = domainNumber + 1;

        f(x) = f(x) - 1;
    end

    xValue = xValue + increment;
end
end

