clc, clearvars, close all

syms x;

steps = 8;

epsilon = 0.1;

f(x) = 3*x+epsilon*sin(2*pi*x);

%f(x) = 3*x;

[fPiecewise, fDomains] = ConvertToPiecewise(f);

%fPiecewise = {(2+epsilon)*x, ((2+epsilon)*x-1)/(1+epsilon)};
%fDomains = {[0,1/(2+epsilon)],[1/(2+epsilon),1]};

degreeF = size(fPiecewise,2);

IntervalsF = cat(2,GetIntervals(fPiecewise,fDomains,steps),1);

[E,EDomains] = ESubK(degreeF);

IntervalsE = cat(2,GetIntervals(E,EDomains,steps),1);

plot(IntervalsF,IntervalsE,'-o','MarkerSize',1);
hold on;