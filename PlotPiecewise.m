function [] = PlotPiecewise(fPiecewise,fDomains)
%PLOTPIECEWISE Summary of this function goes here
%   Detailed explanation goes here
syms x;

f(x) = x;

totalPoints = 1000;
fDegree = size(fPiecewise,2);

for i = 1:fDegree
    xSpace = linspace(fDomains{i}(1),fDomains{i}(2),totalPoints/fDegree);

    f(x) = fPiecewise{i};
    ySpace = f(xSpace);

    plot(xSpace, ySpace, "b-o",'MarkerSize',1);
    hold on;
end

end

