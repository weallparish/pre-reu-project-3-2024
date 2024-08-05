function [] = PlotConjugacy(fPiecewise,fDomains,steps)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
degreeF = size(fPiecewise,2);

IntervalsF = cat(2,GetIntervals(fPiecewise,fDomains,steps),1);

[E,EDomains] = ESubK(degreeF);

IntervalsE = cat(2,GetIntervals(E,EDomains,steps),1);

plot(IntervalsF,IntervalsE,'-o','MarkerSize',1);
hold on;

xlim([0,1]);
ylim([0,1]);

end

