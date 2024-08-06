function [] = PlotPiecewise(fPiecewise,fDomains,graphPoints)
    arguments
        fPiecewise; %Functions that make up the piecewise.
        fDomains; %Domains of each piecewise function.
        graphPoints = 1000; %Number of points on graph to calculate.
    end

%PLOTPIECEWISE Plots a piecewise function.
%   Piecewise function must be defined as two arrays:
%       1) An array of the functions that make up the piecewise.
%       2) An array of the domains that the functions span.

    syms x;
    f(x) = x;
    
    fDegree = size(fPiecewise,2); %Second argument: size of array in columns.
    
    for i = 1:fDegree
        xSpace = linspace(fDomains{i}(1),fDomains{i}(2),graphPoints/fDegree);
    
        f(x) = fPiecewise{i};
        ySpace = f(xSpace);
    
        plot(xSpace, ySpace, "b-o",'MarkerSize',1); %Plot is blue with circles.
        hold on; %Keep this plot on the graph when something else is plotted.
    end
end

