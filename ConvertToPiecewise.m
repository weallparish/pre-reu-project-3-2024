function [fPiecewise,fDomains] = ConvertToPiecewise(f, increment)
    arguments
        f; %function to convert to piecewise.
        increment = 0.01; %increment to step function by.
    end

%CONVERTTOPIECEWISE Converts a continous function to a continous,
%piecewise-increasing circle map.
%   Splits the function into the pieces between when an integer is crossed.

    syms x;
    
    xValue = 0;
    lowerBound = 0;
    domainNumber = 1;
    
    fPiecewise = cell(1); %Empty array.
    fDomains = cell(1); %Empty array.
    
    %Search function from x=0 to x=1.
    while xValue <= (1+increment)
        yValue = f(xValue);
    
        if (yValue >= 1)
            fPiecewise{domainNumber} = f(x);
            fDomains{domainNumber} = ([lowerBound,xValue]);
    
            lowerBound = xValue;
            domainNumber = domainNumber + 1;
    
            %Shift the function to start at x=0 at current point.
            f(x) = f(x) - 1;
        end
    
        xValue = xValue + increment;
    end
end

