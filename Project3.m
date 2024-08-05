clc, clearvars, close all

syms x;

k = 2;
epsilon = 0.1;

%f(x) = 2*x+epsilon*sin(2*pi*x);

f(x) = k*x+0.1*sin(2*k*pi*x);

[fPiecewise, fDomains] = ConvertToPiecewise(f);

PlotPiecewise(fPiecewise,fDomains);
PlotConjugacy(fPiecewise,fDomains,3);