clc, clearvars, close all
syms x;

%Conjugacy Graphing Program:
%Graphs the conjugacy between an increasing, (piecewise) continous 
%function f where f(0) = 0 and Ek, where Ek is of the same degree as f.
%DOES NOT graph accurate conjugacies if any requirement isn't met.

%Definition of f

preset = 1;

k = 2;
p = 3;

if preset == 1
    %Linear piecewise function of degree 2

    fPiecewise = {(2+p)*x,((2+p)*x-1)/(1+p)};
    fDomains = {[0,1/(2+p)],[1/(2+p),1]};
    
elseif preset == 2
    %Sin function of degree k
    f(x) = k*x+p*sin(2*k*pi*x);
    
    [fPiecewise, fDomains] = ConvertToPiecewise(f);

else
    %Define a custom function here
    f(x) = k*x;
end

%Plots of f and its conjugacy with Ek
PlotPiecewise(fPiecewise,fDomains);
PlotConjugacy(fPiecewise,fDomains,6);