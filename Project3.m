clc, clearvars, close all

syms x;

epsilon = 0.1;

f(x) = 3*x+epsilon*sin(6*pi*x);
[fPiecewise, fDomains] = ConvertToPiecewise(f);

PlotPiecewise(fPiecewise,fDomains);
PlotConjugacy(fPiecewise,fDomains,5);