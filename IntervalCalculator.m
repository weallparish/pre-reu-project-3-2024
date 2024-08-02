clc, clearvars, close all

syms x;

steps = 10;

epsilon = 0.3;

f1(x) = (2+epsilon)*x;
f2(x) = ((2+epsilon)*x-1)/(1+epsilon);

%evil sin function that doesn't work:

% f1(x) = piecewise(x>=0 & x<0.5,2*x+epsilon*sin(2*pi*x))
% f2(x) = piecewise(x>=0.5 & x<1, 2*x+epsilon*sin(2*pi*x) - 1);
% 
% finverse(f1(x));
% 
% fplot(f1);
% hold on;
% fplot(f2);

F = {f1, f2};

degreeF = size(F,2);

IntervalsF = cat(2,GetIntervals(F,steps),1);

e1(x) = 2*x;
e2(x) = 2*x-1;

E = ESubK(2);

IntervalsE = cat(2,GetIntervals(E,steps),1);

plot(IntervalsF,IntervalsE,'-o','MarkerSize',1);

