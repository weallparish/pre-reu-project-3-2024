function [GApprox] = InverseApproximate(fPiecewise,fDomains)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms y;

degree = size(fPiecewise,2);

g(y) = y;
GApprox = {degree};

for i = 1:degree
    g(y) = fPiecewise{i};

    ySpace = linspace(fDomains{i}(1),fDomains{i}(2),100);

    GApprox{i} = g(ySpace);

    plot(g(ySpace),ySpace);
    hold on;
end
end

