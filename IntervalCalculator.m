clc, clearvars, close all

syms x;

steps = 3;

epsilon = 1;

f(x) = 2*x+epsilon*sin(2*pi*x);

[fPiecewise, fDomains] = ConvertToPiecewise(f);

%evil sin function that doesn't work:

% f1(x) = piecewise(x>=0 & x<0.5,2*x+epsilon*sin(2*pi*x))
% f2(x) = piecewise(x>=0.5 & x<1, 2*x+epsilon*sin(2*pi*x) - 1);
% 
% finverse(f1(x));
% 
% fplot(f1);
% hold on;
% fplot(f2);

degreeF = size(fPiecewise,2);

IntervalsF = cat(2,GetIntervals(fPiecewise,fDomains,steps),1);

[E,EDomains] = ESubK(degreeF)

IntervalsE = cat(2,GetIntervals(E,EDomains,steps),1);

plot(IntervalsF,IntervalsE,'-o','MarkerSize',1);

