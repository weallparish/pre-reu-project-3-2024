clc, clearvars, close all

syms x;

f(x) = 3*x;

increment = 0.01;

xValue = 0;

lowerBound = 0;
domainNumber = 1;

circlularF = {};
domainsF = {};

while xValue <= (1+increment)
    yValue = f(xValue);

    if (yValue >= 1)
        circularF{domainNumber} = f(x);
        domainsF{domainNumber} = (lowerBound <= x & x < xValue);

        lowerBound = xValue;
        domainNumber = domainNumber + 1;

        f(x) = f(x) - 1;
    end

    xValue = xValue + increment;

end

circularF
domainsF