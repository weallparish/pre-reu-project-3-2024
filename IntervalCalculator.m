clc, clearvars, close all

syms x;

steps = 10;

epsilon = 7;

f1(x) = (2+epsilon)*x;
f2(x) = ((2+epsilon)*x-1)/(1+epsilon);

F = {f1, f2};

IntervalsF = cat(2,GetIntervals(F,steps),[1]);

e1(x) = 2*x;
e2(x) = 2*x-1;

E = {e1, e2};

IntervalsE = cat(2,GetIntervals(E,steps),[1]);

plot(IntervalsF,IntervalsE,'-o');

