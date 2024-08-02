clc, clearvars, close all

syms x;

steps = 2;

epsilon = pi;

f1(x) = (3+epsilon)*x;
f2(x) = ((3+epsilon)*x-1)/(1+epsilon);

F = {f1, f2};

degreeF = size(F,2);

IntervalsF = cat(2,GetIntervals(F,steps),1);

e1(x) = 2*x;
e2(x) = 2*x-1;

E = ESubK(degreeF);

IntervalsE = cat(2,GetIntervals(E,steps),1);

plot(IntervalsF,IntervalsE,'-o','MarkerSize',1);

