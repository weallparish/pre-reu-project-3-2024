function [] = PlotPiecewise(fPiecewise,fDomains)
%PLOTPIECEWISE Summary of this function goes here
%   Detailed explanation goes here
syms x;

f(x) = x;

for i = 1:size(fPiecewise,2)
    xSpace = linspace(fDomains{i}(1),fDomains{i}(2),1000);

    f(x) = fPiecewise{i};
    ySpace = f(xSpace);

    plot(xSpace, ySpace, "b-o",'MarkerSize',1);
    hold on;
end

end

