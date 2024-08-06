function [] = PlotConjugacy(fPiecewise,fDomains,steps)
    arguments
        fPiecewise; %Functions that make up the piecewise.
        fDomains; %Domains of each piecewise function.
        steps; %Number of coding intervals to calculate. (degree^steps)
    end

%PLOTCONJUGACY Calculates and plots the conjugacy of f and E_k
%   The conjugacy is graphed using the coding intervals of f and E_k,
%   where the coding intervals of f correspond to the x-axis and
%   the coding intervals of E_k correspond to the y-axis.

    fDegree = size(fPiecewise,2); %Second argument: size of array in columns.
    
    IntervalsF = GetIntervals(fPiecewise,fDomains,steps);
    
    [E,EDomains] = ESubK(fDegree); %Generate an E_k function with degree of f.

    IntervalsE = GetIntervals(E,EDomains,steps);
    
    %Use the endpoints of f's intervals as the x-axis
    %and the endpoints of E_k's intervals as the y-axis.
    plot(IntervalsF,IntervalsE,'r-o','MarkerSize',2,'LineWidth',2); %Plot is red with circles.
    hold on; %Keep this plot on the graph when something else is plotted.
    
    %Focus plot only on the domain/codomain [0,1)/[0,1)
    xlim([0,1]);
    ylim([0,1]);
end

