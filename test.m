clc, clearvars, close all

syms x;

steps = 2;

f1(x) = 2*x;
f2(x) = 2*x-1;

g1 = finverse(f1);
g2 = finverse(f2);

G = {g1 g2};

I1 = [g1(0) g2(0)];

I1_RowSize = size(I1,2);

Z = zeros(1,I1_RowSize^steps);

I = cat(2,I1,Z);

I_RowSize = size(I,2);

index = I1_RowSize;

while index < I_RowSize
    index = index+1

    b = G{floor((index-I1_RowSize)+0.5/2)};

    a = b(I1(mod(index,2)+1))

    I(index) = a;
end

I


