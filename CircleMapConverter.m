clc, clearvars, close all

syms x;

f(x) = 2*x;

increment = 0.01;

xValue = 0;

lowerBound = 0;

pf(x) = piecewise(x==0, 0);

while xValue <= (1+increment)
    yValue = f(xValue);

    if (yValue >= 1)
        pf(x) = piecewise(lowerBound <= x & x < xValue, f(x))
        lowerBound = xValue;

        f(x) = f(x) - 1;
    end

    xValue = xValue + increment;

end

pf(x)