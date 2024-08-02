clc, clearvars, close all

syms x;

f1(x) = 2*x;
f2(x) = 2*x-1;

F = {f1, f2};
degree = size(F,2);

G = {degree};

%Calculate inverses.
for i = 1:degree
    G{i} = finverse(F{i});
end


