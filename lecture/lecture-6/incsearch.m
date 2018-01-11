function [ brackets ] = incsearch ( f, min, max, points )
% INCSEARCH: locates roots by incremental search
% Inputs: f = a function of one variable (need not be able to deal with vectors)
%              min = lower bound of range to be searched
%              max = upper bound of range to be searched
%              points = number of search steps
% Outputs: brackets(i, 1) = lower bound for ith bracket
%                  brackets(i, 2) = upper bound for ith bracket
%                  **** if no brackets found, brackets = [] ****
 
nb = 0; brackets = [];   % brackets is initially 0 by 0
x = linspace (min, max, points);
flo = f(x(1));
for i = 2: points
    fhi = f(x(i));
    if sign(flo) ~= sign(fhi)
        nb = nb + 1;
        brackets(nb, 1) = x(i - 1);  brackets(nb, 2) = x(i);
    end    
    flo = fhi;
end
end
